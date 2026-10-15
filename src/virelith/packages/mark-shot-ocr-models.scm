;;; PP-OCRv5 ONNX models for Mark Shot's native OCR provider.
;;;
;;; The package is a pure fixed-output "model bundle": the three files are
;;; pre-trained weights (detection + recognition) plus the recognition
;;; character dictionary.  They are not buildable from source, so the only
;;; reproducible way to ship them is to pin the upstream bytes by hash (a
;;; fixed-output derivation; see the Guix manual, "origin Reference").
;;;
;;; Upstream: the RapidOCR project mirrors the PaddleOCR PP-OCRv5 models in
;;; four formats (onnx/mnn/paddle/torch) under a versioned release tag on
;;; ModelScope.  We take the ONNX variants consumed by Mark Shot's native
;;; `mark-shot-ocr-rapid` provider (linked against onnxruntime) and the
;;; dictionary from the paddle/ tree (the same charset file the ONNX
;;; recogniser expects).  The tag `v3.10.0` corresponds to the rapidocr
;;; release the URLs were taken from; content integrity is guaranteed by the
;;; declared hashes regardless of any later upstream tag movement.
;;;
;;; File-name contract (audited against mark-shot's
;;; plugins/ocr-rapid/rapid_model_paths.cpp): the detector must match
;;; {det,v5}, the recogniser {rec,v5} and the dictionary must be named
;;; exactly "ppocrv5_dict.txt"; the provider treats a bundle as complete only
;;; when all three are present.
;;;
;;; License: the PaddleOCR PP-OCRv5 weights are Apache-2.0.

(define-module (virelith packages mark-shot-ocr-models)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)                ;url-fetch
  #:use-module (guix gexp)                    ;#~
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (mark-shot-ocr-models))

(define %mark-shot-ocr-models-version "3.10.0")

(define %mark-shot-ocr-models-base
  (string-append "https://www.modelscope.cn/models/RapidAI/RapidOCR/resolve/v"
                 %mark-shot-ocr-models-version))

(define det-origin
  (origin
    (method url-fetch)
    (uri (string-append %mark-shot-ocr-models-base
                        "/onnx/PP-OCRv5/det/ch_PP-OCRv5_det_mobile.onnx"))
    (file-name "ch_PP-OCRv5_det_mobile.onnx")
    (sha256 (base32 "1bkqmv3ga8b63wwzqakl6m36qy4gn2ba7ml7s2m822nk415c95sd"))))

(define rec-origin
  (origin
    (method url-fetch)
    (uri (string-append %mark-shot-ocr-models-base
                        "/onnx/PP-OCRv5/rec/ch_PP-OCRv5_rec_mobile.onnx"))
    (file-name "ch_PP-OCRv5_rec_mobile.onnx")
    (sha256 (base32 "1ia22ydnd504gdll3804y8h7dmw69l5q4jg05d0pmbl4pxzgq9aq"))))

(define dict-origin
  (origin
    (method url-fetch)
    (uri (string-append %mark-shot-ocr-models-base
                        "/paddle/PP-OCRv5/rec/ch_PP-OCRv5_rec_mobile/ppocrv5_dict.txt"))
    (file-name "ppocrv5_dict.txt")
    (sha256 (base32 "06xg8a1xz30m2hgygh24qsfqx5yx2kzafw0b5q6lqijcg6grx5yi"))))

(define-public mark-shot-ocr-models
  (package
    (name "mark-shot-ocr-models")
    (version %mark-shot-ocr-models-version)
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((out (string-append #$output "/share/mark-shot-ocr-models")))
            (mkdir-p out)
            (copy-file #$det-origin
                       (string-append out "/ch_PP-OCRv5_det_mobile.onnx"))
            (copy-file #$rec-origin
                       (string-append out "/ch_PP-OCRv5_rec_mobile.onnx"))
            (copy-file #$dict-origin
                       (string-append out "/ppocrv5_dict.txt"))))))
    (home-page "https://github.com/RapidAI/RapidOCR")
    (synopsis "PP-OCRv5 ONNX models for Mark Shot's native OCR provider")
    (description
     "This package ships the PaddleOCR PP-OCRv5 mobile detection and
recognition ONNX models together with the recognition dictionary, laid out
for the native `mark-shot-ocr-rapid' provider of Mark Shot.  The weights are
pinned by hash from the RapidOCR ModelScope mirror.")
    (license license:asl2.0)))
