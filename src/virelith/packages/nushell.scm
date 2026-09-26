;;; Nushell for Virelith.
;;;
;;; Built from source with Guix's cargo-build-system instead of patching the
;;; upstream prebuilt binaries.  The full Cargo.lock of Nushell 0.115.1 (991
;;; registry crates, no git dependencies) is vendored offline from
;;; (virelith packages nushell-crates); the Cargo.lock is dropped by the
;;; build system so Cargo resolves against exactly the vendored versions.
;;;
;;; Rust 1.95 matches the workspace `rust-version = "1.95.0"`.  The default
;;; feature set is kept (helix, lsp, mcp, network, plugin, rustls-tls,
;;; sqlite, trash-support) so the binary matches the upstream release.
;;;
;;; Native linkage:
;;; - LIBGIT2_SYS_USE_PKG_CONFIG/LIBSSH2_SYS_USE_PKG_CONFIG force git2 and
;;;   libssh2-sys to the system libraries (guix sets these in the cargo
;;;   build system's configure phase), hence libgit2-1.9 + libssh2 + zlib
;;;   + openssl (libgit2's TLS backend).
;;; - ZSTD_SYS_USE_PKG_CONFIG forces zstd-sys (polars) to the system zstd.
;;; - rusqlite compiles its bundled SQLite amalgamation with cc, so no
;;;   system sqlite is required; the sqlite input documents the ABI link.
;;; - rustls uses the `ring' provider, so aws-lc-sys never compiles; cmake
;;;   and clang are kept as native inputs as a hedge for the aws-lc/bindgen
;;;   path should feature resolution ever select it.

(define-module (virelith packages nushell)
  #:use-module (virelith packages nushell-crates)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)   ; zlib, zstd
  #:use-module (gnu packages llvm)           ; clang
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages rust)           ; rust-1.95
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages ssh)            ; libssh2
  #:use-module (gnu packages tls)            ; openssl
   #:use-module (gnu packages version-control) ; libgit2-1.9
   #:use-module (guix build utils)
   #:use-module (guix build-system cargo)
   #:use-module (guix gexp)
   #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
   ;; Keep modify-phases' `replace' clause unbound at this module level;
   ;; (guix packages) exports a different `replace' syntax for modify-inputs.
   #:use-module ((guix packages) #:hide (replace))
  #:export (nushell))

;; Bump VERSION/COMMIT together when updating the package, and regenerate
;; (virelith packages nushell-crates) from the new Cargo.lock.
(define %nushell-version "0.115.1")
(define %nushell-commit
  "798c55d19505fd52f205d7eb32a571b9d06ec9e6") ; tag 0.115.1

(define %nushell-plugin-names
  '("nu_plugin_custom_values"
    "nu_plugin_example"
    "nu_plugin_formats"
    "nu_plugin_gstat"
    "nu_plugin_inc"
    "nu_plugin_polars"
    "nu_plugin_query"
    "nu_plugin_stress_internals"))

(define-public nushell
  (package
    (name "nushell")
    (version %nushell-version)
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nushell/nushell")
             (commit %nushell-commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "028faspfc3nfvk6cm093dwi6lls1kkmsfimsz3z8j3vjdnsnyxxa"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:rust rust-1.95
       ;; The suite is huge and exercises plugin IPC against built binaries;
       ;; the sandbox build verifies compilation and installation instead.
       #:tests? #f
       ;; Plugins are workspace members rather than root-package targets.
       #:cargo-build-flags ''("--release" "--workspace")
       ;; Install nu and the plugin binaries straight from the release
      ;; profile.  The stock install phase drives `cargo install' once per
      ;; path and trips over its own for-each on this Guix revision
      ;; ("Wrong type to apply"), and would rebuild each crate anyway.
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (exe)
                   (install-file (string-append "target/release/" exe) bin))
                  (cons "nu" '#$%nushell-plugin-names))))))
      ;; No cargo source repack: only binaries are installed.
      #:install-source? #f))
    (native-inputs
     (list clang cmake pkg-config))
    (inputs
     (append
      nushell-cargo-inputs
      (list libgit2-1.9
            libssh2
             openssl
             sqlite
             zlib
             `(,zstd "lib"))))
    (home-page "https://www.nushell.sh/")
    (synopsis "A new type of shell")
    (description
     "Nushell (or Nu for short) is a new type of shell.  It is designed for
the flexibility of a modern programming language with the ergonomics of a
shell, and works with structured data instead of plain strings.  This
package builds Nu and its plugin binaries from source; register plugins at
runtime with @command{plugin add}.")
    (license license:expat)))
