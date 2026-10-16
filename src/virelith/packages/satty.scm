;;; Satty for Virelith.
;;;
;;; Satty 0.22.0 is built from its signed upstream release commit.  Its Cargo
;;; dependency closure is generated from the release Cargo.lock and supplied
;;; locally by (virelith packages satty-crates), so builds need no network.

(define-module (virelith packages satty)
  #:use-module (virelith packages satty-crates)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cargo)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  ;; Keep modify-phases' `replace' clause unbound at this module level.
  #:use-module ((guix packages) #:hide (replace))
  #:export (satty))

(define %satty-version "0.22.0")
(define %satty-commit "9f99065e4177820e965f5475503e5c3bdbd74e6a") ; tag v0.22.0

(define-public satty
  (package
    (name "satty")
    (version %satty-version)
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Satty-org/Satty")
             (commit %satty-commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05j3vdvdwwdmzf0ky52kliy7di0klkj4jdbbn4v8qyjaa1k7i8pg"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:tests? #f
      #:install-source? #f
      #:features ''("ci-release")
      #:imported-modules `((guix build glib-or-gtk-build-system)
                           ,@%cargo-build-system-modules)
      #:modules '((guix build cargo-build-system)
                  (guix build utils)
                  ((guix build glib-or-gtk-build-system) #:prefix gtk:))
      #:phases
      #~(modify-phases %standard-phases
          ;; Rust 1.93 does not yet support `if let' in match guards.  The
          ;; equivalent Option predicate keeps Ctrl+right-click crop discard.
          (add-after 'unpack 'fix-rust-1.93-compatibility
            (lambda _
              (substitute* "src/tools/crop.rs"
                (("                    && let Some\\(crop\\) = &self\\.crop")
                 "                    && self.crop.as_ref().is_some_and(|crop| crop.active) =>")
                (("                    && crop\\.active =>") ""))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (install-file "target/release/satty"
                              (string-append out "/bin"))
                (install-file "satty.desktop"
                              (string-append out "/share/applications"))
                (install-file "assets/satty.svg"
                              (string-append out
                                             "/share/icons/hicolor/scalable/apps"))
                (install-file "LICENSE"
                              (string-append out "/share/licenses/satty"))
                (install-file "man/satty.1"
                              (string-append out "/share/man/man1"))
                (for-each
                 (lambda (entry)
                   (install-file (car entry)
                                 (string-append out "/share/" (cdr entry))))
                 '(("completions/satty.bash" . "bash-completion/completions")
                   ("completions/_satty" . "zsh/site-functions")
                   ("completions/satty.fish" . "fish/vendor_completions.d")
                   ("completions/satty.elv" . "elvish/lib")
                   ("completions/satty.nu" . "nushell/completions")
                   ("completions/satty.ts" . "fig/autocomplete"))))))
          (add-after 'install 'glib-or-gtk-wrap
            (assoc-ref gtk:%standard-phases 'glib-or-gtk-wrap)))))
    (native-inputs
     (list pkg-config))
    (inputs
     (cons* fontconfig
            gdk-pixbuf
            glib
            gtk
            libadwaita
            libepoxy
            mesa
            (satty-cargo-inputs 'satty)))
    (home-page "https://github.com/Satty-org/Satty")
    (synopsis "Modern screenshot annotation tool")
    (description
     "Satty is a modern screenshot annotation tool inspired by Swappy and
Flameshot.  It provides an accelerated GTK interface for drawing, cropping,
blurring, highlighting and adding text or numbered markers to screenshots.")
    (license license:mpl2.0)))
