;;; Nushell for Virelith.
;;;
;;; Binary packaging of the upstream glibc release: every ELF executable in
;;; the tarball (nu and the shipped plugins) gets its interpreter patched to
;;; Guix's glibc and its RUNPATH extended with the Guix store paths for
;;; glibc, zlib and libgcc_s (gcc:lib).  Plugin registration is a runtime,
;;; user-level action (`plugin add' / `plugin use'), so the package only
;;; installs the binaries under $out/bin.

(define-module (virelith packages nushell)
  #:use-module (gnu packages base)          ; glibc
  #:use-module (gnu packages compression)   ; zlib
  #:use-module (gnu packages gcc)           ; gcc:lib (libgcc_s.so.1)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (nonguix build-system binary)
  #:use-module ((guix licenses) #:prefix license:))

(define-public nushell
  (package
    (name "nushell")
    (version "0.115.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nushell/nushell/releases/download/"
             version "/nu-" version "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "1c6qp4spdd3867xijyvdr04x1mlxb9rgldf52wv4ll7n859847fi"))))
    (build-system binary-build-system)
    (arguments
     (list
      ;; Install nu and every plugin binary into $out/bin; plugin
      ;; registration stays a user-level `plugin add' step.
      #:install-plan
      #~'(("nu" "bin/")
          ("nu_plugin_custom_values" "bin/")
          ("nu_plugin_example" "bin/")
          ("nu_plugin_formats" "bin/")
          ("nu_plugin_gstat" "bin/")
          ("nu_plugin_inc" "bin/")
          ("nu_plugin_polars" "bin/")
          ("nu_plugin_query" "bin/")
          ("nu_plugin_stress_internals" "bin/"))
      ;; Patch every ELF: the interpreter is set by the build system to
      ;; Guix's glibc; RUNPATH covers the NEEDED libraries (libc/libm,
      ;; libz, libgcc_s).  The "gcc" input carries the "lib" output, whose
      ;; libgcc_s.so.1 lives under lib/.
      #:patchelf-plan
      #~'(("nu" ("glibc" "zlib" "gcc"))
          ("nu_plugin_custom_values" ("glibc" "zlib" "gcc"))
          ("nu_plugin_example" ("glibc" "zlib" "gcc"))
          ("nu_plugin_formats" ("glibc" "zlib" "gcc"))
          ("nu_plugin_gstat" ("glibc" "zlib" "gcc"))
          ("nu_plugin_inc" ("glibc" "zlib" "gcc"))
          ("nu_plugin_polars" ("glibc" "zlib" "gcc"))
          ("nu_plugin_query" ("glibc" "zlib" "gcc"))
          ("nu_plugin_stress_internals" ("glibc" "zlib" "gcc")))))
    (inputs
     (list glibc
           zlib
           (list gcc "lib")))            ; libgcc_s.so.1
    (home-page "https://www.nushell.sh/")
    (synopsis "A new type of shell")
    (description
     "Nushell (or Nu for short) is a new type of shell.  It is designed for
the flexibility of a modern programming language with the ergonomics of a
shell, and works with structured data instead of plain strings.  This
package installs the official prebuilt GNU/Linux binary together with its
plugin binaries; register plugins at runtime with @command{plugin add}.")
    (license license:expat)))
