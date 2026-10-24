;;; HP printer firmware packages for Virelith.
;;;
;;; HP LaserJet 1020 is a host-based printer: firmware is lost whenever the
;;; device is powered off.  HP's Windows installer is the authoritative
;;; upstream payload; this package extracts only hp1020.img and converts it
;;; to the download format expected by the free foo2zjs driver.

(define-module (virelith packages hp-printers)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages cups)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (hp-laserjet-1020-firmware))

(define %hp-laserjet-1020-firmware-version "2012.918.1")

(define-public hp-laserjet-1020-firmware
  (package
    (name "hp-laserjet-1020-firmware")
    (version %hp-laserjet-1020-firmware-version)
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://ftp.hp.com/pub/softlib/software13/COL51473/"
             "bi-124608-2/hp_LJ1020_Full_Solution-v2012_918_1_57980.exe"))
       (file-name "hp_LJ1020_Full_Solution-v2012_918_1_57980.exe")
       (sha256
        (base32 "0hqc1bzppkxv3l5ib0zh5c0x70d03aykbq5961ana7v5bzi2a2vl"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((installer (assoc-ref %build-inputs "source"))
                (firmware (string-append #$output
                                         "/share/hp-laserjet-1020/firmware/"
                                         "sihp1020.dl")))
            ;; bsdtar writes the image to stdout, so capture it before the
            ;; driver-provided converter wraps it in HP's download protocol.
            (with-output-to-file "hp1020.img"
              (lambda ()
                (invoke #$(file-append libarchive "/bin/bsdtar")
                        "-xOf" installer "hp1020.img")))
            (mkdir-p (dirname firmware))
            (with-output-to-file firmware
              (lambda ()
                (invoke #$(file-append foo2zjs "/bin/arm2hpdl")
                        "hp1020.img")))
            (chmod firmware #o444)))))
    (native-inputs (list libarchive foo2zjs))
    (home-page
     "https://support.hp.com/us-en/drivers/hp-laserjet-1020-printer-series/439423")
    (synopsis "Firmware for the HP LaserJet 1020 printer")
    (description
     "This package extracts HP LaserJet 1020 firmware from HP's official
Windows driver installer and converts it to the download format required by
the free foo2zjs driver.  It installs only @file{sihp1020.dl}; no Windows
driver components are retained.")
    (license
     (license:license
      "HP LaserJet 1020 firmware license"
      "https://support.hp.com/us-en/document/ish_3664994-3665033-16"
      "Proprietary HP printer firmware; source is fetched from HP and is not redistributed by Virelith."))))
