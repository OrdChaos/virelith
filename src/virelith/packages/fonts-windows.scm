;;; Windows font packages for Virelith.
;;;
;;; font-microsoft-win11-fod-hans installs the "Chinese (Simplified)
;;; Supplemental Fonts" Windows feature-on-demand payload
;;; (Language.Fonts.Hans -> DengXian / FangSong / KaiTi / SimHei) fetched
;;; from the Microsoft Windows Update CDN; this recipe does not re-host the
;;; font binaries.

(define-module (virelith packages fonts-windows)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (gnu packages compression)   ; cabextract
  #:use-module (virelith download uup)      ; uup-file, microsoft-uup-fetch
  #:use-module ((guix licenses) #:prefix license:)
  #:export (font-microsoft-win11-fod-hans))

;; Windows 11 24H2, 10.0.26100.9278, amd64 -- pinned; do not track latest.
(define %hans-fod-update-id
  "d922b79f-142d-4cf8-896b-515abfd01e66")

;; Microsoft-Windows-LanguageFeatures-Fonts-Hans-Package
;; ~31bf3856ad364e35~amd64~~.cab  (payload identity from WU metadata).
(define %hans-fod-file-id
  "a214ba22-d4a1-4dd2-926c-6203a9dde7e3")
(define %hans-fod-file-name
  "Microsoft-Windows-LanguageFeatures-Fonts-Hans-Package~31bf3856ad364e35~amd64~~.cab")
(define %hans-fod-size
  43883622)
(define %hans-fod-sha1
  "639be6a025e9152f4cb1d957a50dff4e9cd4dde2")
(define %hans-fod-sha256
  "1wlrah47wmfsf6cy8rbz1j968r8ak96lwqkb30if1ac2xc3raf0h")

(define %hans-font-files
  ;; Basenames of the fonts inside the CAB that this package installs.
  '("Deng.ttf" "Dengb.ttf" "Dengl.ttf"
    "simfang.ttf" "simhei.ttf" "simkai.ttf"))

(define-public font-microsoft-win11-fod-hans
  (package
    (name "font-microsoft-win11-fod-hans")
    (version "26100.1")
    (source
     (origin
       (method microsoft-uup-fetch)
       (uri (uup-file
             (update-id %hans-fod-update-id)
             (file-id %hans-fod-file-id)
             (file-name %hans-fod-file-name)
             (size %hans-fod-size)
             (sha1 %hans-fod-sha1)
             (sha256 %hans-fod-sha256)))
       (sha256 (base32 %hans-fod-sha256))
       (file-name %hans-fod-file-name)))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source (assoc-ref %build-inputs "source"))
                 (unpacked (string-append (getcwd) "/unpacked"))
                 (fonts-dir (string-append #$output "/share/fonts/truetype")))
            (mkdir-p unpacked)
            (invoke #$(file-append cabextract "/bin/cabextract")
                    "-q" "-d" unpacked source)
            (mkdir-p fonts-dir)
            (for-each
             (lambda (name)
               (let ((matches
                      (find-files unpacked
                                  (lambda (file stat)
                                    (string=? (basename file) name)))))
                 (unless (= 1 (length matches))
                   (error "expected exactly one font file" name matches))
                 (install-file (car matches) fonts-dir)))
             '#$%hans-font-files)))))
    (home-page "https://support.microsoft.com/en-us/windows/fonts-in-windows-4bb24b7e-8f0c-4c40-85fd-4d3e8f8c3d62")
    (synopsis "Chinese (Simplified) Supplemental Fonts from Windows 11")
    (description
     "Microsoft Windows 11 24H2 'Chinese (Simplified) Supplemental Fonts'
feature-on-demand payload (Language.Fonts.Hans), extracted from the
Microsoft Windows Update CAB: DengXian (Regular/Bold/Light), FangSong,
SimHei and KaiTi.

The source is the pinned Microsoft Windows Update payload itself; this
recipe only extracts the font files and does not re-host the binaries.")
    (license
     (license:license
      "Microsoft Font EULA"
      "https://learn.microsoft.com/en-us/typography/fonts/font-faq"
      "Proprietary Microsoft font license; redistribution of the font
binaries is not permitted."))))
