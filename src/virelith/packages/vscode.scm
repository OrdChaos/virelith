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
  #:use-module (gnu packages base)
  #:use-module (gnu packages gtk)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (nonguix build-system chromium-binary)
  #:use-module (nonguix licenses)
  #:use-module (ice-9 match))

(define-public vscode
  (package
    (name "vscode")
    (version "1.134.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://update.code.visualstudio.com/"
             version "/linux-x64/stable"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cvpyfaabglpc0g7xblc7syhdnr0n13rklyscb5g29zmg401fdlk"))))
    (build-system chromium-binary-build-system)
    (arguments
     (list
      ;; The wrapped binary and bundled libs fail the runpath validation,
      ;; same trade-off as vscodium in nonguix.
      #:validate-runpath? #f
      ;; ~150MB artifact; do not advertise substitutes we cannot provide.
      #:substitutable? #f
      ;; Patch the ELF at VSCode-linux-x64/code: RPATH gets every build
      ;; input's /lib plus $out/opt/vscode/VSCode-linux-x64 for the
      ;; bundled libraries (libffmpeg.so, libEGL.so, ...).
      #:wrapper-plan
      #~'(("opt/vscode/VSCode-linux-x64/code"
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
