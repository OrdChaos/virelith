;;; Offline unit tests for (virelith packages noctalia).
;;;
;;; Run:  guix repl -L src tests/noctalia.scm
;;;
;;; Pure record/static assertions: no downloads, no lowering, no build.

(use-modules (srfi srfi-64)
             (guix build-system meson)
             (guix git-download)
             (guix packages)
             (virelith packages noctalia))

(test-runner-current (test-runner-simple))

(test-begin "noctalia")

(test-assert "package tracks v5.1.0 with the post-release icon fix"
  (let ((source (package-source noctalia)))
    (and (string=? "5.1.0" (package-version noctalia))
         (string=? "c7b9197af77ff22bfb9a83c52a95643a1d90ca86"
                   (git-reference-commit (origin-uri source)))
         (= 1 (length (origin-patches source)))
         (string-contains (object->string (origin-patches source))
                          "noctalia-icon-theme-fallback.patch"))))

(test-assert "package retains the Meson release build"
  (and (eq? meson-build-system (package-build-system noctalia))
       (string-contains (object->string (package-arguments noctalia))
                        "release")))

(test-end "noctalia")
