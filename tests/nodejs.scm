;;; Offline unit tests for (virelith packages nodejs).
;;;
;;; Run:  guix repl -L src tests/nodejs.scm
;;;
;;; Pure record/static assertions: no downloads, no lowering, no build.

(use-modules (srfi srfi-64)
             (guix packages)             ; package-*
             ((guix licenses) #:prefix license:) ; license-name
             (guix build-system)            ; build-system-name
             (virelith packages nodejs))

(test-runner-current (test-runner-simple))

(test-begin "nodejs")

(test-assert "pnpm: package shape"
             (and (package? pnpm)
                  (string=? "pnpm" (package-name pnpm))
                  (string=? "11.21.0" (package-version pnpm))
                  (eq? (quote binary) (build-system-name (package-build-system pnpm)))
                  (string=? "https://pnpm.io" (package-home-page pnpm))
                  (string=? "Expat" (license:license-name (package-license pnpm)))))

(test-assert "pnpm: linux-only, x64/arm64"
             (equal? '("x86_64-linux" "aarch64-linux")
                     (package-supported-systems pnpm)))

(test-assert "pnpm: SEA binary kept unstripped (embedded blob)"
             (let ((args (object->string (package-arguments pnpm))))
               (and (string-contains args "strip-binaries? #f")
                    (string-contains args "validate-runpath? #f")
                    (string-contains args "patchelf-plan"))))

(test-assert "pnpm: source URI is the release tarball for the build arch"
             (let ((uri (origin-uri (package-source pnpm))))
               (and (string? uri)
                    (string-contains uri "github.com/pnpm/pnpm/releases")
                    (string-contains uri "pnpm-linux-")
                    (string-contains uri ".tar.gz"))))

(test-end "nodejs")
