;;; Mark Shot for Virelith.
;;;
;;; Audit notes:
;;;
;;; - Upstream is a Qt 6 CMake project (C++17) at tag v0.1.58, MIT.  The
;;;   pinned Guix provides every dependency: qtbase/qtwayland 6.9.2,
;;;   layer-shell-qt 6.5.5, zxing-cpp 2.3.0, onnxruntime 1.22.0, pipewire,
;;;   ffmpeg (libav*), pulseaudio, mesa, grim and the wayland toolchain.
;;; - Recording is enabled: libavcodec/libavformat/libavutil/libswresample/
;;;   libswscale (+ libavfilter for per-frame GIF palettes) are found through
;;;   pkg-config, and PipeWire through libpipewire-0.3.  Nothing is required
;;;   (MARK_SHOT_REQUIRE_FFMPEG stays OFF), so a future channel change that
;;;   drops one of them degrades instead of failing the build.
;;; - LayerShellQt is enabled explicitly.  The Wayland shell-integration
;;;   plugin must be reachable at runtime, so its plugin directory is added
;;;   to QT_PLUGIN_PATH (same pattern as Prism Launcher / Chromium).
;;; - The native OCR provider `mark-shot-ocr-rapid` is built against
;;;   onnxruntime and is fed the PP-OCRv5 bundle from
;;;   (virelith packages mark-shot-ocr-models) via MARK_SHOT_OCR_MODEL_DIR.
;;;   tesseract is deliberately not packaged: the provider's auto chain finds
;;;   the pinned models and never falls back to the helper or tesseract.
;;; - `grim` and `wl-clipboard` are wrapped into PATH because niri needs the
;;;   external capture/clipboard tools; python-minimal is on PATH for the
;;;   bundled stdlib-only helper scripts (upload / translate / window
;;;   detection).  The optional Python OCR helper (rapidocr) is never used.
;;; - Tests are disabled: the ctest suite needs a display server and network.

(define-module (virelith packages mark-shot)
  #:use-module (gnu packages aidc)            ;zxing-cpp
  #:use-module (gnu packages bash)            ;bash-minimal
  #:use-module (gnu packages freedesktop)     ;wayland, wayland-protocols
  #:use-module (gnu packages gl)              ;mesa (EGL/GLESv2)
  #:use-module (gnu packages image)           ;grim
  #:use-module (gnu packages kde-plasma)      ;layer-shell-qt
  #:use-module (gnu packages machine-learning) ;onnxruntime
  #:use-module (gnu packages parallel)        ;cpuinfo
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)      ;pulseaudio
  #:use-module (gnu packages python)          ;python-minimal
  #:use-module (gnu packages qt)              ;qtbase, qtwayland
  #:use-module (gnu packages video)           ;ffmpeg
  #:use-module (gnu packages linux)           ;pipewire
  #:use-module (gnu packages xdisorg)         ;wl-clipboard
  #:use-module (gnu packages xorg)            ;libx11, libxcb
  #:use-module (guix build-system cmake)
  #:use-module (guix gexp)                    ;#~
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)                   ;substitute-keyword-arguments
  #:use-module (virelith packages mark-shot-ocr-models)
  #:export (mark-shot))

;; cpuinfo (a transitive dependency of onnxruntime) ships an x86 "known_uarch"
;; self-test that fails on CPUs newer than its bundled micro-architecture
;; table: cpuinfo_uarch_unknown (0) is reported for this machine's cores, so
;; the from-source build aborts in the 'check' phase.  The library is only
;; used for runtime CPU-feature detection, so the test is disabled here.  This
;; variant is scoped to onnxruntime's input; the core cpuinfo package is
;; untouched.
(define cpuinfo/no-tests
  (package/inherit cpuinfo
    (arguments
     (substitute-keyword-arguments (package-arguments cpuinfo)
       ((#:tests? _ #t) #f)))))

(define onnxruntime/no-cpuinfo-tests
  (package/inherit onnxruntime
    ;; onnxruntime runs its (heavy, Python) test suite by default, which pulls
    ;; python-pytorch and, through its propagated inputs, the core cpuinfo
    ;; (tests enabled).  Disabling the tests and dropping the Python test-only
    ;; native inputs keeps the core cpuinfo out of the build graph, so only
    ;; the test-less cpuinfo variant above is needed.
    (arguments
     (append (package-arguments onnxruntime)
             (list #:tests? #f)))
    (native-inputs
     (modify-inputs (package-native-inputs onnxruntime)
       (delete "python-einops"
               "python-parameterized"
               "python-psutil"
               "python-pytest"
               "python-pytorch"
               "python-sentencepiece")))
    (inputs
     (modify-inputs (package-inputs onnxruntime)
       (replace "cpuinfo" cpuinfo/no-tests)))))

(define %mark-shot-helper-scripts
  '("mark-shot-ocr"
    "mark-shot-code-scan"
    "mark-shot-translate"
    "mark-shot-upload"
    "mark-shot-window-detection-niri"
    "mark-shot-window-detection-hyprland"
    "mark-shot-window-detection-gnome"
    "mark-shot-window-detection-kde"))

(define-public mark-shot
  (package
    (name "mark-shot")
    (version "0.1.58")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jswysnemc/mark-shot")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0g4rk88yfhskvjm2m4mj3fws0n0fbnkccz8abg8pjjc893qxhs9s"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DMARK_SHOT_WITH_LAYER_SHELL=ON"
              "-DMARK_SHOT_WITH_LIBPORTAL=OFF")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'fix-layer-shell-qt-api
            (lambda _
              ;; mark-shot targets a newer LayerShellQt Window API; the pinned
              ;; layer-shell-qt 6.5.5 exposes setScreenConfiguration() instead
              ;; of setScreen()/setWantsToBeOnActiveScreen()/screen().  The
              ;; target screen is already applied to the native QWindow, and
              ;; ScreenFromQWindow is the default screen configuration, so the
              ;; surface still follows it.
              (substitute* "src/layer_shell_plugin.cpp"
                (("layerWindow->setScreen\\(screen\\)")
                 "layerWindow->setScreenConfiguration(LayerShellQt::Window::ScreenFromQWindow)")
                (("layerWindow->setWantsToBeOnActiveScreen\\(true\\)")
                 "(void)0")
                (("screen && layerWindow->screen\\(\\) != screen")
                 "false"))))
          (add-after 'install 'patch-python-shebangs
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((python (assoc-ref inputs "python-minimal")))
                (for-each (lambda (script)
                            (let ((file (string-append #$output "/bin/"
                                                       script)))
                              (when (file-exists? file)
                                (substitute* file
                                  (("#!/usr/bin/env python3")
                                   (string-append "#!" python
                                                  "/bin/python3"))))))
                          '#$%mark-shot-helper-scripts))))
          (add-after 'install 'wrap-runtime-paths
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (program (string-append out "/bin/mark-shot"))
                     (grim (assoc-ref inputs "grim"))
                     (wl-clipboard (assoc-ref inputs "wl-clipboard"))
                     (python (assoc-ref inputs "python-minimal"))
                     (models (assoc-ref inputs "mark-shot-ocr-models"))
                     (qtwayland (assoc-ref inputs "qtwayland"))
                     (layer-shell-qt (assoc-ref inputs "layer-shell-qt")))
                (wrap-program program
                  ;; grim is the Wayland capture backend; wl-copy persists the
                  ;; clipboard; python3 runs the stdlib-only helper scripts.
                  `("PATH" ":" prefix
                    (,out
                     ,(string-append grim "/bin")
                     ,(string-append wl-clipboard "/bin")
                     ,(string-append python "/bin")))
                  ;; LayerShellQt's shell-integration plugin plus QtWayland.
                  `("QT_PLUGIN_PATH" ":" prefix
                    (,(string-append qtwayland "/lib/qt6/plugins")
                     ,(string-append layer-shell-qt "/lib/qt6/plugins")))
                  ;; Pinned PP-OCRv5 ONNX bundle for the native OCR provider.
                  `("MARK_SHOT_OCR_MODEL_DIR" ":" prefix
                    (,(string-append models
                                     "/share/mark-shot-ocr-models"))))))))))
    (native-inputs
     (list pkg-config
           wayland))                            ;wayland-scanner
    (inputs
     (list bash-minimal                         ;wrap-program
           ffmpeg                               ;libav* recording writer
           grim                                 ;Wayland capture
           layer-shell-qt
           libx11
           libxcb
           mark-shot-ocr-models                 ;PP-OCRv5 ONNX bundle
           mesa                                 ;EGL/GLESv2 (PipeWire DMA-BUF)
           onnxruntime/no-cpuinfo-tests         ;native OCR provider
           pipewire                             ;portal screencast/recording
           pulseaudio                           ;lib recording capture
           python-minimal                       ;helper-script interpreter
           qtbase
           qtwayland
           wayland                              ;libwayland-client
           wl-clipboard                         ;wl-copy persistence
           zxing-cpp))                          ;built-in code scanner
    (home-page "https://github.com/jswysnemc/mark-shot")
    (synopsis "Wayland screenshot, annotation, OCR and recording tool")
    (description
     "Mark Shot is a Qt 6 screenshot and annotation tool for Wayland
compositors such as niri.  It provides region capture, a rich annotation
toolbox, pinned stickers, OCR (native PP-OCRv5 provider), QR/barcode scan,
scrolling capture, GIF/MP4 recording and image-host upload.  This build
enables LayerShellQt, the native onnxruntime OCR provider with a pinned
PP-OCRv5 model bundle, and libav/PipeWire recording.")
    (license license:expat)))
