;;; Offline unit tests for (virelith packages monitoring).
;;;
;;; Run:  guix repl -L src tests/monitoring.scm

(use-modules (srfi srfi-1)
             (srfi srfi-64)
             (guix build-system cmake)
             (guix git-download)
             (guix packages)
             (virelith packages monitoring))

(define (input-names package)
  (map (compose package-name cadr) (package-inputs package)))

(test-begin "monitoring")

(test-group "nvtop"
  (test-equal "package name" "nvtop"
    (package-name nvtop))
  (test-equal "pinned source revision"
    "3d4a953da02bc18886734613bb9f60ff80669de7"
    (git-reference-commit (origin-uri (package-source nvtop))))
  (test-assert "cmake build system"
    (eq? cmake-build-system (package-build-system nvtop)))
  (test-assert "exports embeddable source tree"
    (member "source" (package-outputs nvtop)))
  (test-assert "uses DRM and libudev"
    (let ((names (input-names nvtop)))
      (and (member "libdrm" names)
           (member "eudev" names)))))

(test-end "monitoring")
