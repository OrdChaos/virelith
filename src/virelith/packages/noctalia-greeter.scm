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
;;; - fix-compositor-cursor-teardown (2026-08-29, not upstream yet): the
;;;   compositor's shutdown path relies on wl_display_destroy(), which
;;;   frees Wayland globals without running their destructors, so the
;;;   wlroots DRM backend never commits the cursor/primary plane disable.
;;;   The hardware cursor plane then survives the compositor handoff as a
;;;   stale "ghost" cursor for the next compositor on the seat (observed
;;;   as a leftover inverted arrow after logging into niri, moving
;;;   together with niri's cursor).  The phase disables outputs and the
;;;   backend explicitly before display destruction; upstream fix to be
;;;   proposed separately.
;;; - fix-compositor-cursor-orientation (2026-08-29, not upstream yet):
;;;   on displays whose effective orientation (synced session transform
;;;   composed with the connector panel orientation) is non-normal, the
;;;   wlroots 0.20 hardware cursor is not rotated to match the display
;;;   (observed as an upside-down greeter cursor while the rest of the
;;;   UI renders correctly).  The phase locks software cursors for such
;;;   outputs only; normal-orientation outputs keep the hardware cursor.

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
                 "exec ${0%/*}/../share/noctalia-greeter/print_greetd_config.sh"))))
          (add-after 'prepare-for-build 'fix-compositor-cursor-teardown
            (lambda _
              ;; Disable all outputs (and the DRM backend) before the
              ;; Wayland display is destroyed at compositor exit.
              ;;
              ;; Upstream's shutdown path only calls wl_display_destroy(),
              ;; which frees the global list without running the globals'
              ;; destructors (libwayland), so wlroots' wlr_output_destroy →
              ;; dealloc_crtc() never runs and the DRM backend never issues
              ;; its final atomic commit disabling the primary/cursor
              ;; planes.  The hardware cursor plane therefore stays enabled
              ;; in KMS state across the compositor handoff: the next
              ;; compositor on the seat (e.g. niri) starts over a stale
              ;; "ghost" cursor showing the greeter's last cursor image.
              ;; Destroying the outputs explicitly triggers the plane
              ;; disable commit; destroying the backend releases the
              ;; session cleanly.  (The greeter session is still active at
              ;; this point, so the logind seat permits the commit.)
              (substitute* "src/compositor/noctalia_compositor.c"
                (("  wl_display_destroy\\(server\\.display\\);\n  return 0;\n}"
                  _ tail)
                 (string-append
                  "  /* Teardown: disable all outputs before destroying the\n"
                  "   * display.  wl_display_destroy() frees globals without\n"
                  "   * running their destructors, so without this the DRM\n"
                  "   * backend never commits the cursor-plane disable and the\n"
                  "   * hardware cursor survives this compositor (\"ghost\n"
                  "   * cursor\" for the next compositor on the seat). */\n"
                  "  struct greeter_output* output;\n"
                  "  struct greeter_output* output_tmp;\n"
                  "  wl_list_for_each_safe(output, output_tmp, &server.outputs, link) {\n"
                  "    wlr_output_destroy(output->wlr_output);\n"
                  "  }\n"
                  "  wlr_backend_destroy(server.backend);\n"
                  tail)))))
          (add-after 'fix-compositor-cursor-teardown 'fix-compositor-cursor-orientation
            (lambda _
              ;; Lock software cursors on outputs whose effective
              ;; orientation is non-normal.
              ;;
              ;; wlroots 0.20 renders the hardware cursor buffer without
              ;; accounting for the connector's panel orientation, and on
              ;; some panels the DRM cursor plane does not receive the
              ;; rotation that the primary content gets.  The result is an
              ;; upside-down (or otherwise rotated) cursor image while the
              ;; rest of the greeter renders correctly — the software
              ;; cursor path is drawn into the properly rotated frame and
              ;; is unaffected.  Compose the synced session transform with
              ;; the connector panel orientation; when the effective
              ;; orientation is non-normal, force the software cursor for
              ;; that output only.  Outputs with a normal orientation keep
              ;; the hardware cursor.
              (substitute* "src/compositor/noctalia_compositor.c"
                (("#include <wlr/backend.h>\n#include <wlr/backend/libinput.h>"
                  _ includes)
                 (string-append
                  includes "\n"
                  "#include <wlr/backend/drm.h>"))
                (("  const enum wl_output_transform transform = transform_for_output\\(server, output->wlr_output->name\\);\n  wlr_output_state_set_transform\\(&state, transform\\);"
                  _ block)
                 (string-append
                  block "\n"
                  "  {\n"
                  "    enum wl_output_transform effective = transform;\n"
                  "    enum wl_output_transform panel =\n"
                  "        wlr_drm_connector_get_panel_orientation(output->wlr_output);\n"
                  "    if (panel != WL_OUTPUT_TRANSFORM_NORMAL) {\n"
                  "      effective = wlr_output_transform_compose(effective, panel);\n"
                  "    }\n"
                  "    if (effective != WL_OUTPUT_TRANSFORM_NORMAL) {\n"
                  "      wlr_output_lock_software_cursors(output->wlr_output, true);\n"
                  "    }\n"
                  "  }\n"))))))))
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
