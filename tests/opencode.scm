;;; Offline unit tests for (virelith packages opencode).
;;;
;;; Run:  guix repl -L src tests/opencode.scm
;;;
;;; Pure record/static assertions: no downloads, no lowering, no build.

(use-modules (srfi srfi-1)
             (srfi srfi-64)
             (guix build-system)
             ((guix licenses) #:prefix license:)
             (guix packages)
             (virelith packages opencode))

(define (input-names package)
  (map (compose package-name cadr) (package-inputs package)))

(test-runner-current (test-runner-simple))

(test-begin "opencode")

(test-assert "opencode-bin: package shape"
  (and (package? opencode-bin)
       (string=? "opencode-bin" (package-name opencode-bin))
       (string=? "1.18.33" (package-version opencode-bin))
       (eq? 'binary
            (build-system-name (package-build-system opencode-bin)))
       (string=? "https://opencode.ai/" (package-home-page opencode-bin))
       (string=? "Expat"
                 (license:license-name (package-license opencode-bin)))))

(test-equal "opencode-bin: linux-only, x64/arm64"
  '("x86_64-linux" "aarch64-linux")
  (package-supported-systems opencode-bin))

(test-assert "opencode-bin: immutable release asset for the build architecture"
  (let ((uri (origin-uri (package-source opencode-bin))))
    (and (string? uri)
         (string-contains uri
                          "github.com/anomalyco/opencode/releases/download/v1.18.33")
         (not (string-contains uri "/latest/download/"))
         (string-suffix? ".tar.gz" uri)
         (if (string=? (%current-system) "x86_64-linux")
             (string-contains uri "opencode-linux-x64-baseline.tar.gz")
             (string-contains uri "opencode-linux-arm64.tar.gz")))))

(test-assert "opencode-bin: Bun payload preserved and loader launched"
  (let ((args (object->string (package-arguments opencode-bin))))
    (and (string-contains args "strip-binaries? #f")
         (string-contains args "validate-runpath? #f")
         (not (string-contains args "patchelf-plan"))
         (string-contains args "install-launcher")
         (string-contains args "--library-path")
         (string-contains args "OPENCODE_DISABLE_AUTOUPDATE")
         (string-contains args "ripgrep"))))

(test-assert "opencode-bin: complete runtime inputs"
  (let ((names (input-names opencode-bin)))
    (and (member "bash-minimal" names)
         (member "glibc" names)
         (member "ripgrep" names))))

(test-end "opencode")
