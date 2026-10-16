;;; Offline unit tests for (virelith packages satty).
;;;
;;; Run:  guix repl -L src tests/satty.scm

(use-modules (srfi srfi-64)
             (guix build-system cargo)
             (guix git-download)
             (guix packages)
             (virelith packages satty)
             (virelith packages satty-crates))

(define (input-names package)
  (map car (package-inputs package)))

(test-begin "satty")

(test-equal "package name" "satty" (package-name satty))
(test-equal "latest release version" "0.22.0" (package-version satty))
(test-equal "pinned release commit"
  "9f99065e4177820e965f5475503e5c3bdbd74e6a"
  (git-reference-commit (origin-uri (package-source satty))))
(test-assert "cargo build system"
  (eq? cargo-build-system (package-build-system satty)))
(test-assert "Cargo closure is present"
  (> (length (satty-cargo-inputs 'satty)) 100))
(test-assert "GTK runtime inputs are present"
  (let ((inputs (input-names satty)))
    (and (member "gtk" inputs)
         (member "libadwaita" inputs)
         (member "fontconfig-minimal" inputs)
         (member "libepoxy" inputs))))

(test-end "satty")
