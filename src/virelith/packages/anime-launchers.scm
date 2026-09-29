;;; An Anime Game Launcher and Sleepy Launcher for Virelith.
;;;
;;; Both launchers come from the same upstream team, share the relm4 +
;;; GTK4/libadwaita template and are published as a single dynamically
;;; linked ELF binary.  They are packaged from the signed release assets
;;; (hence the "-bin" suffix) because their only non-crates.io dependency,
;;; anime-launcher-sdk, is a Git-only crate that the channel's offline
;;; Cargo machinery does not vendor.
;;;
;;; The upstream binary is linked against a distro GTK stack, so
;;; (nonguix build-system binary) rewrites its interpreter and RUNPATH to
;;; the exact Guix inputs below.  The binary registers the GApplication id
;;; moe.launcher.* and derives its About icon from the icon theme, so the
;;; desktop entry and icon installed here must use that same id.
;;;
;;; Bump a launcher's VERSION and asset/icon SHA256s together when updating.

(define-module (virelith packages anime-launchers)
  #:use-module (gnu packages compression)     ;bzip2
  #:use-module (gnu packages freedesktop)     ;wayland
  #:use-module (gnu packages gcc)             ;gcc:lib (libgcc_s)
  #:use-module (gnu packages glib)            ;glib (gio/gobject)
  #:use-module (gnu packages gnome)           ;libadwaita
  #:use-module (gnu packages gtk)             ;cairo, gdk-pixbuf, gtk, pango
  #:use-module (guix build utils)             ;modify-phases, make-desktop-entry-file
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (nonguix build-system binary)
  #:export (anime-game-launcher-bin
            sleepy-launcher-bin))

;; Runtime inputs shared by both launchers: every NEEDED entry of the release
;; binary except the glibc family, which the launcher-supplied interpreter
;; resolves.  "gcc:lib" supplies libgcc_s.so.1; the remaining names are the
;; direct GTK stack dependencies.  Listed with explicit labels because the
;; build phase looks them up by name.
(define %anime-launcher-inputs
  (list `("gcc:lib" ,gcc "lib")
        `("bzip2" ,bzip2)
        `("cairo" ,cairo)
        `("gdk-pixbuf" ,gdk-pixbuf)
        `("glib" ,glib)
        `("gtk" ,gtk)
        `("libadwaita" ,libadwaita)
        `("pango" ,pango)
        `("wayland" ,wayland)))

(define %anime-launcher-runpath
  '("bzip2" "cairo" "gcc:lib" "gdk-pixbuf" "glib" "gtk"
    "libadwaita" "pango" "wayland"))

(define* (anime-launcher-bin
          #:key
          name
          program
          version
          asset
          asset-sha256
          icon-sha256
          app-id
          display-name
          game
          keywords
          description
          repo)
  "Return a package for the PROGRAM release binary of an An Anime Team
launcher, pinned to VERSION and the fixed-output ASSET-SHA256."
  (define unpacked (string-append program "-" version))
  (define icon (string-append app-id ".png"))
  (define comment (string-append "Play and update " game " on Linux"))
  (package
    (name name)
    (version version)
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/" repo
                           "/releases/download/" version "/" asset))
       (file-name unpacked)
       (sha256 (base32 asset-sha256))))
    (build-system binary-build-system)
    (arguments
     (list
      ;; Upstream already strips the release build; keep the pinned asset
      ;; byte-for-byte so the fixed-output hash stays meaningful.
      #:strip-binaries? #f
      ;; Built locally from a downloaded asset: there is no substitute cache.
      #:substitutable? #f
      #:patchelf-plan
      #~(list (list #$unpacked (list #$@%anime-launcher-runpath)))
      #:install-plan
      #~(list (list #$unpacked #$(string-append "bin/" program)))
      #:phases
      #~(modify-phases %standard-phases
          ;; The copied release asset keeps its read-only store permissions;
          ;; patchelf needs to rewrite its interpreter and RUNPATH.
          (add-before 'patchelf 'make-binary-writable
            (lambda _
              (chmod #$unpacked #o755)))
          (add-after 'install 'install-desktop-integration
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (icon (assoc-ref inputs #$icon))
                     (icons (string-append out
                                           "/share/icons/hicolor/512x512/apps"))
                     (apps (string-append out "/share/applications")))
                (mkdir-p icons)
                (copy-file icon (string-append icons "/" #$icon))
                (make-desktop-entry-file
                 (string-append apps "/" #$app-id ".desktop")
                 #:name #$display-name
                 #:exec (string-append out "/bin/" #$program)
                 #:icon #$app-id
                 #:categories '("Game")
                 #:keywords (list #$@keywords)
                 #:startup-w-m-class #$app-id
                 #:comment (list (list #f #$comment)
                                 (list "en" #$comment)))))))))
    (native-inputs
     (list
      (origin
        (method url-fetch)
        (uri (string-append "https://raw.githubusercontent.com/" repo
                            "/" version "/assets/images/icon.png"))
        (file-name icon)
        (sha256 (base32 icon-sha256)))))
    (inputs %anime-launcher-inputs)
    (supported-systems '("x86_64-linux"))
    (home-page (string-append "https://github.com/" repo))
    (synopsis (string-append "Unofficial " game " launcher for Linux"))
    (description description)
    (license license:gpl3)))

(define-public anime-game-launcher-bin
  (anime-launcher-bin
   #:name "anime-game-launcher-bin"
   #:program "anime-game-launcher"
   #:version "3.19.8"
   #:asset "anime-game-launcher"
   #:asset-sha256 "0f8d1mnwzpvildc0jr7v5wsdk0pm7lv870zlqvvfsc32s9hk5c6l"
   #:icon-sha256 "0x7pxq9w7h7qbxr0h7rjawhmqg93360ibaib6x130xq97k7vzrz2"
   #:app-id "moe.launcher.an-anime-game-launcher"
   #:display-name "An Anime Game Launcher"
   #:game "Genshin Impact"
   #:keywords '("aagl")
   #:description
   "An Anime Game Launcher is an unofficial launcher for Genshin Impact on
Linux.  It installs and updates the game, prepares a Wine prefix with DXVK,
and can disable the game's telemetry.  This package installs the official
prebuilt GNU/Linux executable."
   #:repo "an-anime-team/an-anime-game-launcher"))

(define-public sleepy-launcher-bin
  (anime-launcher-bin
   #:name "sleepy-launcher-bin"
   #:program "sleepy-launcher"
   #:version "1.7.1"
   #:asset "sleepy-launcher"
   #:asset-sha256 "0zqdshigxhzrdvqxs4z8zsxbdc4r0k2xz3jvaic1snq8z58ngirz"
   #:icon-sha256 "06k8xdr8p9gakq1jaj6s930frvn4qrizn9ryrq2ymrrxa1m975bv"
   #:app-id "moe.launcher.sleepy-launcher"
   #:display-name "Sleepy Launcher"
   #:game "Zenless Zone Zero"
   #:keywords '("sl")
   #:description
   "Sleepy Launcher is an unofficial launcher for Zenless Zone Zero on Linux
with telemetry disabling.  It installs and updates the game and prepares a
Wine prefix with DXVK.  This package installs the official prebuilt
GNU/Linux executable."
   #:repo "an-anime-team/sleepy-launcher"))
