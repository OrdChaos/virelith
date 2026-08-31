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
  #:use-module (gnu packages backup)        ; wimlib (ESD extraction)
  #:use-module (gnu packages compression)   ; cabextract
  #:use-module (virelith download uup)      ; uup-file, microsoft-uup-fetch
  #:use-module ((guix licenses) #:prefix license:)
  #:export (font-microsoft-win11-fod-hans
            font-microsoft-win11-office-core
            %office-core-font-files))

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

;; ── font-microsoft-win11-office-core ────────────────────────────
;; Office/Windows base compatibility fonts from the Windows 11 24H2
;; component ESD (same pinned build/update as the Hans FOD above; no
;; tracking of latest).
(define %office-core-update-id
  "d922b79f-142d-4cf8-896b-515abfd01e66")

;; Microsoft-Windows-Client-Desktop-Required-Package.ESD -- the base
;; system component; the font binaries live here as WinSxS package
;; payloads (the per-edition media ESDs only carry the image structure
;; and reference these blobs).
(define %office-core-file-id
  "c0f2c730-7e7a-4f93-b36b-e94fbb042453")
(define %office-core-file-name
  "Microsoft-Windows-Client-Desktop-Required-Package.ESD")
(define %office-core-size
  814894129)
(define %office-core-sha1
  "74cd7dc782926a4bce55345d8e28f8ff3f8568fe")
(define %office-core-sha256
  "143xzai7qcw31qssq25whkbch410nnykzvpgxl6bc8pg86w0h2v7")

;; Explicit allowlist of font file basenames extracted from the ESD.
;; Each basename exists in exactly one WinSxS package directory; the
;; builder locates it with a single-level glob (/*/<basename>).
;;
;; Note: msyhbd.ttc / msyhl.ttc (YaHei Bold/Light) are NOT present as
;; standalone payloads in the pinned build's base components (verified
;; against all four en-us media ESDs, the zh-cn media ESD, Desktop-
;; Required, Desktop-Required-WOW64, Foundation and ShellExperiences) --
;; YaHei Regular (msyh.ttc, incl. the UI face) is included.
(define %office-core-font-files
  '("arial.ttf" "arialbd.ttf" "ariali.ttf" "arialbi.ttf"
    "calibri.ttf" "calibrib.ttf" "calibrii.ttf" "calibriz.ttf"
    "calibril.ttf" "calibrili.ttf"
    "cambria.ttc" "cambriab.ttf" "cambriai.ttf" "cambriaz.ttf"
    "cour.ttf" "courbd.ttf" "couri.ttf" "courbi.ttf"
    "times.ttf" "timesbd.ttf" "timesi.ttf" "timesbi.ttf"
    "symbol.ttf" "wingding.ttf"
    "msyh.ttc" "simsun.ttc" "simsunb.ttf"))

(define-public font-microsoft-win11-office-core
  (package
    (name "font-microsoft-win11-office-core")
    (version "26100.9278")
    (source
     (origin
       (method microsoft-uup-fetch)
       (uri (uup-file
             (update-id %office-core-update-id)
             (file-id %office-core-file-id)
             (file-name %office-core-file-name)
             (size %office-core-size)
             (sha1 %office-core-sha1)
             (sha256 %office-core-sha256)))
       (sha256 (base32 %office-core-sha256))
       (file-name %office-core-file-name)))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((esd (assoc-ref %build-inputs "source"))
                 (wim (string-append (getcwd) "/wim"))
                 (fonts-dir (string-append #$output "/share/fonts/truetype")))
            (mkdir-p wim)
            (apply invoke
                   #$(file-append wimlib "/bin/wimlib-imagex")
                   "extract" esd "1"
                   (append (map (lambda (file)
                                  (string-append "/*/" file))
                                (list #$@%office-core-font-files))
                           (list "--dest-dir" wim
                                 "--no-acls" "--no-attributes")))
            (mkdir-p fonts-dir)
            (for-each
             (lambda (name)
               (let ((matches (find-files wim
                                          (lambda (file stat)
                                            (string=? (basename file) name)))))
                 (unless (= 1 (length matches))
                   (error "expected exactly one font file" name matches))
                 (install-file (car matches) fonts-dir)))
             (list #$@%office-core-font-files))))))
    (home-page "https://support.microsoft.com/en-us/windows/fonts-in-windows-4bb24b7e-8f0c-4c40-85fd-4d3e8f8c3d62")
    (synopsis "Microsoft Office compatibility fonts from Windows 11")
    (description
     "Microsoft Windows 11 24H2 base fonts, extracted from the pinned
Windows Update component ESD (Microsoft-Windows-Client-Desktop-Required
-Package.ESD).

ONLYOFFICE officially checks for: Arial, Calibri, Courier New, Times New
Roman, Symbol and Wingdings (full families included).

Additional Office compatibility: Cambria (+ Cambria Math inside
cambria.ttc), Microsoft YaHei Regular (+ YaHei UI face, msyh.ttc),
SimSun/NSimSun (simsun.ttc) and SimSun-ExtB (simsunb.ttf).  YaHei
Bold/Light are not available as standalone payloads in the pinned
build's base components and are not included.

The source is the pinned Microsoft Windows Update payload; this recipe
only extracts the allowlisted font files and does not re-host the
binaries.")
    (license
     (license:license
      "Microsoft Font EULA"
      "https://learn.microsoft.com/en-us/typography/fonts/font-faq"
      "Proprietary Microsoft font license; redistribution of the font
binaries is not permitted."))))
