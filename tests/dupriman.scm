;;; Offline unit tests for (virelith packages dupriman).
;;;
;;; Run:  guix repl -L src tests/dupriman.scm

(use-modules (srfi srfi-64)
             (guix build-system cargo)
             (guix git-download)
             (guix packages)
             (virelith packages dupriman)
             (virelith packages dupriman-crates))

(define (input-names package)
  (map car (package-inputs package)))

(test-begin "dupriman")

(test-equal "package name" "dupriman" (package-name dupriman))
(test-equal "release version" "0.1.0" (package-version dupriman))
(test-equal "pinned release commit"
  "3869f38eb25d4f9e89a69318a5bfeddc8f5149af"
  (git-reference-commit (origin-uri (package-source dupriman))))
(test-assert "cargo build system"
  (eq? cargo-build-system (package-build-system dupriman)))
(test-assert "Cargo closure is present"
  (> (length (dupriman-cargo-inputs 'dupriman)) 80))
(test-assert "CUPS, PDF, and GTK runtime inputs are present"
  (let ((inputs (input-names dupriman)))
    (and (member "cups" inputs)
         (member "qpdf" inputs)
         (member "poppler" inputs)
         (member "gtk" inputs))))

(test-end "dupriman")
