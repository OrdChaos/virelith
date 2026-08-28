;;; Noctalia Greeter for Virelith.
;;;
;;; Release packaging of noctalia-greeter 1.2.1 (Meson + Ninja), pinned
;;; to an immutable upstream tag: version = tag name, commit = the tag's
;;; peeled commit, sha256 = nar hash of the git-fetch result.
;;;
;;; Only the Meson install is performed here.  The shipped system setup
;;; scripts (setup_greeter_system.sh, setup_greetd_pam.sh, ...) are
;;; installed as package payload but never executed; they patch /etc,
;;; /var and PAM, which is the future service layer's job.  Likewise the
;;; polkit policy is installed under share/polkit-1/actions/ as package
;;; data, and exposing it to the system polkit is left to the service
;;; layer.
;;;
;;; Guix-specific fixes, each checked against the pinned source:
;;; - The Meson release buildtype hardcodes -march=native/-mtune=native;
;;;   PACKAGING.md tells distro packagers not to ship those, so the two
;;;   flags are removed from meson.build while the rest of the release
;;;   profile (-fomit-frame-pointer, gc-sections, ...) is kept.
;;; - wlroots: Guix ships wlroots 0.20.2, which installs the
;;;   wlroots-0.20 pkg-config module the compositor requires; no custom
;;;   wlroots package is needed.
;;; - stb: same include-prefix substitution as the noctalia package
;;;   (Guix installs the header without the stb/ prefix).
;;; - noctalia-greeter-session resolves the greeter and compositor
;;;   relative to its own directory, which fits the Guix store layout
;;;   and is kept as-is.  Its PATH needs (coreutils, dbus-run-session)
;;;   must be provided by the environment that runs it (greetd service);
;;;   without dbus-run-session it degrades gracefully to no session bus.
;;; - noctalia-greeter-print-greetd-config execs its helper through the
;;;   FHS /usr/share path; the exec is rewritten to resolve relative to
;;;   the script's own directory, mirroring upstream's session-script
;;;   design.

(define-module (virelith packages noctalia-greeter)
               #:use-module (gnu packages cpp)             ; nlohmann-json, tomlplusplus
               #:use-module (gnu packages fontutils)       ; fontconfig, freetype
               #:use-module (gnu packages freedesktop)     ; libinput, wayland, wayland-protocols
               #:use-module (gnu packages gl)              ; mesa
               #:use-module (gnu packages glib)            ; glib
               #:use-module (gnu packages gnome)           ; librsvg-for-system
               #:use-module (gnu packages gtk)             ; cairo, gdk-pixbuf, harfbuzz, pango
               #:use-module (gnu packages image)           ; libwebp
               #:use-module (gnu packages pkg-config)
               #:use-module (gnu packages stb)             ; stb-image-resize2
               #:use-module (gnu packages window-management) ; wlroots-0.20
               #:use-module (gnu packages xdisorg)         ; libxkbcommon
               #:use-module (guix build-system meson)
               #:use-module (guix gexp)
               #:use-module (guix git-download)
               #:use-module (guix packages)
               #:use-module ((guix licenses) #:prefix license:))

;; Bump VERSION/COMMIT/SHA256 together when updating the package.
(define %noctalia-greeter-version "1.2.1")
(define %noctalia-greeter-commit
  "bf5feefee3d90922952c1850eebdf93d1c0c7f01")
(define %noctalia-greeter-sha256
  (base32 "10aq5smf2qg1swsafpa7bm2jiwailxz64ks43slim8604yg85ylk"))

(define-public noctalia-greeter
  (package
    (name "noctalia-greeter")
    (version %noctalia-greeter-version)
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/noctalia-dev/noctalia-greeter")
             (commit %noctalia-greeter-commit))) ; tag v1.2.1
       (file-name (git-file-name name version))
       (sha256 %noctalia-greeter-sha256)))
    (build-system meson-build-system)
    (arguments
     (list
      #:build-type "release"
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'prepare-for-build
            (lambda _
              ;; The release buildtype injects -march=native/-mtune=native;
              ;; PACKAGING.md tells distro packagers not to ship those
              ;; (CPU-local codegen).  Drop the two flags, keep the rest
              ;; of the release profile.
              (substitute* "meson.build"
                (("'-march=native', '-mtune=native',\n") ""))
              ;; Adjust import paths for STB headers packaged in Guix
              ;; (installed without the stb/ prefix).
              (substitute* (find-files "." "\\.cpp$|^meson\\.build$")
                (("\\bstb/stb_") "stb_"))
              ;; Resolve the helper script relative to this script, like
              ;; noctalia-greeter-session does for the binaries, instead
              ;; of the FHS /usr/share path.
              ;; (unquoted expansion: store paths contain no whitespace)
              (substitute* "scripts/noctalia-greeter-print-greetd-config"
                (("exec /usr/share/noctalia-greeter/print_greetd_config.sh")
                 "exec ${0%/*}/../share/noctalia-greeter/print_greetd_config.sh")))))))
    (native-inputs
     (list pkg-config))
    (inputs
     ;; gdk-pixbuf/harfbuzz are not linked directly: they satisfy the
     ;; Requires of librsvg-2.0.pc and pango.pc, which pkg-config must
     ;; resolve during configure.
     (list cairo
           fontconfig
           freetype
           gdk-pixbuf
           glib
           harfbuzz
           libinput
           libwebp
           libxkbcommon
           mesa
           nlohmann-json
           pango
           stb-image-resize2
           tomlplusplus
           wayland
           wayland-protocols
           (librsvg-for-system)
           wlroots-0.20))
    (home-page "https://github.com/noctalia-dev/noctalia-greeter")
    (synopsis "Minimal greetd login greeter matching Noctalia Shell's look and feel")
    (description
     "Noctalia Greeter is a minimal login greeter for greetd.  It ships a
Wayland greeter client, a wlroots-based compositor and a session wrapper
that greetd should run as its default session.  It can optionally sync
wallpaper and palette appearance from Noctalia Shell.")
    (license license:expat)))
