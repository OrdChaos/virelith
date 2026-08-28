;;; Font packages for Virelith.

(define-module (virelith packages fonts)
               #:use-module (guix build-system font)
               #:use-module (guix download)
               #:use-module (guix gexp)
               #:use-module (guix packages)
               #:use-module ((guix licenses) #:prefix license:))

;; Bump VERSION/SHA256 together when updating the package.
(define %sarasa-term-sc-nerd-version "2.3.1")
(define %sarasa-term-sc-nerd-sha256
  (base32 "1lq523y71kc28ha32irbqy3brsnqp11h1g58ky8w42h6js7375yj"))

(define-public sarasa-term-sc-nerd
  (package
    (name "sarasa-term-sc-nerd")
    (version %sarasa-term-sc-nerd-version)
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://github.com/laishulu/Sarasa-Term-SC-Nerd/releases/download/v"
         version
         "/SarasaTermSCNerd-Unhinted.ttc.tar.gz"))
       (sha256 %sarasa-term-sc-nerd-sha256)))
    (build-system font-build-system)
    (home-page "https://github.com/laishulu/Sarasa-Term-SC-Nerd")
    (synopsis "Sarasa Term SC Nerd Font")
    (description
     "Sarasa Term SC with Nerd icon font library patch.")
    (license license:silofl1.1)))

;; Bump VERSION/SHA256 together when updating the package.
(define %maple-mono-default-nf-cn-version "7.9")
(define %maple-mono-default-nf-cn-sha256
  (base32 "1b3wbgd9gngwv61ybinwxkpmyam2b7fdxxmfzvgiah6g68lm525b"))

(define-public maple-mono-default-nf-cn
  (package
    (name "maple-mono-default-nf-cn")
    (version %maple-mono-default-nf-cn-version)
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://github.com/subframe7536/maple-font/releases/download/v"
         version
         "/MapleMono-NF-CN-unhinted.zip"))
       (sha256 %maple-mono-default-nf-cn-sha256)))
    (build-system font-build-system)
    (home-page "https://github.com/subframe7536/maple-font")
    (synopsis "Maple Mono Default NF CN")
    (description
     "Maple Mono: Open source monospace font with round corner,
ligatures and Nerd-Font icons for IDE and terminal,
fine-grained customization options.")
    (license license:silofl1.1)))

;; Bump VERSION/SHA256 together when updating the package.
(define %maple-mono-normal-nl-nf-cn-version "7.9")
(define %maple-mono-normal-nl-nf-cn-sha256
  (base32 "02vx6sqbsm11hikj7i6kmw0lbyjys12f0i5a98myzrk262zb9mhv"))

(define-public maple-mono-normal-nl-nf-cn
  (package
    (name "maple-mono-normal-nl-nf-cn")
    (version %maple-mono-normal-nl-nf-cn-version)
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://github.com/subframe7536/maple-font/releases/download/v"
         version
         "/MapleMonoNormalNL-NF-CN-unhinted.zip"))
       (sha256 %maple-mono-normal-nl-nf-cn-sha256)))
    (build-system font-build-system)
    (home-page "https://github.com/subframe7536/maple-font")
    (synopsis "Maple Mono Normal NL NF CN")
    (description
     "Maple Mono: Open source monospace font with round corner,
ligatures and Nerd-Font icons for IDE and terminal,
fine-grained customization options.")
    (license license:silofl1.1)))

;; Bump VERSION/SHA256 together when updating the package.
(define %mi-sans-global-version "4.003")
(define %mi-sans-global-sha256
  (base32 "0msvx1m3v7f7015gjpa4c3mbn17pcy0zs34qfqyilriq64ga08i3"))

(define-public mi-sans-global
  (package
    (name "mi-sans-global")
    (version %mi-sans-global-version)
    (source
     (origin
       (method url-fetch)
       (uri
        "https://hyperos.mi.com/font-download/MiSans_Global_ALL.zip")
       (file-name
        (string-append name "-" version ".zip"))
       (sha256 %mi-sans-global-sha256)))
    (build-system font-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
                       (add-after 'unpack 'unpack-font-archives
                                  (lambda _
                                    (let ((archives (find-files "." "\\.zip$")))
                                      (when (null? archives)
                                        (error "no nested MiSans font archives found"))

                                      (format #t "found ~a nested font archives~%"
                                              (length archives))

                                      (mkdir-p "fonts")

                                      (for-each
                                       (lambda (archive)
                                         (format #t "unpacking nested font archive: ~a~%"
                                                 archive)
                                         (invoke "unzip" "-q" "-o"
                                                 archive
                                                 "-d" "fonts"))
                                       archives))))

                       (add-after 'unpack-font-archives 'remove-unwanted-fonts
                                  (lambda _
                                    ;; macOS AppleDouble metadata.  These are not fonts
                                    ;; despite carrying the same file extensions.
                                    (for-each delete-file
                                              (find-files "fonts" "^\\._"))

                                    ;; MiSans Global ships the same desktop fonts
                                    ;; as both OTF and TTF.  Keep the TTF distribution,
                                    ;; which also contains the variable fonts.
                                    (for-each delete-file
                                              (find-files "fonts" "\\.(otf|otc)$"))

                                    ;; Web fonts are not useful as system fonts.
                                    (for-each delete-file
                                              (find-files "fonts"
                                                          "\\.(woff|woff2)$")))))))
    (home-page "https://hyperos.mi.com/font/")
    (synopsis "MiSans Global multilingual font family")
    (description
     "MiSans Global is Xiaomi's multilingual font family for HyperOS.
This package installs desktop font variants from the official MiSans Global
distribution.")
    (license
     (license:license
      "MiSans Font Intellectual Property License Agreement"
      (string-append
       "https://hyperos.mi.com/font-download/"
       "MiSans%E5%AD%97%E4%BD%93%E7%9F%A5%E8%AF%86%E4%BA%A7%E6%9D%83%E8%AE%B8%E5%8F%AF"
       "%E5%8D%8F%E8%AE%AE.pdf")
      "Custom nonfree font license with restrictions on modification,
sublicensing, and redistribution.  See the license URI for the complete
terms."))))
