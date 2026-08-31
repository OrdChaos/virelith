;;; (virelith download uup) -- Windows Update fixed-output source backend.
;;;
;;; Provides a fixed descriptor for a Windows Update payload (<uup-file>)
;;; and a custom origin method (microsoft-uup-fetch) that produces a
;;; fixed-output derivation whose builder:
;;;
;;;   1. resolves the current signed CDN URL from the Microsoft Windows
;;;      Update service (anonymous SOAP; see resolver.py);
;;;   2. downloads the raw payload bytes from the Microsoft CDN;
;;;   3. lets the Guix daemon verify the fixed-output hash.
;;;
;;; Facts maintainers need to know:
;;;
;;;   * Windows Update FileLocations URLs are short-lived signed URLs;
;;;     they must not be used as package identity.
;;;   * Package identity is the fixed update ID / file digest / hash.
;;;   * The fetcher resolves the locator dynamically, but the fixed-output
;;;     hash pins the content; there is no tracking of "latest" builds.
;;;   * Once the source store item exists, the resolver never runs again.
;;;
;;; The Windows Update endpoints (fe3/fe3cr.delivery.mp.microsoft.com) chain
;;; to Microsoft CAs that are absent from standard CA bundles; the pinned
;;; certificate bundle in certs/uup-ca-bundle.pem is prepended to the
;;; builder's TLS store (contents pinned by this channel, no runtime fetch).

(define-module (virelith download uup)
  #:use-module (guix base32)
  #:use-module (guix gexp)
  #:use-module (guix monads)
  #:use-module (guix packages)
  #:use-module (guix records)
  #:use-module (guix store)           ; %store-monad
  #:use-module (guix utils)           ; search-path
  #:use-module (gnu packages nss)      ; nss-certs (standard CA bundle)
  #:use-module (gnu packages python)  ; python (resolver interpreter)
  #:export (uup-file
            uup-file?
            uup-file-update-id
            uup-file-file-id
            uup-file-file-name
            uup-file-size
            uup-file-sha1
            uup-file-sha256
            microsoft-uup-fetch
            %uup-ca-bundle))

;; A fixed Windows Update payload.  No edition/language discovery, no
;; "latest build" logic: the descriptor says "this exact payload of this
;; exact Windows Update".
(define-record-type* <uup-file>
  uup-file make-uup-file
  uup-file?
  (update-id uup-file-update-id)   ; Windows Update update ID (UUID string)
  (file-id   uup-file-file-id)     ; payload file GUID (content-addressed)
  (file-name uup-file-file-name)   ; payload file name
  (size      uup-file-size)        ; payload size, bytes
  (sha1      uup-file-sha1)        ; payload SHA-1 (WU metadata digest)
  (sha256    uup-file-sha256))     ; expected source hash (nix base32)

(define (uup-data-file name)
  "Return the absolute file name of NAME, a data file shipped with this
module, looked up on %LOAD-PATH (the module search path).  Resolving at run
time instead of relying on source locations keeps the module robust when
compiled."
  (or (and=> (search-path %load-path (string-append "virelith/download/" name))
             canonicalize-path)
      (error "uup: data file not found on %load-path" name)))

(define %uup-ca-bundle
  ;; PEM bundle of the certificates the Windows Update endpoints chain to
  ;; (RSA + ECC intermediates and roots), missing from standard CA bundles.
  ;; Pinned by this channel; shipped as a static file so the builder never
  ;; has to write or fetch it.
  (local-file (uup-data-file "certs/uup-ca-bundle.pem")
              "uup-ca-bundle.pem"))

(define (sanitize-derivation-name name)
  "Return NAME with characters invalid in derivation names replaced."
  (string-map (lambda (c)
                (if (or (char-alphabetic? c) (char-numeric? c)
                        (memv c '(#\+ #\- #\. #\= #\_)))
                    c
                    #\-))
              name))

(define* (microsoft-uup-fetch uup-file hash-algo hash
                              #:optional name
                              #:key (system (%current-system)))
  "Return a fixed-output derivation that downloads the payload described by
UUP-FILE (a <uup-file>) from the Microsoft CDN, resolving the current signed
URL from the Windows Update service inside the builder.  HASH-ALGO/HASH is
the fixed-output hash enforced by the daemon."
  (unless (eq? hash-algo 'sha256)
    (error "microsoft-uup-fetch: expected sha256 hash" hash-algo))
  (unless (string=? (uup-file-sha256 uup-file)
                    (bytevector->nix-base32-string hash))
    (error "microsoft-uup-fetch: descriptor hash does not match origin hash"
           uup-file))
  (mlet %store-monad ((guile (package->derivation (default-guile) system)))
    (gexp->derivation
     (sanitize-derivation-name (or name "uup-fetch"))
     #~(begin
         ;; Standard CA bundle (delivery CDN) plus the pinned Microsoft CAs
         ;; (Windows Update endpoints).  TLS verification stays enabled; the
         ;; fixed-output hash is not a substitute for it.
         (setenv "SSL_CERT_FILE" #$%uup-ca-bundle)
         (setenv "SSL_CERT_DIR"
                 #$(file-append nss-certs "/etc/ssl/certs"))
         (let ((status
                (system* #$(file-append python "/bin/python3")
                         #$(local-file (uup-data-file "resolver.py")
                                       "resolver.py")
                         #$(uup-file-update-id uup-file)
                         #$(uup-file-file-id uup-file)
                         #$(uup-file-file-name uup-file)
                         #$(number->string (uup-file-size uup-file))
                         #$(uup-file-sha1 uup-file)
                         #$output)))
           (unless (zero? status)
             (error "uup resolver failed" status))))
     #:hash-algo hash-algo
     #:hash hash
     #:system system)))
