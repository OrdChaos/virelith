;;; DupriMan for Virelith.
;;;
;;; The package only installs immutable program artifacts.  Queue creation,
;;; system configuration, runtime directories, and prompt supervision belong to
;;; the operating-system integration.

(define-module (virelith packages dupriman)
  #:use-module (virelith packages dupriman-crates)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cargo)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((guix packages) #:hide (replace))
  #:export (dupriman))

(define %dupriman-version "0.1.0")
(define %dupriman-commit "3869f38eb25d4f9e89a69318a5bfeddc8f5149af")

(define-public dupriman
  (package
    (name "dupriman")
    (version %dupriman-version)
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/OrdChaos/dupriman")
             (commit %dupriman-commit)))
       (file-name (git-file-name name version))
       (sha256
         (base32 "0m54rk3rxpdz0sjnp1s4zyaz156hxgd13fzk4qyiwqk5wl49j46c"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:tests? #f
      #:install-source? #f
      #:imported-modules `((guix build glib-or-gtk-build-system)
                           ,@%cargo-build-system-modules)
      #:modules '((guix build cargo-build-system)
                  (guix build utils)
                  ((guix build glib-or-gtk-build-system) #:prefix gtk:))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (install-file "target/release/dupriman"
                              (string-append out "/bin"))
                (mkdir-p (string-append out "/lib/cups/backend"))
                (symlink "../../../bin/dupriman"
                         (string-append out "/lib/cups/backend/dupriman"))
                (mkdir-p (string-append out "/share/cups/model"))
                (with-output-to-file
                    (string-append out "/share/cups/model/dupriman.ppd")
                  (lambda ()
                    (invoke "target/release/dupriman" "ppd"))))))
          (add-after 'install 'glib-or-gtk-wrap
            (assoc-ref gtk:%standard-phases 'glib-or-gtk-wrap))
          (add-after 'glib-or-gtk-wrap 'wrap-cups-tools
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (wrap-program (string-append (assoc-ref outputs "out") "/bin/dupriman")
                `("PATH" prefix
                  ,(map (lambda (input)
                          (string-append (assoc-ref inputs input) "/bin"))
                        '("cups" "qpdf" "poppler")))))))))
    (native-inputs
     (list pkg-config))
    (inputs
     (cons* cups
            qpdf
            poppler
            gdk-pixbuf
            glib
            gtk
            (dupriman-cargo-inputs 'dupriman)))
    (home-page "https://github.com/OrdChaos/dupriman")
    (synopsis "Manual duplex printing assistant")
    (description
     "DupriMan provides a CUPS virtual printer for manually duplexing PDF jobs
on a single-sided printer.  It prints fronts, asks the submitting user to
reinsert paper through a GTK prompt, and then prints backs.")
    (license license:expat)))
