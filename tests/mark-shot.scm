;;; Offline unit tests for (virelith packages mark-shot) and
;;; (virelith packages mark-shot-ocr-models).
;;;
;;; Run:  guix time-machine -C ../guix-configs/channels.lock.scm -- \
;;;         repl -L src tests/mark-shot.scm
;;;
;;; Pure record/static assertions: no downloads, no lowering, no build.

(use-modules (srfi srfi-1)
             (srfi srfi-64)
             (guix build-system cmake)
             (guix build-system trivial)
             (guix download)
             (guix gexp)
             (guix git-download)
             (guix licenses)
             (guix packages)
             (guix search-paths)
             (virelith packages mark-shot)
             (virelith packages mark-shot-ocr-models))

(define (input-names package)
  (map (compose package-name cadr) (package-inputs package)))
(define (native-names package)
  (map (compose package-name cadr) (package-native-inputs package)))
(define (arguments-value package key)
  (let loop ((args (package-arguments package)))
    (cond ((null? args) #f)
          ((and (keyword? (car args))
                (eq? (keyword->symbol (car args)) key))
           (cadr args))
          (else (loop (cdr args))))))
(define (sexp-contains? sexp obj)
  (cond ((equal? sexp obj) #t)
        ((pair? sexp)
         (or (sexp-contains? (car sexp) obj)
             (sexp-contains? (cdr sexp) obj)))
        (else #f)))

(test-begin "mark-shot")

;; ── mark-shot package ───────────────────────────────────────
(test-equal "package name" "mark-shot"
  (package-name mark-shot))
(test-equal "version 0.1.58" "0.1.58"
  (package-version mark-shot))
(test-equal "pinned release tag"
  "v0.1.58"
  (git-reference-commit (origin-uri (package-source mark-shot))))
(test-assert "cmake build system"
  (eq? cmake-build-system (package-build-system mark-shot)))
(test-assert "tests are disabled"
  (eq? #f (arguments-value mark-shot 'tests?)))

(test-assert "LayerShellQt is enabled, libportal disabled"
  (let ((sexp (gexp->approximate-sexp
               (arguments-value mark-shot 'configure-flags))))
    (and (sexp-contains? sexp "-DMARK_SHOT_WITH_LAYER_SHELL=ON")
         (sexp-contains? sexp "-DMARK_SHOT_WITH_LIBPORTAL=OFF"))))

(test-assert "install phases patch shebangs and wrap runtime paths"
  (let ((sexp (gexp->approximate-sexp
               (arguments-value mark-shot 'phases))))
    (and (sexp-contains? sexp 'patch-python-shebangs)
         (sexp-contains? sexp 'wrap-runtime-paths)
         ;; The wrapper exports the pinned model directory to the provider.
         (sexp-contains? sexp "MARK_SHOT_OCR_MODEL_DIR")
         (sexp-contains? sexp "QT_PLUGIN_PATH")
         (sexp-contains? sexp "PATH"))))

(define %mark-shot-inputs (input-names mark-shot))
(for-each
 (lambda (name)
   (test-assert (string-append "input present: " name)
                (member name %mark-shot-inputs)))
 '("qtbase" "qtwayland" "layer-shell-qt" "zxing-cpp" "onnxruntime"
   "ffmpeg" "pipewire" "pulseaudio" "mesa" "grim" "wl-clipboard"
   "python-minimal" "bash-minimal" "wayland" "libx11" "libxcb"
   "mark-shot-ocr-models"))
(test-assert "wayland-scanner is a native input"
             (member "wayland" (native-names mark-shot)))
(test-assert "helper scripts / capture tools are not vendored"
             (not (any (lambda (name)
                         (member name '("tesseract-ocr" "rapidocr")))
                       %mark-shot-inputs)))

;; ── mark-shot-ocr-models package ────────────────────────────
(test-equal "models package name" "mark-shot-ocr-models"
  (package-name mark-shot-ocr-models))
(test-equal "models version 3.10.0" "3.10.0"
  (package-version mark-shot-ocr-models))
(test-assert "models use the trivial build system"
  (eq? trivial-build-system
       (package-build-system mark-shot-ocr-models)))

;; The builder copies the three fixed-output files into the bundle.
(test-assert "builder copies the three files from the versioned mirror"
  (let ((sexp (gexp->approximate-sexp
               (arguments-value mark-shot-ocr-models 'builder))))
    (and (sexp-contains? sexp "/ch_PP-OCRv5_det_mobile.onnx")
         (sexp-contains? sexp "/ch_PP-OCRv5_rec_mobile.onnx")
         (sexp-contains? sexp "/ppocrv5_dict.txt")
         (sexp-contains? sexp "/share/mark-shot-ocr-models"))))
(test-assert "models are Apache-2.0"
             (eq? asl2.0
                  (package-license mark-shot-ocr-models)))

(test-end "mark-shot")
