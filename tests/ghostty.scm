;;; Offline unit tests for (virelith packages ghostty).

(use-modules (srfi srfi-1)
             (srfi srfi-64)
             (guix build-system zig)
             (guix git-download)
             (guix packages)
             (virelith packages ghostty)
             (virelith packages ghostty-dependencies))

(test-begin "ghostty")

(test-equal "package version" "1.3.1" (package-version ghostty))
(test-equal "pinned release commit" "v1.3.1"
  (git-reference-commit (origin-uri (package-source ghostty))))
(test-assert "Zig build system"
  (eq? zig-build-system (package-build-system ghostty)))
(test-equal "locked Zig dependency closure" 36
  (length ghostty-zig-dependencies))
(test-assert "dependency origins are direct inputs"
  (let ((inputs (package-inputs ghostty)))
    (every (lambda (dependency)
             (assoc (origin-file-name (cdr dependency)) inputs))
           ghostty-zig-dependencies)))

(test-end "ghostty")
