;;; ONLYOFFICE Desktop Editors for Virelith.
;;;
;;; Binary repack of the official Linux x64 tarball
;;; (onlyoffice-desktopeditors-x64.tar.xz).  The upstream release ships the
;;; complete runtime — Qt 5, CEF, the converter (x2t), dictionaries, bundled
;;; fonts and web-app resources — so this package treats it as an opaque
;;; prebuilt bundle: bundled libraries are kept bundled (ABI stability),
;;; and only stable system-ABI libraries are supplied from Guix.
;;;
;;; Layout: the runtime tree is installed under
;;; $out/lib/onlyoffice/desktopeditors/ (the /opt/onlyoffice prefix is
;;; dropped; the tarball's internal relative layout is preserved verbatim,
;;; which upstream's Qt/CEF resource discovery depends on), with the
;;; canonical entry point at $out/bin/onlyoffice-desktopeditors.
;;;
;;; ELF handling: every ELF gets its interpreter repointed to Guix glibc
;;; and a complete RUNPATH of
;;;   - $ORIGIN-relative paths to the bundle root and converter/ dirs
;;;     (upstream's own RPATHs are build-machine leftovers such as
;;;     /opt/qt/5.9.9/gcc_64/lib and are replaced),
;;;   - the store lib directories of the curated system-library inputs
;;;     below, chosen by auditing the DT_NEEDED closure of all 80 ELF
;;;     files (no /lib, /usr/lib or /usr/local fallbacks remain).
;;; RUNPATH validation stays enabled as the enforcement for the above.
;;;
;;; Upstream quirks, each with its removal condition:
;;; - platforminputcontexts/libqtvirtualkeyboardplugin.so DT_NEEDEDs
;;;   libQt5Quick.so.5 and libQt5Qml.so.5, which this tarball does not
;;;   ship: the plugin cannot load in any environment, so it is deleted
;;;   (remove this phase if upstream starts shipping the two libraries).
;;; - converter/libkernel_network.so hardcodes /usr/bin/curl for plugin
;;;   downloads; a store path is longer than the embedded string and
;;;   cannot be patched safely.  Recorded as a known limitation — the
;;;   online plugin manager is expected to fail while everything else
;;;   works.  No FHS compatibility namespace is introduced for this.
;;;
;;; Runtime integration: the launcher wrapper only sets what the
;;;   application needs to run under niri + xwayland-satellite:
;;;   - QT_QPA_PLATFORM=xcb: upstream binary is an X11/XCB application;
;;;   - FONTCONFIG_FILE: an early fontconfig call inside the bundle
;;;     resolves the default config before FcInit establishes the
;;;     current config, fails with "Cannot load default config file:
;;;     No such file: (null)" (deterministically reproduced at every
;;;     launch), and leaves that early init config-less.  The wrapper
;;;     points FONTCONFIG_FILE at the store fontconfig's own config so
;;;     every init path resolves; the user config chain
;;;     (conf.d/50-user.conf -> ~/.config/fontconfig/fonts.conf) is
;;;     still loaded from there (verified with FC_DEBUG).
;;;   - GST_PLUGIN_SYSTEM_PATH/GST_PLUGIN_SCANNER: QtMultimedia uses the
;;;     GStreamer backend for embedded media playback; the plugin scanner
;;;     must not probe FHS paths;
;;;   - PATH: coreutils (template helper) and xdg-utils (xdg-open,
;;;     xdg-user-dir) used by upstream's own launcher script.
;;;   Input-method variables are deliberately not set: the session's
;;;   XMODIFIERS/fcitx5 configuration is inherited as-is.
;;;
;;; Known cosmetic warning (no fix in the package): DesktopEditors logs
;;;   "gtk_disable_setlocale() must be called before gtk_init()" — the
;;;   application's own GTK init order (gtk_disable_setlocale called
;;;   after gtk_init); upstream behavior, harmless, removal condition is
;;;   upstream fixing their init order.
;;;
;;; Fonts: 9.4.0 no longer ships CUSTOM_FONTS_PATH.  Document fonts flow
;;; through fontconfig (used by the core and by CEF's embedded config,
;;; which scans XDG_DATA_DIRS); the wrapper only sets FONTCONFIG_FILE
;;; (see the runtime-integration note above), no font dir/search-path
;;; variables.  Bundled Office-compatible fonts (Carlito, Caladea,
;;; OpenSans) live in the bundle's fonts/ directory.
;;;
;;; Persistence (~/.config/onlyoffice, ~/.local/share/onlyoffice) and
;;; MIME default-editor wiring are deliberately left to the config
;;; layer, like vscode; the package itself only ships the runtime, the
;;; desktop entry and the icons.

(define-module (virelith packages onlyoffice)
  #:use-module (gnu packages base)            ; coreutils
  #:use-module (gnu packages bash)            ; bash-minimal
  #:use-module (gnu packages cups)            ; cups
  #:use-module (gnu packages fontutils)       ; fontconfig, freetype
  #:use-module (gnu packages freedesktop)     ; xdg-utils
  #:use-module (gnu packages gcc)             ; gcc:lib (libstdc++, libgcc_s)
  #:use-module (gnu packages gl)              ; mesa (libGL, libgbm)
  #:use-module (gnu packages glib)            ; glib, dbus
  #:use-module (gnu packages gnome)           ; libnotify
  #:use-module (gnu packages gstreamer)       ; gstreamer, gst-plugins-base/good
  #:use-module (gnu packages gtk)             ; gtk+, pango, cairo, at-spi2-core
  #:use-module (gnu packages linux)           ; alsa-lib, libdrm, eudev
  #:use-module (gnu packages nss)             ; nss, nspr
  #:use-module (gnu packages pulseaudio)      ; pulseaudio
  #:use-module (gnu packages xdisorg)         ; libxkbcommon
  #:use-module (gnu packages xml)             ; expat
  #:use-module (gnu packages xorg)            ; libx11, libxcb, libxext, ...
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix build-system binary))

;; Bump VERSION/SHA256 together when updating the package.
;;
;; The GitHub release asset is immutable per tag, so the fixed-output
;; sha256 is stable.  An aarch64 tarball exists
;; (onlyoffice-desktopeditors-aarch64.tar.xz); add a per-architecture
;; source selection if that target is ever needed.
(define %onlyoffice-version "9.4.0")
(define %onlyoffice-sha256
  (base32 "0p37cvm8jfwcyv5wvijn0x18dy1qh8z6hcmdrmalf9qidigx6m6h"))

;; Bundled-tree constant, kept next to the source pin because both the
;; patchelf phase and the install plan depend on it.
(define %bundle-root "opt/onlyoffice/desktopeditors")

;; Packages whose store lib directories provide the DT_NEEDED system
;; libraries (audited against the 9.4.0 tarball); referenced by package
;; object (file-append) rather than by build-input label, since labels
;; follow package names which change across Guix revisions (e.g.
;; fontconfig is a hidden package named "fontconfig-minimal").  nss is
;; handled separately: its shared objects live under lib/nss.
;;
;; dlopen-by-name exception: Chromium's device::UdevLoader dlopens
;; "libudev.so.1" (and the legacy "libudev.so.0") without an FHS
;; fallback; when neither resolves, its fallback SystemUdevLoader also
;; fails and UdevLoader::Get() CHECK-crashes with SIGTRAP at startup
;; (reproduced; verified via LD_LIBRARY_PATH bisect).  dlopen consults
;; the caller's RUNPATH, so eudev joins the list purely to expose
;; libudev through the store RUNPATH — it is not a DT_NEEDED member.
(define %runtime-lib-packages
  (list glib
        eudev
        libx11
        libxcb
        libxext
        libxi
        libxfixes
        libxdamage
        libxcomposite
        libxrandr
        libsm
        libice
        libxkbcommon
        freetype
        fontconfig
        alsa-lib
        pulseaudio
        gtk+
        pango
        cairo
        at-spi2-core
        dbus
        cups
        nspr
        libnotify
        libdrm
        mesa
        expat
        gstreamer
        gst-plugins-base))

(define-public onlyoffice-desktopeditors
  (package
    (name "onlyoffice-desktopeditors")
    (version %onlyoffice-version)
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v"
             version "/onlyoffice-desktopeditors-x64.tar.xz"))
       (file-name (string-append name "-" version ".tar.xz"))
       (sha256 %onlyoffice-sha256)))
    (build-system binary-build-system)
    (arguments
     (list
      ;; ~1.4GB output; do not advertise substitutes we cannot provide.
      #:substitutable? #f
      ;; Upstream ships release binaries without debug sections.  Stripping
      ;; must stay off: on the interpreter-patched executables, patchelf
      ;; 0.16's string-table rewrite followed by binutils strip leaves the
      ;; .dynstr section outside every PT_LOAD segment, which breaks both
      ;; the loader layout and Guix's gremlin RUNPATH validator (reproduced
      ;; with x2t/DesktopEditors/editors_helper).
      #:strip-binaries? #f
      #:install-plan
      #~'(("opt/onlyoffice/desktopeditors" "lib/onlyoffice/desktopeditors")
          ("usr/bin/onlyoffice-desktopeditors" "bin/onlyoffice-desktopeditors")
          ("usr/share/applications/onlyoffice-desktopeditors.desktop"
           "share/applications/onlyoffice-desktopeditors.desktop")
          ("usr/share/icons" "share/icons")
          ("usr/share/licenses" "share/licenses")
          ("usr/share/doc" "share/doc"))
      ;; The build-side phases use srfi-1 (make-list) and srfi-13
      ;; (string-count, string-contains, ...), which the builder does
      ;; not import by default.
      #:modules '((nonguix build binary-build-system)
                  (guix build utils)
                  (nonguix build utils)
                  (srfi srfi-1)
                  (srfi srfi-13))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              ;; The tarball's top level is opt/ + usr/.  gnu-build-system's
              ;; default unpack chdirs into the first subdirectory (opt/),
              ;; which would hide usr/ from the install plan and break the
              ;; patchelf paths below; extract flat into the build dir
              ;; instead (same approach as the vscode package).
              (invoke "tar" "-xvf" source)))
          (add-before 'patchelf 'drop-unresolvable-qt-plugin
            (lambda _
              ;; This plugin cannot load in any environment: the tarball
              ;; lacks the libQt5Quick/libQt5Qml libraries it links
              ;; (see the module header).  Delete it so the strict
              ;; RUNPATH validation can stay enabled.  Remove this phase
              ;; if a future tarball ships those libraries.
              (delete-file-recursively
               (string-append #$%bundle-root
                              "/platforminputcontexts/"
                              "libqtvirtualkeyboardplugin.so"))))
          (replace 'patchelf
            (lambda* (#:key inputs #:allow-other-keys)
              (define libc (assoc-ref inputs "libc"))
              (define interpreter
                ;; The explicit x86-64 pattern avoids glibc's 32-bit
                ;; ld-linux.so.2, which also lives in lib/.
                (car (find-files libc "ld-linux-x86-64.*\\.so")))
              (define store-lib-dirs
                ;; Resolved from the package objects on the host side (see
                ;; %runtime-lib-packages); only glibc comes from the
                ;; "libc" build input, and libstdc++/libgcc_s from gcc's
                ;; "lib" output.
                (list (string-append libc "/lib")
                      (string-append #$(gexp-input gcc "lib") "/lib")
                      #$@(map (lambda (package)
                                (file-append package "/lib"))
                              %runtime-lib-packages)
                      #$(file-append nss "/lib/nss")))
              ;; $ORIGIN path from a file's directory back to the bundle
              ;; root; the relative layout is preserved in the output, so
              ;; these stay valid after installation.  The bundle root
              ;; "opt/onlyoffice/desktopeditors" contains two path
              ;; separators, hence the "- 2".
              (define (root-relative dir)
                (let ((depth (- (string-count dir #\/) 2)))
                  (if (zero? depth)
                      "$ORIGIN"
                      (string-append "$ORIGIN"
                                     (apply string-append
                                            (make-list depth "/.."))))))
              (define (patch-elf file)
                (let* ((dir (substring file 0 (string-rindex file #\/)))
                       (root (root-relative dir))
                       (converter
                        (if (string-suffix? "/converter" dir)
                            "$ORIGIN"
                            (string-append root "/converter"))))
                  (unless (string-contains file ".so")
                    (invoke "patchelf" "--set-interpreter"
                            interpreter file))
                  (invoke "patchelf" "--set-rpath"
                          (string-join (cons* root converter store-lib-dirs)
                                       ":")
                          file)))
              (for-each patch-elf
                        (find-files #$%bundle-root
                                    (lambda (file stat)
                                      (elf-file? file))))))
          (add-after 'install 'rewrite-entry-points
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out
                                         "/bin/onlyoffice-desktopeditors"))
                     (desktop
                      (string-append out "/share/applications/"
                                     "onlyoffice-desktopeditors.desktop")))
                ;; Keep upstream's launcher script; rewrite its install
                ;; prefix and prepend the runtime environment.  QT_QPA_PLATFORM
                ;; pins the XCB platform for xwayland-satellite; the GST
                ;; variables give QtMultimedia's GStreamer backend its Guix
                ;; plugin set and scanner (avoids FHS probing); PATH makes
                ;; the script's own helpers (mkdir/cp, xdg-user-dir) and
                ;; CEF's xdg-open handler deterministic.
                (substitute* bin
                  (("SOURCE_DIR=\"/opt/onlyoffice/desktopeditors")
                   ;; Template seeding reads the converter templates
                   ;; relative to the runtime prefix (the remainder of the
                   ;; line, converter/empty/$TEMPLATE_LANG", stays).
                   (string-append
                    "SOURCE_DIR=\"" out "/lib/onlyoffice/desktopeditors"))
                  (("^APP_PATH=/opt/onlyoffice/desktopeditors")
                   ;; No trailing "$" anchor: substitute* matches against
                   ;; lines that still carry their terminating newline.
                   (string-append
                    "APP_PATH=" out "/lib/onlyoffice/desktopeditors\n"
                    "export QT_QPA_PLATFORM=xcb\n"
                    ;; See the FONTCONFIG_FILE note in the header.
                    "export FONTCONFIG_FILE="
                    #$(file-append fontconfig "/etc/fonts/fonts.conf")
                    "\n"
                    "export GST_PLUGIN_SYSTEM_PATH="
                    #$(file-append gst-plugins-base "/lib/gstreamer-1.0")
                    ":"
                    #$(file-append gst-plugins-good "/lib/gstreamer-1.0")
                    "\n"
                    "export GST_PLUGIN_SCANNER="
                    #$(file-append gstreamer
                                   "/libexec/gstreamer-1.0/gst-plugin-scanner")
                    "\n"
                    "export PATH="
                    #$(file-append coreutils "/bin")
                    ":"
                    #$(file-append xdg-utils "/bin")
                    "${PATH:+:$PATH}")))
                ;; Desktop entry: repoint Exec to the wrapper for the main
                ;; entry and all four new-document actions, and declare
                ;; TryExec.  Everything else (localized actions, MimeType,
                ;; StartupWMClass) stays upstream's.
                (substitute* desktop
                  (("^Exec=/usr/bin/onlyoffice-desktopeditors")
                   (string-append "Exec=" bin))
                  (("^Icon=onlyoffice-desktopeditors")
                   (string-append "Icon=onlyoffice-desktopeditors\n"
                                  "TryExec=" bin)))
                ;; binary-build-system's install-plan copies single files
                ;; with copy-file, which does not preserve the source's
                ;; mode: the upstream launcher arrives without its
                ;; executable bit and both direct invocation and the
                ;; desktop Exec fail with "command not found"/exec error.
                ;; Restore 0755.  Removal condition: upstream
                ;; binary-build-system's file copy preserving modes.
                (chmod bin #o755)))))))
    (supported-systems '("x86_64-linux"))
    (inputs
     (list (list gcc "lib")                ; libstdc++.so.6, libgcc_s.so.1
           glib
           libx11
           libxcb
           libxext
           libxi
           libxfixes
           libxdamage
           libxcomposite
           libxrandr
           libsm
           libice
           libxkbcommon
           freetype
           fontconfig
           alsa-lib
           pulseaudio
           gtk+
           pango
           cairo
           at-spi2-core                    ; libatk-1.0, libatk-bridge, libatspi
           dbus
           cups
           nss
           nspr
           libnotify
           libdrm
           mesa
           expat
           gstreamer
           gst-plugins-base
           gst-plugins-good                ; runtime plugin set for playbin
           xdg-utils                       ; xdg-open, xdg-user-dir
           coreutils                       ; launcher script helpers
           bash-minimal))                  ; /bin/sh for the launcher shebang
    (home-page "https://www.onlyoffice.com/desktop.aspx")
    (synopsis "Office suite with online document editors")
    (description
     "ONLYOFFICE Desktop Editors is a free office suite combining text,
spreadsheet, presentation and PDF form editors.  This package installs the
official prebuilt Linux x64 release: the bundled Qt and CEF runtimes are kept
as-is, and the system libraries it links are supplied from Guix.  Run
@command{onlyoffice-desktopeditors}.")
    (license license:agpl3)))
