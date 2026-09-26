;;; Offline unit tests for (virelith packages nushell).
;;;
;;; Run:  guix repl -L src tests/nushell.scm

(use-modules (srfi srfi-1)
             (srfi srfi-64)
             (guix build-system cargo)
             (guix git-download)
             (guix packages)
             (virelith packages nushell))

(define (argument package name)
  (let loop ((arguments (package-arguments package)))
    (and (pair? arguments)
         (pair? (cdr arguments))
         (or (and (keyword? (car arguments))
                  (eq? (keyword->symbol (car arguments)) name)
                  (cadr arguments))
             (loop (cddr arguments))))))

(define (crate-inputs package)
  (filter (lambda (input)
            (let ((label (car input)))
              (and (string? label)
                   (string-suffix? ".tar.gz" label))))
          (package-inputs package)))

(test-begin "nushell")

(test-equal "package version" "0.115.1" (package-version nushell))
(test-equal "pinned release commit"
  "798c55d19505fd52f205d7eb32a571b9d06ec9e6"
  (git-reference-commit (origin-uri (package-source nushell))))
(test-assert "cargo build system"
  (eq? cargo-build-system (package-build-system nushell)))
(test-assert "full Cargo.lock closure is vendored"
  (= 991 (length (crate-inputs nushell))))
(test-assert "builds workspace plugin binaries"
  (string-contains (object->string (argument nushell 'cargo-build-flags))
                   "--workspace"))
(test-assert "uses zstd library output"
  (any (lambda (input)
         (member "lib" input))
       (package-inputs nushell)))

(test-end "nushell")
