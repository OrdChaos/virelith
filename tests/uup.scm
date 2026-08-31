;;; Offline unit tests for the (virelith download uup) backend and the
;;; font-microsoft-win11-fod-hans package.
;;;
;;; Run:  guix repl -L src tests/uup.scm
;;;
;;; These tests never touch the network: no Windows Update, no CDN.
;;; (The daemon connection is the local store socket.)

(use-modules (srfi srfi-64)
             (guix base32)
             (guix derivations)
             (guix monads)
             (guix packages)
             (guix store)
             (virelith download uup)
             (virelith packages fonts-windows))

(test-begin "uup-backend")

(define source (package-source font-microsoft-win11-fod-hans))
(define descriptor (origin-uri source))

;; --- descriptor fields are fixed --------------------------------
(test-group "descriptor"
  (test-equal "update-id is pinned"
    "d922b79f-142d-4cf8-896b-515abfd01e66"
    (uup-file-update-id descriptor))
  (test-equal "file-id is pinned"
    "a214ba22-d4a1-4dd2-926c-6203a9dde7e3"
    (uup-file-file-id descriptor))
  (test-equal "file-name is pinned"
    "Microsoft-Windows-LanguageFeatures-Fonts-Hans-Package~31bf3856ad364e35~amd64~~.cab"
    (uup-file-file-name descriptor))
  (test-equal "size is pinned"
    43883622
    (uup-file-size descriptor))
  (test-equal "sha1 is pinned"
    "639be6a025e9152f4cb1d957a50dff4e9cd4dde2"
    (uup-file-sha1 descriptor))
  (test-equal "sha256 is a valid nix base32 string"
    "1wlrah47wmfsf6cy8rbz1j968r8ak96lwqkb30if1ac2xc3raf0h"
    (uup-file-sha256 descriptor)))

;; --- origin fields ----------------------------------------------
(test-group "origin"
  (test-eq "method is microsoft-uup-fetch"
    microsoft-uup-fetch
    (origin-method source))
  (test-assert "uri is a <uup-file>"
    (uup-file? descriptor))
  (test-equal "origin sha256 matches descriptor sha256"
    (uup-file-sha256 descriptor)
    (bytevector->nix-base32-string
     (content-hash-value (origin-hash source))))
  (test-equal "origin hash algorithm is sha256"
    'sha256
    (content-hash-algorithm (origin-hash source)))
  (test-equal "origin file-name is the payload file name"
    "Microsoft-Windows-LanguageFeatures-Fonts-Hans-Package~31bf3856ad364e35~amd64~~.cab"
    (origin-file-name source)))

;; --- derivation properties (store daemon, no network) ----------
(test-group "derivation"
  (test-assert "origin lowers to a derivation"
    (with-store store
      (let ((drv (run-with-store store (origin->derivation source))))
        (test-assert "derivation is fixed-output"
          (fixed-output-derivation? drv))
        (test-eq "output hash algorithm is sha256"
          'sha256
          (derivation-output-hash-algo
           (assoc-ref (derivation-outputs drv) "out")))
        (test-equal "output hash equals pinned hash"
          (nix-base32-string->bytevector (uup-file-sha256 descriptor))
          (derivation-output-hash
           (assoc-ref (derivation-outputs drv) "out")))
        (test-assert "derivation name carries the payload name"
          (string-contains (derivation-name drv)
                           "Microsoft-Windows-LanguageFeatures"))
        #t)))
  (test-assert "microsoft-uup-fetch is a procedure"
    (procedure? microsoft-uup-fetch)))

;; Evaluation of this module performs no network I/O; the only external
;; interaction is the local store socket used above.
(define %fail-count (test-runner-fail-count (test-runner-get)))
(test-end "uup-backend")

(exit (if (zero? %fail-count) 0 1))
