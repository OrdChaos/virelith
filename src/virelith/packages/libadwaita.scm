;;; libadwaita 1.9 for Virelith.
;;;
;;; Audit notes:
;;;
;;; - Mission Center 1.2.0's Rust dependency `libadwaita` 0.9 enables its
;;;   `v1_9` feature, whose `libadwaita-sys` metadata requires the system
;;;   library at version 1.9 or newer.  The pinned Guix master
;;;   (49b32687a64d647c97cfb2ef9d7da68023311ab0) ships libadwaita 1.8.2,
;;;   so 1.9 must be built here.
;;; - Guix's own libadwaita builds the API docs, Vala bindings and the GObject
;;;   introspection data, none of which the Rust FFI bindings consume.  Those
;;;   are disabled to keep the closure small and avoid gtk-doc/vala.
;;; - `fribidi` is a direct dependency since 1.9; `sassc` and a Python 3 are
;;;   needed at build time, and `glib:bin` supplies glib-compile-resources.
;;; - `gtk` and `appstream` are propagated because libadwaita-1.pc lists them
;;;   in its Requires line, so consumers need them on PKG_CONFIG_PATH.

(define-module (virelith packages libadwaita)
  #:use-module (gnu packages freedesktop)  ; appstream
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages web)          ; sassc
  #:use-module (guix build-system meson)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)                ; version-major+minor
  #:export (libadwaita-1.9))

(define-public libadwaita-1.9
  (package
    (name "libadwaita")
    (version "1.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://gnome/sources/libadwaita/"
                           (version-major+minor version) "/"
                           "libadwaita-" version ".tar.xz"))
       (sha256
        (base32 "08z7260nna76wlapfyd1h1q2502fdqpmv03viqq2c0gy51qb6ngw"))))
    (build-system meson-build-system)
    (arguments
     (list
      ;; The Rust bindings link against the C library and read libadwaita-1.pc;
      ;; they do not need GObject introspection or Vala.
      #:configure-flags
      #~(list "-Dintrospection=disabled"
              "-Dvapi=false"
              "-Dtests=false"
              "-Dexamples=false"
              "-Ddocumentation=false")))
    (native-inputs
     (list gettext-minimal
           pkg-config
           python
           sassc
           `(,glib "bin")))
    (inputs
     (list fribidi))
    (propagated-inputs
     (list appstream gtk))
    (home-page "https://gnome.pages.gitlab.gnome.org/libadwaita/")
    (synopsis "Building blocks for GNOME applications")
    (description
     "libadwaita offers widgets and objects to build GNOME applications
scaling from desktop workstations to mobile phones.  It is the continuation of
the GNOME Human Interface Guidelines implementation for GTK 4.")
    (license license:lgpl2.1+)))
