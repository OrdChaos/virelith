(define-module (virelith packages tpm2)
               #:use-module (gnu packages hardware)
               #:use-module (gnu packages tls)
               #:use-module (gnu packages pkg-config)
               #:use-module (gnu packages admin)
               #:use-module (guix packages)
               #:use-module (guix download)
               #:use-module (guix build-system gnu)
               #:export (tpm2-tss-compat
                         tpm2-tools-compat))


;; tpm2-tss 3.0.3 与当前 OpenSSL 组合在本项目实际 TPM
;; 操作中存在兼容性问题。
;;
;; 4.1.3 + tpm2-tools 5.7 已通过项目的 T1/T2/T3 验证。
(define-public tpm2-tss-compat
  (package
   (inherit tpm2-tss)
   (name "tpm2-tss-compat")
   (version "4.1.3")
   
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
     (sha256
      (base32
       "1s1v1nk3f9rkpxcwanz8rf9hrvma869dhwn83xfk0y5b0015iw9p"))))
   
   ;; 本项目只消费 ESYS/SYS/TCTI。
   (arguments
    '(#:configure-flags
       '("--disable-fapi"
         "--disable-policy")))
   
   (native-inputs
    (modify-inputs (package-native-inputs tpm2-tss)
                   (prepend pkg-config shadow)))
   
   (inputs
    (modify-inputs (package-inputs tpm2-tss)
                   (replace "openssl" openssl-3.0)))))


(define-public tpm2-tools-compat
  (package
   (inherit tpm2-tools)
   (name "tpm2-tools-compat")
   (version "5.7")
   
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
     (sha256
      (base32
       "0flqf32w7nx2z26m6cf16483pm0k4bi55rbw5x7ny9bra1mx641q"))))
   
   ;; 保持 tpm2-tools 自身与 tpm2-tss 使用相同 OpenSSL ABI。
   (inputs
    (modify-inputs (package-inputs tpm2-tools)
                   (replace "openssl" openssl-3.0)))
   
   (native-inputs
    (modify-inputs (package-native-inputs tpm2-tools)
                   (replace "tpm2-tss" tpm2-tss-compat)
                   (replace "openssl" openssl-3.0)))))