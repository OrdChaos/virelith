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

(test-assert "package tracks v5.3.0"
  (let ((source (package-source noctalia)))
     (and (string=? "5.3.0" (package-version noctalia))
          (string=? "a33122c4208a385e19c9a252e65e2751b2c44fbb"
                   (git-reference-commit (origin-uri source)))
         (null? (origin-patches source)))))

(test-assert "package retains the Meson release build"
  (and (eq? meson-build-system (package-build-system noctalia))
       (string-contains (object->string (package-arguments noctalia))
                        "release")))

(test-end "noctalia")
