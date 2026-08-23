(define-module (virelith packages cursors)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:))

(define %fluent-cursor-theme-version "2026.07.27")
(define %fluent-cursor-theme-commit
  "c70c2441bcf2ab8bbc267e55635c76d69f659a8b")

(define-public fluent-cursor-theme
  (package
    (name "fluent-cursor-theme")
    (version %fluent-cursor-theme-version)
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
          (url "https://github.com/vinceliuice/Fluent-icon-theme")
          (commit %fluent-cursor-theme-commit)))
       (file-name (git-file-name name version))
       ;; Same upstream checkout as fluent-icon-theme.  After bootstrapping
       ;; the hash once, use the same value in both package modules.
       (sha256
        (base32
         "06gkjzd3jy1an90d1mn07p34wxgm3cn57lspm23wc3lspgjg7lia"))))
    (build-system copy-build-system)
    (arguments
     (list
      ;; Upstream's cursors/install.sh performs exactly these two copies:
      ;; dist      -> Fluent-cursors
      ;; dist-dark -> Fluent-dark-cursors
      #:install-plan
      #~'(("cursors/dist" "share/icons/Fluent-cursors")
          ("cursors/dist-dark" "share/icons/Fluent-dark-cursors"))))
    (home-page "https://github.com/vinceliuice/Fluent-icon-theme")
    (synopsis "Fluent Design XCursor theme")
    (description
     "Fluent Cursor is an XCursor theme inspired by Microsoft's Fluent
Design.  It is distributed in the Fluent icon theme repository and provides
both light and dark cursor variants.")
    (license license:gpl3+)))
