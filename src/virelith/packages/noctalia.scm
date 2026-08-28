;;; Noctalia for Virelith.
;;;
;;; Release packaging of Noctalia v5, following the upstream Guix recipe
;;; (noctalia.scm in the project repository) but pinned to an immutable
;;; upstream tag instead of the recipe's `(local-file "." ...) / "latest"`
;;; development checkout.  The pinning is: version = tag name, commit =
;;; the tag's peeled commit, sha256 = nar hash of the git-fetch result.
;;;
;;; Deviations from the upstream recipe, each checked against the pinned
;;; source:
;;; - wayland-protocols: the recipe overrides it with a custom 1.48 build,
;;;   but every protocol XML used by v5.0.0-beta.10 already ships in
;;;   Guix's wayland-protocols 1.47, so the system package is used.
;;; - native_optimizations (the -march=native/-mtune=native option)
;;;   defaults to false and is left off; PACKAGING.md forbids it for
;;;   distro builds.
;;; - stb: Guix installs the headers without the stb/ prefix, so the
;;;   recipe's include-path substitution is still required.
;;; - The /bin/sh substitution in tests/process_test.cpp is kept from the
;;;   upstream recipe for parity; the release build does not compile the
;;;   test sources (Meson "tests" is a feature defaulting to "auto",
;;;   which only builds them for debug), so it is currently dormant.
;;;
;;; Runtime integration (compositor autostart, session wiring, ...) is
;;; deliberately left to the config/service layer, not this package.

(define-module (virelith packages noctalia)
               #:use-module (gnu packages calendar)      ; libical
               #:use-module (gnu packages cpp)           ; nlohmann-json, tomlplusplus
               #:use-module (gnu packages crypto)        ; libsodium
               #:use-module (gnu packages curl)          ; curl
               #:use-module (gnu packages fontutils)     ; fontconfig, freetype
               #:use-module (gnu packages freedesktop)   ; wayland, wayland-protocols
               #:use-module (gnu packages gl)            ; mesa
               #:use-module (gnu packages glib)          ; glib, sdbus-c++
               #:use-module (gnu packages gnome)         ; librsvg-for-system, libsecret
               #:use-module (gnu packages gtk)           ; cairo, harfbuzz, pango
               #:use-module (gnu packages image)         ; libjxl, libwebp
               #:use-module (gnu packages jemalloc)
               #:use-module (gnu packages linux)         ; linux-pam, pipewire, wireplumber
               #:use-module (gnu packages markup)        ; md4c
               #:use-module (gnu packages maths)         ; libqalculate
               #:use-module (gnu packages multiprecision) ; gmp, mpfr
               #:use-module (gnu packages pkg-config)
               #:use-module (gnu packages polkit)
               #:use-module (gnu packages pulseaudio)    ; libsndfile
               #:use-module (gnu packages stb)           ; stb-image-resize2, stb-image-write
               #:use-module (gnu packages xdisorg)       ; libxkbcommon
               #:use-module (gnu packages xml)           ; libxml2
               #:use-module (guix build-system meson)
               #:use-module (guix gexp)
               #:use-module (guix git-download)
               #:use-module (guix packages)
               #:use-module ((guix licenses) #:prefix license:))

;; Bump VERSION/COMMIT/SHA256 together when updating the package.
(define %noctalia-version "5.0.0-beta.10")
(define %noctalia-commit "74e6c2790dd8f39bf496e90e479a9ae370846eed")
(define %noctalia-sha256
  (base32 "03s76i5gl62lnzawk8ld4ld74n8vn35crgzp7g6cb3bghfwc8a2s"))

(define-public noctalia
  (package
    (name "noctalia")
    (version %noctalia-version)
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/noctalia-dev/noctalia")
             (commit %noctalia-commit))) ; tag v5.0.0-beta.10
       (file-name (git-file-name name version))
       (sha256 %noctalia-sha256)))
    (build-system meson-build-system)
    (arguments
     (list #:build-type "release"
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'prepare-for-build
                 (lambda _
                   ;; /bin/sh doesn't exist in the build environment.
                   ;; Only matters if the test sources are ever built; the
                   ;; release build skips them (see the module header).
                   (substitute* "tests/process_test.cpp"
                     (("/bin/(sh)" _ cmd)
                      (which cmd)))
                   ;; Adjust import paths for STB headers packaged in Guix
                   ;; (installed without the stb/ prefix).
                   (substitute* (find-files "." "\\.cpp$|^meson\\.build$")
                     (("\\bstb/stb_") "stb_")))))))
    (native-inputs
     (list pkg-config))
    (inputs
     ;; gmp/mpfr are not linked directly: they satisfy the Requires of
     ;; libqalculate.pc, which pkg-config must resolve during configure.
     (list cairo
           curl
           fontconfig
           freetype
           glib
           gmp
           harfbuzz
           jemalloc
           mpfr
           (librsvg-for-system)
           libjxl
           libical
           libqalculate
           libsecret
           libsndfile
           libsodium
           libwebp
           libxkbcommon
           libxml2
           linux-pam
           md4c
           mesa
           nlohmann-json
           pango
           pipewire
           polkit
           sdbus-c++
           stb-image-resize2
           stb-image-write
           tomlplusplus
           wayland
           wayland-protocols
           wireplumber))
    (home-page "https://github.com/noctalia-dev/noctalia")
    (synopsis "Sleek, customizable desktop shell crafted for Wayland")
    (description
     "Noctalia is a desktop shell for Wayland compositors, built directly
on Wayland and OpenGL ES with no Qt or GTK dependency.  It provides bars,
a dock, a launcher, notifications, a lock screen, wallpaper handling and
settings, and it supports compositors such as niri, Hyprland, Sway and
KDE Plasma.")
    (license license:expat)))
