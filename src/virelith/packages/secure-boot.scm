;;; Microsoft UEFI Secure Boot certificates for Virelith.
;;;
;;; microsoft-secure-boot-certificates bundles the public Microsoft CA
;;; certificates that Secure Boot needs to stay hardware-compatible
;;; (Windows Boot Manager, shim, third-party UEFI drivers/programs, and
;;; PCIe/GPU Option ROMs), so consumers can depend on a single store item
;;; instead of seven pinned fixed-output origins.
;;;
;;; Each certificate is pinned by its own sha256 and fetched from
;;; Foxboron/sbctl's certs/microsoft/ tree; the upstream path is kept in
;;; %microsoft-secure-boot-certs for provenance, while installed names
;;; are kebab-case so store paths stay whitespace-free.
;;;
;;; Installed layout:
;;;   share/secure-boot/microsoft/{db,KEK}/*.der
;;;
;;; The certificates are public CA data; the private PK/KEK/db keys
;;; remain self-owned by consumers.

(define-module (virelith packages secure-boot)
  #:use-module (guix base32)          ; base32
  #:use-module (guix build-system copy)
  #:use-module (guix download)        ; url-fetch
  #:use-module (guix gexp)            ; computed-file
  #:use-module (guix packages)        ; origin
  #:use-module ((guix licenses) #:prefix license:)
  #:export (microsoft-secure-boot-certificates
            %microsoft-secure-boot-certs))

(define %sbctl-cert-base-url
  "https://raw.githubusercontent.com/Foxboron/sbctl/master/certs/microsoft/")

;;; Pinned catalog: (install-name . (upstream-path . sha256)).
;;; install-name  : file under share/secure-boot/microsoft/{db,KEK}/
;;; upstream-path : path inside sbctl's certs/microsoft/ tree (URL
;;;                 escaped, spaces as %20), kept for provenance.
(define %microsoft-secure-boot-certs
  '(("db/microsoft-uefi-ca-2011.der"
     . ("db/MicCorUEFCA2011_2011-06-27.der"
        . "01w54h03a3f479h8v7wv49a73i2q1bzrnna9c7vm5z2p3ycrpsa8"))
    ("db/microsoft-windows-production-pca-2011.der"
     . ("db/MicWinProPCA2011_2011-10-19.der"
        . "0q8rqzfgsdb9g1mgmj5kckmgql9ww8z438g0gfnqnpm56c3mzsg8"))
    ("db/microsoft-option-rom-uefi-ca-2023.der"
     . ("db/microsoft%20option%20rom%20uefi%20ca%202023.der"
        . "1wfqm15w241c4r202fiammx5g1q7dl6wxppcawa2hsp6qrj3xgp5"))
    ("db/microsoft-uefi-ca-2023.der"
     . ("db/microsoft%20uefi%20ca%202023.der"
        . "00frv88xdvvq24r1m74jknyygh4igfm4wmwsszk3zvjv28s4w4pn"))
    ("db/microsoft-windows-uefi-ca-2023.der"
     . ("db/windows%20uefi%20ca%202023.der"
        . "0c73k853a7j6r0nk1nlnw4dxs7szyy17dhbppxg1aadcj3m1yvq7"))
    ("KEK/microsoft-kek-ca-2011.der"
     . ("KEK/MicCorKEKCA2011_2011-06-24.der"
        . "00x50bc6b7p0jswx1q4gprmzswkrm08cw6id7yxgrkijd98py4d1"))
    ("KEK/microsoft-kek-2k-ca-2023.der"
     . ("KEK/microsoft%20corporation%20kek%202k%20ca%202023.der"
        . "17bgmkl9gpf9qf62x3r1spxw9zsakw6x8vcpg9v2iqnskqqg1lrw"))))

(define (sbctl-cert-url upstream-path)
  (string-append %sbctl-cert-base-url upstream-path))

(define (microsoft-secure-boot-certs-source)
  "Build the certificate tree as a computed-file: each pinned origin is
downloaded (fixed-output derivation) and installed under its clean name."
  (computed-file
   "microsoft-secure-boot-certificates"
   (with-imported-modules '((guix build utils))
     #~(begin
         (use-modules (guix build utils))
         (define (install-cert name src)
           (let ((dst (string-append #$output
                                     "/share/secure-boot/microsoft/" name)))
             (mkdir-p (dirname dst))
             (copy-file src dst)))
         #$@(map (lambda (entry)
                   (let ((install-name (car entry))
                         (upstream-path (car (cdr entry)))
                         (hash (cdr (cdr entry))))
                     #~(install-cert
                        #$install-name
                        #$(origin
                           (method url-fetch)
                           (uri (sbctl-cert-url upstream-path))
                           (file-name (basename install-name))
                           (sha256 (base32 hash))))))
                 %microsoft-secure-boot-certs)))))

;;; Latest CA generation in the bundle (2011 + 2023); the pinned facts
;;; live in %microsoft-secure-boot-certs.
(define-public microsoft-secure-boot-certificates
  (package
    (name "microsoft-secure-boot-certificates")
    (version "2023.1")
    (source (microsoft-secure-boot-certs-source))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("share/secure-boot/microsoft"
                "share/secure-boot/microsoft"))))
    (home-page
     "https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/uefi-signing")
    (synopsis "Microsoft UEFI Secure Boot certificates (db/KEK)")
    (description
     "Microsoft UEFI Secure Boot CA certificates, 2011 and 2023
generations, for the db and KEK databases: UEFI CA 2011/2023 (shim and
third-party UEFI drivers/programs), Windows Production PCA 2011 and
Windows UEFI CA 2023 (Windows Boot Manager), Option ROM UEFI CA 2023
(PCIe/GPU Option ROMs), and the two KEK CAs that authorize db/dbx
updates.  Each file is pinned by sha256 and fetched from Foxboron/sbctl's
certs/microsoft/ tree; these are public CA certificates, the private
keys stay self-owned.")
    (license license:public-domain)))
