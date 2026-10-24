;;; Offline unit tests for (virelith packages hp-printers).
;;;
;;; Run:  guix repl -L src tests/hp-printers.scm

(use-modules (srfi srfi-64)
             (guix base32)
             (guix build-system trivial)
             (guix packages)
             (virelith packages hp-printers))

(test-begin "hp-printers")

(define source (package-source hp-laserjet-1020-firmware))

(test-equal "package name" "hp-laserjet-1020-firmware"
  (package-name hp-laserjet-1020-firmware))
(test-equal "official installer version" "2012.918.1"
  (package-version hp-laserjet-1020-firmware))
(test-assert "uses trivial build system"
  (eq? trivial-build-system
       (package-build-system hp-laserjet-1020-firmware)))
(test-equal "source is the HP installer"
  "https://ftp.hp.com/pub/softlib/software13/COL51473/bi-124608-2/hp_LJ1020_Full_Solution-v2012_918_1_57980.exe"
  (origin-uri source))
(test-equal "installer hash is pinned"
  "0hqc1bzppkxv3l5ib0zh5c0x70d03aykbq5961ana7v5bzi2a2vl"
  (bytevector->nix-base32-string (content-hash-value (origin-hash source))))

(test-end "hp-printers")
