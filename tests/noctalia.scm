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

(test-assert "package tracks v5.4.1"
  (let ((source (package-source noctalia)))
     (and (string=? "5.4.1" (package-version noctalia))
          (string=? "815aebe1cfd79c9a18197441eea92f0b275035fc"
                   (git-reference-commit (origin-uri source)))
         (null? (origin-patches source)))))

(test-assert "package retains the Meson release build"
  (and (eq? meson-build-system (package-build-system noctalia))
       (string-contains (object->string (package-arguments noctalia))
                        "release")))

(test-end "noctalia")
