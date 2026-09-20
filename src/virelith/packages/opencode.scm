;;; OpenCode CLI for Virelith.
;;;
;;; Binary packaging of the official Linux glibc release.  OpenCode is built
;;; as a single Bun executable.  Both stripping and patchelf corrupt its
;;; embedded payload, so the binary is preserved byte-for-byte and launched
;;; explicitly through Guix's glibc loader.  The x86-64 package uses upstream's
;;; baseline build because x86_64-linux does not imply AVX2 support.  ripgrep
;;; is put on PATH to prevent OpenCode from downloading its own copy, and
;;; self-updates are disabled so Guix remains the package manager.

(define-module (virelith packages opencode)
  #:use-module (gnu packages base) ;glibc
  #:use-module (gnu packages bash) ;bash-minimal
  #:use-module (gnu packages rust-apps) ;ripgrep
  #:use-module (guix build utils) ;modify-phases
  #:use-module (guix download) ;url-fetch
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (ice-9 match)
  #:use-module (nonguix build-system binary)
  #:export (opencode-bin))

;; Bump VERSION and both architecture hashes together when updating.
(define %opencode-version
  "1.18.31")
(define %opencode-x86-64-sha256
  (base32 "116w3v8s29309qdpsghcgf5ln5yj7g7956dpni5j5z76x7dyi0xj"))
(define %opencode-aarch64-sha256
  (base32 "1rib0ix96kgw24hbqlgpr6azwvc2dxgwg7qd5ic4hx12dgs35qyl"))

(define (%opencode-loader)
  (file-append glibc
               (match (%current-system)
                 ("x86_64-linux" "/lib/ld-linux-x86-64.so.2")
                 ("aarch64-linux" "/lib/ld-linux-aarch64.so.1"))))

(define-public opencode-bin
  (package
    (name "opencode-bin")
    (version %opencode-version)
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/anomalyco/opencode/releases/download/v"
             version "/opencode-linux-"
             (match (%current-system)
               ("x86_64-linux" "x64-baseline")
               ("aarch64-linux" "arm64")) ".tar.gz"))
       (file-name (string-append name
                                 "-"
                                 version
                                 "-"
                                  (%current-system)
                                  ".tar.gz"))
       (sha256
        (match (%current-system)
          ("x86_64-linux" %opencode-x86-64-sha256)
          ("aarch64-linux" %opencode-aarch64-sha256)))))
    (build-system binary-build-system)
    (arguments
     (list
      #:substitutable? #f
      #:strip-binaries? #f
      ;; RUNPATH validation cannot model the launcher-supplied glibc path.
      #:validate-runpath? #f
      #:install-plan
      #~'(("opencode" "libexec/opencode/opencode-real"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-launcher
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (program (string-append out
                               "/libexec/opencode/opencode-real"))
                     (launcher (string-append bin "/opencode")))
                (mkdir-p bin)
                (call-with-output-file launcher
                  (lambda (port)
                    (format port "#!~a~%"
                            #$(file-append bash-minimal "/bin/sh"))
                    (format port "export PATH=~a/bin${PATH:+:}$PATH~%"
                            #$ripgrep)
                    (display "export OPENCODE_DISABLE_AUTOUPDATE=true\n" port)
                    (format port
                     "exec ~a --argv0 opencode --library-path ~a/lib ~a \"$@\"~%"
                     #$(%opencode-loader)
                     #$glibc program)))
                (chmod launcher #o555)))))))
    (inputs (list bash-minimal glibc ripgrep))
    (supported-systems '("x86_64-linux" "aarch64-linux"))
    (home-page "https://opencode.ai/")
    (synopsis "AI coding agent built for the terminal")
    (description
     "OpenCode is an open-source AI coding agent with an interactive terminal
interface, language-server integration, and support for multiple model
providers.  This package installs the official prebuilt GNU/Linux executable
for the current architecture.")
    (license license:expat)))
