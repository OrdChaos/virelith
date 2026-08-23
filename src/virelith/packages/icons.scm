(define-module (virelith packages icons)
               #:use-module (guix packages)
               #:use-module (guix git-download)
               #:use-module (guix gexp)
               #:use-module (guix build-system copy)
               #:use-module ((guix licenses) #:prefix license:))

(define %fluent-icon-theme-version "2026.07.27")
(define %fluent-icon-theme-commit
  "c70c2441bcf2ab8bbc267e55635c76d69f659a8b")

(define-public fluent-icon-theme
  (package
   (name "fluent-icon-theme")
   (version %fluent-icon-theme-version)
   (source
    (origin
     (method git-fetch)
     (uri
      (git-reference
       (url "https://github.com/vinceliuice/Fluent-icon-theme")
       (commit %fluent-icon-theme-commit)))
     (file-name (git-file-name name version))
     ;; Bootstrap hash: replace this with the actual hash reported by Guix.
     (sha256
      (base32
       "06gkjzd3jy1an90d1mn07p34wxgm3cn57lspm23wc3lspgjg7lia"))
     ;; Icon caches are host/profile specific and should not be embedded
     ;; in this theme package.
     (modules '((guix build utils)))
     (snippet
      '(substitute* "install.sh"
                    (("gtk-update-icon-cache") "true")))))
   (build-system copy-build-system)
   (arguments
    (list
     #:phases
     #~(modify-phases %standard-phases
                      (replace 'install
                               (lambda _
                                 (let ((dest (string-append #$output "/share/icons")))
                                   (mkdir-p dest)
                                   ;; Install every color variant.  The upstream installer
                                   ;; also creates standard/light/dark variants and the
                                   ;; shared base directories they reference.
                                   (invoke "bash" "install.sh"
                                           "--all"
                                           "--dest" dest)))))))
   (home-page "https://github.com/vinceliuice/Fluent-icon-theme")
   (synopsis "Fluent Design icon theme")
   (description
    "Fluent is an icon theme for Linux desktops inspired by Microsoft's
Fluent Design.  This package installs all upstream color variants together
with their standard, light, and dark variants.")
   (license license:gpl3+)))
