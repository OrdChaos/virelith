;;; TPM2 packages for Virelith.

(define-module (virelith packages tpm2)
               #:use-module (gnu packages admin)
               #:use-module (gnu packages hardware)
               #:use-module (gnu packages pkg-config)
               #:use-module (gnu packages tls)
               #:use-module (guix build-system gnu)
               #:use-module (guix download)
               #:use-module (guix packages))

;; Bump VERSION/SHA256 together when updating the package.
(define %tpm2-tss-compat-version "4.2.0")
(define %tpm2-tss-compat-sha256
  (base32 "0951zsqss3ndx904dg69h2imqwlgd2lhqh8sf02pzqaciif0qgxm"))

;; 项目需要比当前 GNU Guix 主线更新的 TPM2 用户态栈。
;;
;; 4.1.3 + tpm2-tools 5.7 曾通过 guix-config 的 T1/T2/T3 验证。
;; 4.2.0 + tpm2-tools 5.8 是新的候选组合；升级后必须重新通过
;; T1/T2/T3，确认后才视为项目正式验证过的 TPM2 工具链。
(define-public tpm2-tss-compat
  (package
    (inherit tpm2-tss)
    (name "tpm2-tss-compat")
    (version %tpm2-tss-compat-version)
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://github.com/tpm2-software/tpm2-tss/releases/download/"
         version
         "/tpm2-tss-"
         version
         ".tar.gz"))
       (sha256 %tpm2-tss-compat-sha256)))

    ;; guix-config 只消费 ESYS/SYS/TCTI；不需要 FAPI/policy
    ;; subsystem，因此继续关闭它们。
    (arguments
     '(#:configure-flags
        '("--disable-fapi"
          "--disable-policy")))

    (native-inputs
     (modify-inputs (package-native-inputs tpm2-tss)
                    (prepend shadow)))

    (inputs
     (modify-inputs (package-inputs tpm2-tss)
                    (replace "openssl" openssl-3.0)))))

;; Bump VERSION/SHA256 together when updating the package.
(define %tpm2-tools-compat-version "5.8")
(define %tpm2-tools-compat-sha256
  (base32 "0wzg9gwfv4pxl5b42pvp92phyr1dchi0nbbwbkhv8578ra2k3dqw"))

(define-public tpm2-tools-compat
  (package
    (inherit tpm2-tools)
    (name "tpm2-tools-compat")
    (version %tpm2-tools-compat-version)
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://github.com/tpm2-software/tpm2-tools/releases/download/"
         version
         "/tpm2-tools-"
         version
         ".tar.gz"))
       (sha256 %tpm2-tools-compat-sha256)))

    ;; tpm2-tools 与 tpm2-tss 保持同一 OpenSSL ABI。
    (native-inputs
     (modify-inputs (package-native-inputs tpm2-tools)
                    (replace "tpm2-tss" tpm2-tss-compat)
                    (replace "openssl" openssl-3.0)))))
