;;; Offline unit tests for (virelith packages anime-launchers).
;;;
;;; Run:  guix repl -L src -L <nonguix-checkout> tests/anime-launchers.scm
;;;
;;; Pure record/static assertions: no downloads, no lowering, no build.

(use-modules (srfi srfi-1)
             (srfi srfi-64)
             (guix build-system)
             (guix gexp)
             ((guix licenses) #:prefix license:)
             (guix packages)
             (virelith packages anime-launchers))

(define (input-names package)
  (map car (package-inputs package)))

(define (native-names package)
  (map car (package-native-inputs package)))

(define (arguments-flag package name)
  (let loop ((args (package-arguments package)))
    (and (pair? args)
         (pair? (cdr args))
         (if (eq? (keyword->symbol (car args)) name)
             (cadr args)
             (loop (cddr args))))))

(define (flag-present? package name)
  (let loop ((args (package-arguments package)))
    (and (pair? args)
         (pair? (cdr args))
         (or (eq? (keyword->symbol (car args)) name)
             (loop (cddr args))))))

;; Patchelf/install plans and phases are gexps; approximate-sexp exposes
;; their static structure without lowering or building anything.
(define (plan-string value)
  (object->string (if (gexp? value)
                      (gexp->approximate-sexp value)
                      value)))

(define %runpath-libs
  '("bzip2" "cairo" "gcc:lib" "gdk-pixbuf" "glib" "gtk"
    "libadwaita" "pango" "wayland"))

(define %runtime-inputs
  '("alsa-lib" "bash-minimal" "bzip2" "cairo" "eudev" "gcc:lib"
    "gdk-pixbuf" "git-minimal" "glib" "gst-libav" "gst-plugins-bad"
    "gst-plugins-base" "gst-plugins-good" "gst-plugins-ugly" "gstreamer"
    "gtk" "libadwaita" "libdrm" "libusb" "libx11" "libxext"
    "p7zip" "pango" "pipewire" "pulseaudio" "wayland" "zlib"))

(define (test-launcher package program version app-id)
  (define (name suffix)
    (string-append program ": " suffix))

  (test-assert (name "pinned package shape")
    (and (package? package)
         (string=? (string-append program "-bin") (package-name package))
         (string=? version (package-version package))
         (eq? 'binary (build-system-name (package-build-system package)))
         (eq? license:gpl3 (package-license package))))

  (test-equal (name "x86-64 only")
    '("x86_64-linux")
    (package-supported-systems package))

  (test-assert (name "immutable, version-pinned release asset")
    (let ((uri (origin-uri (package-source package))))
      (and (string? uri)
           (string-contains uri
                            (string-append "/releases/download/" version "/"))
           (not (string-contains uri "/latest/")))))

  (test-assert (name "patchelf plan rewrites interpreter and runpath")
    (let ((plan (plan-string (arguments-flag package 'patchelf-plan))))
      (and (string-contains plan (string-append program "-" version))
           (every (lambda (lib) (string-contains plan lib))
                  %runpath-libs))))

  (test-assert (name "real ELF under libexec, GStreamer/PATH-aware wrapper in bin")
    (let ((plan (plan-string (arguments-flag package 'install-plan)))
          (phases (plan-string (arguments-flag package 'phases))))
      (and (string-contains plan
                            (string-append "\"libexec/" program "/"
                                           program "\""))
           (string-contains phases "install-launcher-wrapper")
           (string-contains phases "GST_PLUGIN_SYSTEM_PATH")
           (string-contains phases "GST_PLUGIN_SCANNER")
           (string-contains phases "export PATH=")
           (string-contains phases "export LD_LIBRARY_PATH="))))

  (test-assert (name "pinned asset kept byte-for-byte, no substitutes")
    (and (flag-present? package 'strip-binaries?)
         (flag-present? package 'substitutable?)
         (not (arguments-flag package 'strip-binaries?))
         (not (arguments-flag package 'substitutable?))))

  (test-assert (name "desktop entry and theme icon are installed")
    (let ((phases (plan-string (arguments-flag package 'phases))))
      (and (string-contains phases "install-desktop-integration")
           (string-contains phases "make-desktop-entry-file")
           (string-contains phases "hicolor/512x512/apps"))))

  (test-assert (name "complete direct runtime inputs")
    (lset= string=? %runtime-inputs (input-names package)))

  (test-equal (name "icon labeled after the GApplication id")
    (list (string-append app-id ".png"))
    (native-names package)))

(test-runner-current (test-runner-simple))

(test-begin "anime-launchers")

(test-launcher anime-game-launcher-bin "anime-game-launcher" "3.19.8"
               "moe.launcher.an-anime-game-launcher")
(test-launcher sleepy-launcher-bin "sleepy-launcher" "1.7.1"
               "moe.launcher.sleepy-launcher")

(test-end "anime-launchers")
