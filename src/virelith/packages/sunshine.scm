;;; Sunshine — self-hosted game stream host for Moonlight.
;;;
;;; Ported from the panther channel's `(px packages video)' implementation
;;; (Franz Geffke, GPL-3.0-or-later), adapted to virelith:
;;;   - Sunshine calls FFmpeg's private codec bitstream API (ff_cbs_*), so
;;;     it links against LizardByte's purpose-built static FFmpeg instead
;;;     of Guix's shared FFmpeg;
;;;   - third-party submodules are separate origins (no git submodules at
;;;     build time);
;;;   - the web UI is built by npm/vite in a fixed-output derivation, then
;;;     handed to CMake; upstream's npm target is disabled;
;;;   - systemd/udev probing is disabled (Guix System has no systemd), the
;;;     udev rules are installed into lib/udev/rules.d for the system
;;;     service to consume.
;;;
;;; CUDA is disabled: the build uses VAAPI (and software encoding); the
;;; Wayland (wlr-screencopy) and X11 capture backends are enabled.

(define-module (virelith packages sunshine)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (gnu packages admin)          ;libcap
  #:use-module (gnu packages avahi)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages cpp)            ;nlohmann-json
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)    ;wayland
  #:use-module (gnu packages gl)             ;mesa
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)          ;libnotify
  #:use-module (gnu packages linux)          ;pipewire、numactl
  #:use-module (gnu packages node)
  #:use-module (gnu packages nss)            ;nss-certs
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)   ;python-setuptools
  #:use-module (gnu packages python-xyz)     ;python-jinja2
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)            ;openssl
  #:use-module (gnu packages upnp)           ;miniupnpc
  #:use-module (gnu packages video)          ;libva、libvdpau
  #:use-module (gnu packages xdisorg)        ;libdrm
  #:use-module (gnu packages xiph)           ;opus
  #:use-module (gnu packages xorg)           ;libevdev、libx*
  #:export (sunshine))

(define %sunshine-version "2026.1018.5342")

(define (sunshine-submodule name url commit hash)
  (origin
    (method git-fetch)
    (uri (git-reference
          (url url)
          (commit commit)
          (recursive? #t)))
    (file-name (git-file-name (string-append "sunshine-" name) %sunshine-version))
    (sha256 (base32 hash))))

;; Only `package-lock.cmake' out of this one is used, so skip its submodules --
;; they carry a full FFmpeg source tree.
(define sunshine-build-deps
  (origin
    (method git-fetch)
    (uri (git-reference
          (url "https://github.com/LizardByte/build-deps")
          (commit "d0ac5ef4b7673a8d8d2b03981ab5226cbf25810c")))
    (file-name (git-file-name "sunshine-build-deps" %sunshine-version))
    (sha256
     (base32 "1a0aw1c9bq8w999dw4mgi964bwxggxrp773niwnn5b1mvhjfvypn"))))

(define sunshine-simple-web-server
  (sunshine-submodule "Simple-Web-Server"
                      "https://github.com/LizardByte-infrastructure/Simple-Web-Server"
                      "546895a93a29062bb178367b46c7afb72da9881e"
                      "1hbwlbw1ll3cd56br90q9af742r6457r822wnf7yiwaam999k2xh"))

(define sunshine-glad
  (sunshine-submodule "glad"
                      "https://github.com/Dav1dde/glad"
                      "73db193f853e2ee079bf3ca8a64aa2eaf6459043"
                      "0c9cygiq35aiq6bpdvbwqs0wxc2dvxsh4jnx50466savscxalsk9"))

(define sunshine-libdisplaydevice
  (sunshine-submodule "libdisplaydevice"
                      "https://github.com/LizardByte/libdisplaydevice"
                      "a2afc0430d44223c25a2ebc598000f78b338aa52"
                      "01d817g76chyilnbi12rzdfa64z2zzi5sxab0gx8wv54fjfcs5v0"))

(define sunshine-libvirtualhid
  (sunshine-submodule "libvirtualhid"
                      "https://github.com/LizardByte/libvirtualhid"
                      "dfff3ea8c34022c915799740806c17c0ed5c2492"
                      "13a7sdvyqy88227m4cl027kg5nn1pzliqbkkkxc6kw3scwrqvqcj"))

(define sunshine-lizardbyte-common
  (sunshine-submodule "lizardbyte-common"
                      "https://github.com/LizardByte/lizardbyte-common"
                      "f9d91e1d29b7473f58e43acde4579da4e56c4abe"
                      "0f3xjnmnb3537v4dkdnykm6dzcl3kdvdmzvyvw56giaqzdjvbqwj"))

(define sunshine-moonlight-common-c
  (sunshine-submodule "moonlight-common-c"
                      "https://github.com/moonlight-stream/moonlight-common-c"
                      "aeba988e0a302145eff2e70fa3e11cd98ec01f5d"
                      "1v31whwqyb33f7yyx7c1fgnjj148cxpxvbhw43vhqw594d305cm8"))

(define sunshine-plasma-wayland-protocols
  (sunshine-submodule "plasma-wayland-protocols"
                      "https://github.com/KDE/plasma-wayland-protocols"
                      "c5ac4db818f4a575a6ccfe0065b73ecfaba6e93e"
                      "0g456mwvva4algzjwal4rrkld51pckxbci3rjd94cd5qxp9ssjnq"))

(define sunshine-tray
  (sunshine-submodule "tray"
                      "https://github.com/LizardByte/tray"
                      "c1f2a8ab56dd399b881fb7aeab4fe4fc9c58188d"
                      "1fxg7d728bkavsnfx4bh9bac81jfjzyrv6affm5mvi4mzwblf6hq"))

(define sunshine-wayland-protocols
  (sunshine-submodule "wayland-protocols"
                      "https://github.com/LizardByte-infrastructure/wayland-protocols"
                      "ee78491a237eaff9389a0ccf8680521d074407d3"
                      "1810ymkhgxhrslmllz4zkadi71mjpa7srw4wm1kq22vqp08rp04i"))

(define sunshine-wlr-protocols
  (sunshine-submodule "wlr-protocols"
                      "https://github.com/LizardByte-infrastructure/wlr-protocols"
                      "bf4fc79abc359eea5a0edec0ac6d4a2b2955f82a"
                      "1wr3d6m2ykjpz4cq5zzmm6hfaxrysxf3rki3hhkzd025lsdd2vfl"))

(define sunshine-source
  (origin
    (method git-fetch)
    (uri (git-reference
          (url "https://github.com/LizardByte/Sunshine")
          (commit "3d6e1d6008bd4a24906283ab25fcd0becc0a1c07")))
    (file-name (git-file-name "sunshine" %sunshine-version))
    (sha256
     (base32 "1sc9ch1r67igjlp1khs3vhnsg095hfqsklrvgfs7abmy3w9hi7k9"))))

;; Sunshine calls FFmpeg's private codec bitstream API (ff_cbs_*), so it cannot
;; link against a normal shared FFmpeg.  Upstream downloads a purpose-built
;; static FFmpeg at configure time; take the same archive here and hand it to
;; cmake via FFMPEG_PREPARED_BINARIES.  The tag must match the commit that
;; third-party/build-deps is pinned to in the Sunshine release.
(define sunshine-ffmpeg
  (package
    (name "sunshine-ffmpeg")
    (version "2026.1017.131201")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/LizardByte/build-deps/releases/download/v"
                           version "/Linux-x86_64-ffmpeg.tar.gz"))
       (sha256
        (base32 "05c83x8kkmmdd1q5ad4xqyh9fgr1kclpbjwa0fv9rf0arccm3pmj"))))
    (build-system copy-build-system)
    (arguments
     (list #:strip-binaries? #f
           #:validate-runpath? #f
           #:install-plan #~'(("include" "include")
                              ("lib" "lib"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/LizardByte/build-deps")
    (synopsis "Static FFmpeg build used by Sunshine")
    (description
     "Pre-built static FFmpeg libraries published by the LizardByte project,
including the @code{libcbs} archive that exposes FFmpeg's internal codec
bitstream API.  Sunshine links against these.")
    (license (list license:lgpl2.1+ license:gpl2+))))

;; The web UI is built by npm/vite, which resolves its dependency tree over the
;; network.  Do that in a fixed-output derivation, then hand the result to the
;; cmake build; upstream's own `npm ci' target is disabled below.
(define sunshine-web-ui
  (computed-file
   "sunshine-web-ui"
   (with-imported-modules '((guix build utils))
     #~(begin
         (use-modules (guix build utils))
         (setenv "PATH" (string-append #$node "/bin:" (getenv "PATH")))
         (setenv "HOME" "/tmp")
         (setenv "SSL_CERT_DIR" (string-append #$nss-certs "/etc/ssl/certs"))
         (setenv "SSL_CERT_FILE"
                 (string-append #$nss-certs "/etc/ssl/certs/ca-certificates.crt"))
         (copy-recursively #$sunshine-source "/tmp/sunshine")
         (for-each make-file-writable
                   (find-files "/tmp/sunshine" #:directories? #t))
         (with-directory-excursion "/tmp/sunshine"
           ;; The Codecov plugin uploads bundle statistics to a third party
           ;; during the build.
           (substitute* "vite.config.js"
             (("^import \\{ codecovVitePlugin \\}.*") "")
             (("codecovVitePlugin\\(\\{" all)
              "((() => null))({"))
           (invoke "npm" "ci" "--ignore-scripts")
           ;; Run vite directly; `npm run build' would need a shell.
           (invoke "node" "node_modules/vite/bin/vite.js" "build"))
         (copy-recursively "/tmp/sunshine/build" #$output)))
   #:options `(#:hash-algo sha256
               #:hash ,(base32 "1sshr0l269m127sskbpqp1f9v2fmi45z67bs65ikgmzr2i80fa7n")
               #:recursive? #t)))

(define-public sunshine
  (package
    (name "sunshine")
    (version %sunshine-version)
    (source sunshine-source)
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-Wno-dev"
              "-DBUILD_DOCS=OFF"
              "-DBUILD_TESTS=OFF"
              "-DBOOST_USE_STATIC=OFF"
              "-DSUNSHINE_ENABLE_CUDA=OFF"
              "-DSUNSHINE_ENABLE_VULKAN=OFF"
              ;; Jinja2 and setuptools come from native-inputs, so glad must
              ;; not try to pip-install them.
              "-DGLAD_SKIP_PIP_INSTALL=ON"
              (string-append "-DFFMPEG_PREPARED_BINARIES=" #$sunshine-ffmpeg)
              "-DSUNSHINE_PUBLISHER_NAME=virelith"
              "-DSUNSHINE_PUBLISHER_WEBSITE=https://github.com/ordchaos/virelith"
              "-DSUNSHINE_PUBLISHER_ISSUE_URL=https://github.com/ordchaos/virelith/issues"
              ;; Guix System has no systemd; ship only the udev rules.
              "-DUDEV_FOUND=ON"
              "-DUDEV_RULES_INSTALL_DIR=lib/udev/rules.d"
              "-DSYSTEMD_FOUND=OFF"
              (string-append "-DSUNSHINE_EXECUTABLE_PATH=" #$output "/bin/sunshine"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'unpack-submodules
            (lambda _
              (define (install-submodule name source)
                (let ((target (string-append "third-party/" name)))
                  (mkdir-p target)
                  (copy-recursively source target)
                  (for-each make-file-writable
                            (find-files target #:directories? #t))))
              (install-submodule "build-deps" #$sunshine-build-deps)
              (install-submodule "Simple-Web-Server" #$sunshine-simple-web-server)
              (install-submodule "glad" #$sunshine-glad)
              (install-submodule "libdisplaydevice" #$sunshine-libdisplaydevice)
              (install-submodule "libvirtualhid" #$sunshine-libvirtualhid)
              (install-submodule "lizardbyte-common" #$sunshine-lizardbyte-common)
              (install-submodule "moonlight-common-c" #$sunshine-moonlight-common-c)
              (install-submodule "plasma-wayland-protocols"
                                 #$sunshine-plasma-wayland-protocols)
              (install-submodule "tray" #$sunshine-tray)
              (install-submodule "wayland-protocols" #$sunshine-wayland-protocols)
              (install-submodule "wlr-protocols" #$sunshine-wlr-protocols)))
          (add-after 'unpack 'patch-wlgrab-vulkan
            (lambda _
              ;; SUNSHINE_ENABLE_VULKAN=OFF leaves two vk:: references
              ;; unguarded in wlgrab.cpp (the capture-modifier helper and
              ;; the VRAM encode device); replace them with neutral code
              ;; so the build links without the Vulkan encoder.
              (substitute* "src/platform/linux/wlgrab.cpp"
                (("return vk::make_avcodec_encode_device_vram\\(width, height, 0, 0\\);")
                 "return std::make_unique<platf::avcodec_encode_device_t>();")
                (("encoder_modifiers = vk::get_supported_capture_modifiers\\(\\);")
                 "encoder_modifiers = {};"))))
          (add-after 'unpack 'patch-cmake
            (lambda _
              ;; The web UI is supplied by `sunshine-web-ui'; drop upstream's
              ;; npm target instead of letting it reach for the network.
              (substitute* "cmake/targets/common.cmake"
                (("find_program\\(NPM npm REQUIRED\\)") "")
                (("add_custom_target\\(web-ui ALL") "add_custom_target(web-ui"))
              ;; Both probe for FHS install directories; they are passed in as
              ;; cache variables instead.
              (substitute* "cmake/packaging/linux.cmake"
                (("find_package\\(Systemd\\)") "")
                (("find_package\\(Udev\\)") ""))
              ;; Without systemd there is no unit to start.
              (substitute* "packaging/linux/dev.lizardbyte.app.Sunshine.desktop"
                (("/usr/bin/env systemctl start --u app-@PROJECT_FQDN@")
                 "sunshine"))))
          (add-after 'unpack 'set-build-version
            (lambda _
              ;; Without these the version is derived from git, which is not
              ;; available here.
              (setenv "BRANCH" "master")
              (setenv "BUILD_VERSION" #$%sunshine-version)))
          (add-after 'install 'remove-desktop-files
            (lambda* (#:key outputs #:allow-other-keys)
              (use-modules (guix build utils))
              ;; This configuration starts Sunshine from the shell; do not
              ;; install any XDG menu entries.
              (let ((out (assoc-ref outputs "out")))
                (for-each (lambda (name)
                            (let ((path (string-append out
                                                       "/share/applications/"
                                                       name)))
                              (when (file-exists? path)
                                (delete-file path))))
                          '("dev.lizardbyte.app.Sunshine.desktop"
                            "dev.lizardbyte.app.Sunshine.kwin.desktop"
                            "dev.lizardbyte.app.Sunshine.terminal.desktop")))))
          (add-after 'configure 'install-web-ui
            (lambda _
              ;; cmake installs the vite output from the build directory.
              (copy-recursively #$sunshine-web-ui (getcwd))
              (for-each make-file-writable
                        (find-files "assets" #:directories? #t)))))))
    (native-inputs
     (list pkg-config
           python-jinja2
           python-setuptools
           python-wrapper
           wayland))
    (inputs
     (list avahi
           boost
           curl
           glib
           libcap
           libdrm
           libevdev
           libnotify
           libva
           libvdpau
           libx11
           libxcb
           libxfixes
           libxi
           libxrandr
           libxtst
           mesa
           miniupnpc
           nlohmann-json
           numactl
           openssl
           opus
           pipewire
           pulseaudio
           qtbase
           qtsvg
           wayland))
    (supported-systems '("x86_64-linux"))
    (home-page "https://app.lizardbyte.dev/Sunshine")
    (synopsis "Self-hosted game stream host for Moonlight")
    (description
     "Sunshine is a self-hosted game stream host for Moonlight clients.  It
offers low latency cloud gaming server capabilities with support for AMD, Intel
and Nvidia GPUs for hardware encoding; software encoding is also available.  A
web interface is provided for configuration and client pairing.")
    (license license:gpl3)))
