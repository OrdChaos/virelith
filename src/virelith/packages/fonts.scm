(define-module (virelith packages fonts)
               #:use-module (guix packages)
               #:use-module (guix download)
               #:use-module (guix gexp)
               #:use-module (guix build-system font)
               #:use-module ((guix licenses) #:prefix license:))

(define-public sarasa-term-sc-nerd
  (package
   (name "sarasa-term-sc-nerd")
   (version "2.3.1")
   
   (source
    (origin
     (method url-fetch)
     (uri
      (string-append
       "https://github.com/laishulu/Sarasa-Term-SC-Nerd/releases/download/v"
       version
       "/SarasaTermSCNerd-Unhinted.ttc.tar.gz"))
     (sha256
      (base32
       "1lq523y71kc28ha32irbqy3brsnqp11h1g58ky8w42h6js7375yj"))))
   
   (build-system font-build-system)
   
   (home-page "https://github.com/laishulu/Sarasa-Term-SC-Nerd")
   (synopsis "Sarasa Term SC Nerd Font")
   (description
    "Sarasa Term SC with Nerd icon font library patch.")
   (license license:silofl1.1)))


(define-public mi-sans-global
  (package
   (name "mi-sans-global")
   (version "4.003")
   
   (source
    (origin
     (method url-fetch)
     (uri
      "https://hyperos.mi.com/font-download/MiSans_Global_ALL.zip")
     (file-name
      (string-append name "-" version ".zip"))
     (sha256
      (base32
       "0msvx1m3v7f7015gjpa4c3mbn17pcy0zs34qfqyilriq64ga08i3"))))
   
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
                                   ;; macOS AppleDouble metadata.  These are not fonts despite
                                   ;; carrying the same file extensions.
                                   (for-each delete-file
                                             (find-files "fonts" "^\\._"))
                                   
                                   ;; MiSans Global ships the same desktop fonts as both OTF and
                                   ;; TTF.  Keep the TTF distribution, which also contains the
                                   ;; variable fonts.
                                   (for-each delete-file
                                             (find-files "fonts" "\\.(otf|otc)$"))
                                   
                                   ;; Web fonts are not useful as system fonts.
                                   (for-each delete-file
                                             (find-files "fonts" "\\.(woff|woff2)$")))))))
   
   
   (home-page "https://hyperos.mi.com/font/")
   (synopsis "MiSans Global multilingual font family")
   (description
    "MiSans Global is Xiaomi's multilingual font family for HyperOS.
This package installs desktop font variants from the official MiSans Global
distribution.")
   (license
    ((@@ (guix licenses) license)
     "MiSans Font Intellectual Property License Agreement"
     "https://hyperos.mi.com/font-download/MiSans%E5%AD%97%E4%BD%93%E7%9F%A5%E8%AF%86%E4%BA%A7%E6%9D%83%E8%AE%B8%E5%8F%AF%E5%8D%8F%E8%AE%AE.pdf"
     "Custom nonfree font license with restrictions on modification,
sublicensing, and redistribution.  See the license URI for the complete
terms."))))