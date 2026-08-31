;;; Offline unit tests for the (virelith download uup) backend and the
;;; font-microsoft-win11-* packages (fod-hans + office-core).
;;;
;;; Run:  guix repl -L src tests/uup.scm
;;;
;;; These tests never touch the network: no Windows Update, no CDN.
;;; (The daemon connection is the local store socket.)

(use-modules (srfi srfi-1)
             (srfi srfi-64)
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

;; ── font-microsoft-win11-office-core ────────────────────────────
(test-group "office-core"
  (define src (package-source font-microsoft-win11-office-core))
  (define desc (origin-uri src))

  (test-equal "office-core update-id is pinned"
    "d922b79f-142d-4cf8-896b-515abfd01e66"
    (uup-file-update-id desc))
  (test-equal "office-core file-id is pinned"
    "c0f2c730-7e7a-4f93-b36b-e94fbb042453"
    (uup-file-file-id desc))
  (test-equal "office-core file-name is pinned"
    "Microsoft-Windows-Client-Desktop-Required-Package.ESD"
    (uup-file-file-name desc))
  (test-equal "office-core size is pinned"
    814894129
    (uup-file-size desc))
  (test-equal "office-core sha1 is pinned"
    "74cd7dc782926a4bce55345d8e28f8ff3f8568fe"
    (uup-file-sha1 desc))
  (test-equal "office-core sha256 is pinned"
    "143xzai7qcw31qssq25whkbch410nnykzvpgxl6bc8pg86w0h2v7"
    (uup-file-sha256 desc))
  (test-eq "office-core method is microsoft-uup-fetch"
    microsoft-uup-fetch
    (origin-method src))
  (test-equal "office-core origin hash matches descriptor"
    (uup-file-sha256 desc)
    (bytevector->nix-base32-string
     (content-hash-value (origin-hash src))))
  (test-assert "office-core origin lowers to a fixed-output derivation"
    (with-store store
      (let ((drv (run-with-store store (origin->derivation src))))
        (test-assert "office-core derivation is fixed-output"
          (fixed-output-derivation? drv))
        (test-eq "office-core output hash algorithm is sha256"
          'sha256
          (derivation-output-hash-algo
           (assoc-ref (derivation-outputs drv) "out")))
        (test-equal "office-core output hash equals pinned hash"
          (nix-base32-string->bytevector (uup-file-sha256 desc))
          (derivation-output-hash
           (assoc-ref (derivation-outputs drv) "out")))
        #t)))
  ;; ONLYOFFICE official acceptance gate: the 6 core filenames must be in
  ;; the extraction allowlist.
  (for-each
   (lambda (basename)
     (test-assert (string-append "allowlist contains " basename)
       (member basename %office-core-font-files)))
   '("arial.ttf" "calibri.ttf" "cour.ttf"
     "symbol.ttf" "times.ttf" "wingding.ttf"))
  (test-equal "allowlist has 27 entries"
    27
    (length %office-core-font-files))
  ;; Chinese base fonts present in the allowlist.
  (for-each
   (lambda (basename)
     (test-assert (string-append "allowlist contains " basename)
       (member basename %office-core-font-files)))
   '("msyh.ttc" "simsun.ttc" "simsunb.ttf")))

;; Evaluation of this module performs no network I/O; the only external
;; interaction is the local store socket used above.
(define %fail-count (test-runner-fail-count (test-runner-get)))
(test-end "uup-backend")

(exit (if (zero? %fail-count) 0 1))
