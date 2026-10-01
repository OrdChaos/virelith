;;; Prism Launcher for Virelith.
;;;
;;; Audit notes (pinned Guix = 230f6f6509de616c999ed13faaa5430088ca6dbd):
;;;
;;; - Upstream is a CMake project (Qt 6.4+, C++23) whose source needs the
;;;   libraries/libnbtplusplus submodule, hence the recursive git-fetch.
;;;   The pinned Guix has qtbase 6.9.2, cmark 0.31.2, tomlplusplus 3.4.0,
;;;   libarchive, qrencode and gamemode 1.8.2, so no extra packages are
;;;   vendored.  QuaZip is *not* a dependency: MMCZip.cpp only uses
;;;   libarchive.
;;; - The integrated Java runtime downloader is disabled explicitly with
;;;   -DLauncher_ENABLE_JAVA_DOWNLOADER=OFF.  (Upstream already defaults it
;;;   off on GNU/Linux, but we pin the invariant.)  Java is *not* shipped:
;;;   the package declares a PRISMLAUNCHER_JAVA_PATHS search path so the
;;;   JDKs contributed by the config layer's (guixcfg apps java) unit are
;;;   discovered, and Prism's default "java" candidate resolves through the
;;;   session PATH.  Guaranteeing Java is the application layer's job.
;;; - Only a build-time JDK is needed: libraries/launcher and
;;;   libraries/javacheck are Java sources compiled with javac.  Upstream
;;;   compiles them with "-target 7 -source 7", which current JDKs reject,
;;;   so the flag is rewritten to "-target 8 -source 8" (JDK 21 supports
;;;   release 8).  This keeps the bundled jars runnable on the Java 8 that
;;;   the config layer exposes for old Minecraft versions.
;;; - launcher/CMakeLists.txt turns every warning into an error.  Recent
;;;   GCC reports bogus array-bounds diagnostics in Qt headers, so -Werror
;;;   is stripped rather than papering over individual warnings.
;;; - lspci (GPU discovery) and xrandr (LWJGL 2 backend gate) are looked up
;;;   by name; both are put on the wrapper's PATH.  Qt plugins and the X11,
;;;   PulseAudio and Mesa libraries the launcher probes for are exposed via
;;;   QT_PLUGIN_PATH and LD_LIBRARY_PATH.
;;; - The launcher caches the detected Java path and signature in
;;;   prismlauncher.cfg.  A Guix reconfigure can move the JDK's store path,
;;;   so the wrapper scrubs the cached Java identity before every launch.
;;; - The upstream Batch icon set is not free (no selling/hosting/renting),
;;;   so the license list carries it as nonfree, like the other channels.

(define-module (virelith packages prismlauncher)
  #:use-module (gnu packages aidc)           ;qrencode
  #:use-module (gnu packages backup)         ;libarchive
  #:use-module (gnu packages base)           ;sed
  #:use-module (gnu packages bash)           ;bash-minimal
  #:use-module (gnu packages compression)    ;zlib
  #:use-module (gnu packages cpp)            ;tomlplusplus
  #:use-module (gnu packages gl)             ;mesa
  #:use-module (gnu packages java)           ;openjdk21
  #:use-module (gnu packages kde-frameworks) ;extra-cmake-modules
  #:use-module (gnu packages linux)          ;gamemode
  #:use-module (gnu packages man)            ;scdoc
  #:use-module (gnu packages markup)         ;cmark
  #:use-module (gnu packages pciutils)       ;lspci
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)     ;pulseaudio
  #:use-module (gnu packages qt)             ;qtbase, qt5compat, ...
  #:use-module (gnu packages xorg)           ;libx11, libxext, ...
  #:use-module (guix build-system cmake)
  #:use-module (guix gexp)                   ;#~
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (nonguix licenses)            ;nonfree
  #:export (prismlauncher))

(define-public prismlauncher
  (package
    (name "prismlauncher")
    (version "11.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/PrismLauncher/PrismLauncher")
             (commit version)
             (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dm1fdb2z6jyb04ml2jxdqgaxr14a6a4i41r89fdpg22ngx12kkk"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-DLauncher_ENABLE_JAVA_DOWNLOADER=OFF")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'disable-werror
            (lambda _
              ;; Do not let GCC's array-bounds false positives fail the build.
              (substitute* "launcher/CMakeLists.txt"
                (("-Werror") ""))))
          (add-before 'configure 'lower-java-target
            (lambda _
              ;; "-target 7" is rejected by modern javac; release 8 keeps the
              ;; bundled launcher jars runnable on the config layer's Java 8.
              (substitute* '("libraries/javacheck/CMakeLists.txt"
                             "libraries/launcher/CMakeLists.txt")
                (("-target 7 -source 7") "-target 8 -source 8"))))
          (add-after 'install 'wrap-runtime-paths
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (program (string-append out "/bin/prismlauncher"))
                     (xrandr (assoc-ref inputs "xrandr"))
                     (pciutils (assoc-ref inputs "pciutils"))
                     (qtwayland (assoc-ref inputs "qtwayland"))
                     (qtsvg (assoc-ref inputs "qtsvg")))
                (wrap-program program
                  ;; lspci feeds GPU discovery, xrandr gates LWJGL 2's backend.
                  `("PATH" ":" prefix
                    (,(string-append xrandr "/bin")
                     ,(string-append pciutils "/bin")))
                  `("QT_PLUGIN_PATH" ":" prefix
                    (,(string-append qtwayland "/lib/qt6/plugins")
                     ,(string-append qtsvg "/lib/qt6/plugins")))
                  `("LD_LIBRARY_PATH" ":" prefix
                    (,@(map (lambda (dep)
                              (string-append (assoc-ref inputs dep) "/lib"))
                            '("libx11" "libxext" "libxcursor" "libxrandr"
                              "libxxf86vm" "pulseaudio" "mesa")))))
                ;; A rebuilt JDK changes its store path; drop the cached
                ;; identity so the launcher re-detects Java on next start.
                (substitute* program
                  (("^exec")
                   (string-append
                    "cfg=\"${XDG_DATA_HOME:-$HOME/.local/share}"
                    "/PrismLauncher/prismlauncher.cfg\"\n"
                    "if [ -f \"$cfg\" ]; then "
                    #$(file-append sed "/bin/sed")
                    " -i -e '/^JavaVersion/d' -e '/^JavaSignature/d' "
                    "\"$cfg\"; fi\n"
                    "exec")))))))))
    (native-inputs
     (list extra-cmake-modules
           pkg-config
           scdoc
           `(,openjdk21 "jdk")))          ;javac for the bundled jars
    (inputs
     (list bash-minimal                   ;for wrap-program
           cmark
           gamemode
           libarchive
           libx11
           libxcursor
           libxext
           libxrandr
           libxxf86vm
           mesa
           pciutils                       ;lspci
           pulseaudio
           qrencode
           qt5compat
           qtbase
           qtnetworkauth
           qtsvg
           qtwayland
           sed                            ;config scrubbing in the wrapper
           tomlplusplus
           xrandr
           zlib))
    ;; Let the profile expose the JDKs that the config layer contributes
    ;; (e.g. (openjdk21 "jdk")) to Prism's own Java search path.  Java itself
    ;; is never a dependency of this package.
    (search-paths
     (list (search-path-specification
            (variable "PRISMLAUNCHER_JAVA_PATHS")
            (file-type 'regular)
            (files '("bin/java")))))
    (home-page "https://prismlauncher.org/")
    (synopsis "Free, open source launcher for Minecraft")
    (description
     "Prism Launcher allows you to have multiple, separate instances of
Minecraft, each with their own mods, texture packs, saves, etc, and helps you
manage them and their associated options with a simple interface.  The
integrated Java runtime downloader is disabled and no Java runtime is bundled;
Java is expected to be provided by the environment.")
    (license
     (list license:gpl3          ;PolyMC, launcher
           license:expat         ;MinGW runtime, lionshead, tomlc99
           license:lgpl3         ;Qt 6
           license:lgpl3+        ;libnbt++
           license:lgpl2.1+      ;rainbow (KGuiAddons)
           license:isc           ;Hoedown
           license:silofl1.1     ;Material Design Icons
           license:lgpl2.1       ;libqrencode
           license:public-domain ;xz-minidec, murmur2, xz-embedded
           license:bsd-3         ;ColumnResizer, O2, gamemode, localpeer
           license:asl2.0        ;classparser, systeminfo
           ;; Batch icon set (nonfree: no selling/hosting/renting):
           (nonfree "file://COPYING.md")))))
