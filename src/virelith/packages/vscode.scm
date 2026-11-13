;;; VS Code for Virelith.
;;;
;;; The channel's only consumer of Nonguix build infrastructure: the
;;; proprietary Microsoft binary is packaged with
;;; (nonguix build-system chromium-binary), which injects the Electron
;;; runtime input set, derives the patchelf plan from WRAPPER-PLAN, and
;;; wraps the binary with the Wayland hint.  All integration (MIME,
;;; default editor, persistence) is deliberately left to the config
;;; layer, not the package.
;;;
;;; Version-locked downloads: update.code.visualstudio.com/<version>/...
;;; redirects to a commit-pinned CDN artifact (code-stable-x64-<build
;;; timestamp>.tar.gz) and keeps serving old versions indefinitely
;;; (verified: 1.85.0 from 2023-12 still returns 200).  This is an
;;; immutable per-version URL, unlike a moving "latest" asset, so the
;;; fixed-output sha256 will not break on upstream refresh.

(define-module (virelith packages vscode)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gtk)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix build-system chromium-binary)
  #:use-module (nonguix licenses)
  #:use-module (ice-9 match))

;; Bump VERSION/SHA256 together when updating the package.
(define %vscode-version "1.145.2")
(define %vscode-sha256
  (base32 "18msrxvi7kdh0zkdjiy4bny96ywg84fq2jwlc3c6y0ps75k2h09v"))
;; The commit id of the same release; used by vscode-server below.
(define %vscode-commit "c4453f8ea430795f941c1b2ff6c9321135a74a02")

(define-public vscode
  (package
    (name "vscode")
    (version %vscode-version)
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://update.code.visualstudio.com/"
             version "/linux-x64/stable"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256 %vscode-sha256)))
    (build-system chromium-binary-build-system)
    (arguments
     (list
      ;; The wrapped binary and bundled libs fail the runpath validation,
      ;; same trade-off as vscodium in nonguix.
      #:validate-runpath? #f
      ;; ~340MB artifact; do not advertise substitutes we cannot provide.
      #:substitutable? #f
      ;; Patch the ELF at VSCode-linux-x64/code: RPATH gets every build
      ;; input's /lib plus $out/opt/vscode/VSCode-linux-x64 for the
      ;; bundled libraries (libffmpeg.so, libEGL.so, ...).
      ;;
      ;; bin/code-tunnel is the standalone CLI behind the `serve-web` and
      ;; `tunnel` subcommands.  cli.js spawns it as a child process, so an
      ;; unpatched copy (upstream ships the FHS interpreter
      ;; /lib64/ld-linux-x86-64.so.2) fails at exec with
      ;; "spawn .../bin/code-tunnel ENOENT" before it can print any help.
      ;; List it here so it gets the same interpreter and RPATH as `code`;
      ;; it lives in opt/ rather than bin/, so the generic install-wrapper
      ;; phase does not wrap it (no wrapper script that could confuse the
      ;; CLI's own re-exec).
      #:wrapper-plan
      #~'(("opt/vscode/VSCode-linux-x64/code"
           (("out" "/opt/vscode/VSCode-linux-x64")))
          ("opt/vscode/VSCode-linux-x64/bin/code-tunnel"
           (("out" "/opt/vscode/VSCode-linux-x64"))))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              ;; The official tarball carries a VSCode-linux-x64/ prefix,
              ;; unlike the VSCodium release asset.
              (mkdir-p "opt/vscode")
              (invoke "tar" "-xvf" source "-C" "opt/vscode")))
          (add-before 'install-wrapper 'install-entrypoint
             (lambda _
               (let* ((bin (string-append #$output "/bin")))
                 (delete-file (string-append #$output "/environment-variables"))
                 (mkdir-p bin)
                 (symlink (string-append #$output
                                         "/opt/vscode/VSCode-linux-x64/code")
                          (string-append bin "/code")))))
          ;; Retain Nonguix's generated runtime wrapper as the private real
          ;; entry point, then mimic the upstream launcher (bin/code inside
          ;; the tarball): run resources/app/out/cli.js via
          ;; ELECTRON_RUN_AS_NODE, in the foreground, with stdout/stderr and
          ;; the exit code passed through.  cli.js detaches on its own for
          ;; GUI invocations (code, code ., code file), so the shell returns
          ;; immediately and quietly, while CLI subcommands (--version,
          ;; --list-extensions, --install-extension, --uninstall-extension,
          ;; --status, --help, --wait, ...) stay synchronous and transparent.
          ;; No argument sniffing: cli.js is the single authority on which
          ;; invocations are terminal commands, for both "--flag value" and
          ;; "--flag=value" forms.
          (add-after 'install-wrapper 'install-cli-launcher
             (lambda _
               (let* ((bin (string-append #$output "/bin"))
                      (code (string-append bin "/code"))
                      (real (string-append bin "/.code-real"))
                      (cli (string-append #$output
                                          "/opt/vscode/VSCode-linux-x64/"
                                          "resources/app/out/cli.js")))
                 (rename-file code real)
                 (call-with-output-file
                     code
                   (lambda (port)
                     (format port "#!~a~%"
                             #$(file-append bash-minimal "/bin/sh"))
                     (format port
                             "ELECTRON_RUN_AS_NODE=1 exec '~a' '~a' \"$@\"~%"
                             real cli)))
                 (chmod code #o555))))
          (add-after 'install-entrypoint 'install-resources
            (lambda _
              (let* ((icons
                      (string-append #$output
                                     "/share/icons/hicolor/512x512/apps"))
                     (icon.png
                      (string-append #$output
                                     "/opt/vscode/VSCode-linux-x64/"
                                     "resources/app/resources/linux/code.png"))
                     (apps (string-append #$output "/share/applications")))
                (mkdir-p icons)
                (symlink icon.png
                         (string-append icons "/code.png"))
                (mkdir-p apps)
                (make-desktop-entry-file
                 (string-append apps "/" #$name ".desktop")
                 #:name "Visual Studio Code"
                 #:generic-name "Text Editor"
                 #:exec (string-append #$output "/bin/code --ozone-platform-hint=auto")
                 #:icon "code"
                 #:type "Application"
                 #:actions '("new-empty-window")
                 #:keywords '("vscode")
                 #:categories '("TextEditor" "Development"
                                "IDE")
                 #:startup-notify #t
                 #:startup-w-m-class "Code"
                 #:comment
                 '(("en" "Code Editing. Redefined.")
                   (#f "Code Editing. Redefined.")))))))))
    (supported-systems '("x86_64-linux"))
    ;; The upstream linux-arm64 channel exists (update.code.visualstudio.com
    ;; /<version>/linux-arm64/stable); add it if ever needed.
    (native-inputs
     (list tar))
    (inputs
     (list gdk-pixbuf))
    (home-page "https://code.visualstudio.com/")
    (synopsis "Code editing. Redefined.")
    (description
     "Visual Studio Code is a proprietary source-code editor developed by
Microsoft.  This package installs the official Linux x64 binary with the
Nonguix Chromium binary build system.")
    (license (nonfree "https://code.visualstudio.com/license"))))

;; ── VS Code Server ──────────────────────────────────────────────────
;; The desktop CLI fetches this tarball at runtime into
;; ~/.vscode/cli/serve-web/<commit> when `code serve-web` or
;; `code tunnel` starts.  The upstream bundle is built for FHS: its
;; bundled `node` has the /lib64 interpreter, so on Guix the server
;; exits with "cannot execute: required file not found" (and the CLI
;; cannot run its prerequisite check either: no ldconfig and no
;; /usr/lib64).  Package the same commit-pinned tarball with `node`
;; patched once here; the config layer then points the CLI at
;; $out/server (the CLI reuses an existing <commit> directory instead
;; of downloading).
;;
;; %VSCODE-COMMIT must stay in sync with the desktop package above.
(define %vscode-server-sha256
  (base32 "024bigzwrfgrwnp7s5z3b73zww60wlyglrj6w6nvvpbfw7wa6qk9"))

(define-public vscode-server
  (package
    (name "vscode-server")
    (version %vscode-version)
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://update.code.visualstudio.com/commit:" %vscode-commit
             "/server-linux-x64-web/stable"))
       (file-name "vscode-server-linux-x64-web.tar.gz")
       (sha256 %vscode-server-sha256)))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (string-append #$output "/server"))
                 (source (assoc-ref %build-inputs "source"))
                 ;; gcc's C++/gcc_s runtime lives in its "lib" output.
                 (glibc-lib
                  (string-append (assoc-ref %build-inputs "glibc") "/lib"))
                 (gcc-lib
                  (string-append (assoc-ref %build-inputs "gcc:lib") "/lib")))
            (mkdir-p out)
            (invoke #$(file-append tar "/bin/tar")
                    "-I" #$(file-append gzip "/bin/gzip")
                    "-xf" source "-C" out "--strip-components=1")
            ;; The bundle's node must not carry the FHS interpreter.
            ;; patchelf 0.16.1 is pinned deliberately: 0.18.0 silently
            ;; corrupts this 126 MB Node binary (segfault at startup) when
            ;; it rewrites the RPATH.
            (invoke (string-append (assoc-ref %build-inputs "patchelf")
                                   "/bin/patchelf")
                    "--set-interpreter"
                    (string-append glibc-lib "/ld-linux-x86-64.so.2")
                    "--set-rpath" (string-append glibc-lib ":" gcc-lib)
                    (string-append out "/node"))))))
    (inputs `(("glibc" ,glibc)
              ("gcc:lib" ,gcc "lib")
              ("tar" ,tar)
              ("gzip" ,gzip)
              ("patchelf" ,(specification->package "patchelf@0.16.1"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://code.visualstudio.com/")
    (synopsis "VS Code Server for web and tunnel clients")
    (description
     "The commit-pinned VS Code Server bundle used by the desktop CLI's
@code{serve-web} and @code{tunnel} subcommands, with its bundled Node.js
runtime patched for Guix.")
    (license (nonfree "https://code.visualstudio.com/license"))))
