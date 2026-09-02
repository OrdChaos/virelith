;;; Offline unit tests for (virelith packages secure-boot).
;;;
;;; Run:  guix repl -L src tests/secure-boot.scm
;;;
;;; These tests never touch the network: no downloads, and lowering only
;;; computes derivations against the local store socket (no build).

(use-modules (srfi srfi-1)
             (srfi srfi-14)             ; char-set-contains?
             (srfi srfi-64)
             (guix base32)              ; %nix-base32-charset
             (guix build-system copy)
             (guix derivations)         ; derivation?
             (guix gexp)                ; computed-file?, lower-object
             (guix monads)              ; mlet, run-with-store
             (guix packages)            ; package-*
             (guix store)               ; open-connection
             ((guix licenses) #:prefix license:)
             (virelith packages secure-boot))

(test-begin "secure-boot-certificates")

(test-group "catalog"
  (test-equal "seven pinned certificates"
    7
    (length %microsoft-secure-boot-certs))
  (test-equal "db and KEK entries"
    '(5 2)
    (map (lambda (dir)
           (length (filter (lambda (entry)
                             (string-prefix? (string-append dir "/")
                                             (car entry)))
                           %microsoft-secure-boot-certs)))
         '("db" "KEK")))
  (test-assert "every sha256 is a 52-char nix-base32 string"
    (every (lambda (entry)
             (let ((hash (cdr (cdr entry))))
               (and (= 52 (string-length hash))
                    (every (lambda (c)
                             (char-set-contains? %nix-base32-charset c))
                           (string->list hash)))))
           %microsoft-secure-boot-certs))
  (test-assert "upstream dir matches install dir"
    (every (lambda (entry)
             (string-prefix? (string-append (dirname (car entry)) "/")
                             (car (cdr entry))))
           %microsoft-secure-boot-certs)))

(test-group "package"
  (test-equal "name"
    "microsoft-secure-boot-certificates"
    (package-name microsoft-secure-boot-certificates))
  (test-assert "copy-build-system"
    (eq? copy-build-system
         (package-build-system microsoft-secure-boot-certificates)))
  (test-assert "source is a computed-file"
    (computed-file? (package-source microsoft-secure-boot-certificates)))
  (test-assert "public-domain license"
    (eq? license:public-domain
         (package-license microsoft-secure-boot-certificates))))

(test-group "lowering"
  (test-assert "package lowers to a derivation without building"
    (run-with-store (open-connection)
      (mlet %store-monad ((drv (lower-object
                                microsoft-secure-boot-certificates)))
        (return (derivation? drv))))))

;; Evaluation of this module performs no network I/O; the only external
;; interaction is the local store socket used above.
(define %fail-count (test-runner-fail-count (test-runner-get)))
(test-end "secure-boot-certificates")

(exit (if (zero? %fail-count) 0 1))
