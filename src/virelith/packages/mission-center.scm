;;; Mission Center for Virelith.
;;;
;;; Audit notes (pinned guix = 49b32687a64d647c97cfb2ef9d7da68023311ab0):
;;;
;;; - Upstream is a Meson project that drives two independent Cargo
;;;   workspaces: the GTK4 GUI at the repository root and the Magpie backend
;;;   under subprojects/magpie.  Both lockfiles are vendored offline from the
;;;   generated (virelith packages mission-center-crates) module; the crates
;;;   are ordinary inputs and are unpacked into a Cargo "directory" source in
;;;   a build phase.  The lockfiles are removed so that Cargo resolves against
;;;   exactly the vendored versions instead of verifying registry checksums.
;;; - Magpie's build.rs downloads nvtop from the network.  It is patched to
;;;   read the source from MC_NVTOP_SOURCE instead, pointing at the `source`
;;;   output of our nvtop package after applying the patches that upstream
;;;   would have applied.  This removes the only network access in the build.
;;; - Magpie also depends on `upower_dbus` from a Git repository.  Cargo's
;;;   directory sources cannot satisfy Git dependencies, so the dependency is
;;;   rewritten to a path pointing at the fetched revision (whose workspace
;;;   root is preserved so the crate's `serde.workspace = true` resolves).
;;; - Mission Center 1.2.0 requires libadwaita >= 1.9; the pinned Guix ships
;;;   1.8.2, hence the local (virelith packages libadwaita).
;;; - `missioncenter-magpie` is launched by name through PATH.  It is patched
;;;   to the absolute output path and both binaries are wrapped with the GPU
;;;   loader library path, the Mesa DRI path and MC_MAGPIE_HW_DB.
;;; - The first-run "advanced features" setup script is intentionally left
;;;   unusable: upstream stages it in /tmp and runs it through pkexec, which
;;;   both assumes a non-Guix FHS layout and is unsafe on a shared /tmp.  The
;;;   GUI exposes the dialog only when the backend reports a script name; the
;;;   backend returns None for it here, so the dialog never appears.

(define-module (virelith packages mission-center)
  #:use-module (virelith packages libadwaita)
  #:use-module (virelith packages mission-center-crates)
  #:use-module (virelith packages monitoring)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages build-tools)  ; ninja
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages freedesktop)  ; desktop-file-utils, wayland
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)           ; mesa, libglvnd
  #:use-module (gnu packages glib)         ; glib, appstream-glib
  #:use-module (gnu packages gnome)        ; blueprint-compiler
  #:use-module (gnu packages gtk)          ; gtk, gdk-pixbuf
  #:use-module (gnu packages linux)        ; eudev
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages rust)         ; rustc, cargo
  #:use-module (gnu packages vulkan)       ; vulkan-loader
  #:use-module (gnu packages xdisorg)      ; libdrm
  #:use-module (gnu packages xml)          ; libxml2 (xmllint)
  #:use-module (guix build-system meson)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (mission-center))

(define %mission-center-version "1.2.0")
(define %mission-center-commit
  "193e3729367035cf184da004c3246efe79d5c53e") ; tag v1.2.0

(define-public mission-center
  (package
    (name "mission-center")
    (version %mission-center-version)
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/mission-center-devs/mission-center.git")
             (commit %mission-center-commit)
             (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hdw6svzj7dq6khaivkinfzkm8ip2bmk9crs9r51jf166z44i5s4"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:glib-or-gtk? #t
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'prepare-sources
            (lambda* (#:key inputs #:allow-other-keys)
              (define source-root (getcwd))

              ;; upower_dbus comes from Git.  Keep the whole checkout so the
              ;; workspace inheritance used by upower/Cargo.toml still works,
              ;; then point the dependency at it.
              (copy-recursively
               (assoc-ref inputs "rust-upower-dbus-0.3.2.87c3c35-checkout")
               (string-append source-root "/guix-upower-dbus"))
              ;; substitute* works line by line, so handle each key separately.
              (substitute*
                  "subprojects/magpie/platform-linux/Cargo.toml"
                (("git = \"https://github.com/pop-os/dbus-settings-bindings.git\"")
                 (string-append "path = \"" source-root
                                "/guix-upower-dbus/upower\""))
                (("rev = \"[0-9a-f]+\"")
                 ""))

              ;; Cargo would verify registry checksums from the lockfiles
              ;; against the stubbed vendored crates; drop them and let Cargo
              ;; resolve against the vendored versions only.
              (delete-file "Cargo.lock")
              (delete-file "subprojects/magpie/Cargo.lock")

              ;; Prepare the pinned nvtop sources and apply the patches that
              ;; Magpie's build.rs would otherwise apply after downloading.
              ;; A single output of a package keeps its plain name as the key.
              (copy-recursively (assoc-ref inputs "nvtop")
                                (string-append source-root "/guix-nvtop"))
              (for-each
               (lambda (patch-file)
                 ;; Upstream ignores patch failures, so tolerate them too.
                 (system* "patch"
                          "-d" (string-append source-root "/guix-nvtop")
                          "-p1" "--forward" "-i" patch-file))
               (map (lambda (patch-file)
                      (string-append source-root "/" patch-file))
                    (find-files
                     "subprojects/magpie/platform-linux/3rdparty/nvtop/patches"
                     "\\.patch$")))
              (setenv "MC_NVTOP_SOURCE"
                      (string-append source-root "/guix-nvtop"))

              ;; Do not download nvtop: use the prepared tree.
              (substitute* "subprojects/magpie/platform-linux/build.rs"
                (("let extracted_path = out_dir.join\\(&package.directory\\);")
                 (string-append
                  "let extracted_path = std::path::PathBuf::from("
                  "std::env::var(\"MC_NVTOP_SOURCE\")"
                  ".expect(\"MC_NVTOP_SOURCE not set\"));")))
              ;; The following "if extracted_path.exists() { break; }" then
              ;; sees the prepared tree and skips the download.

              ;; Disable the optional first-run setup helper: upstream stages
              ;; it at a fixed /tmp path and runs it through pkexec, which is
              ;; unsafe on a world-writable /tmp and assumes an FHS layout.
              ;; An uncreatable path makes get_file_name return None, so the
              ;; GUI never offers the setup dialog.
              (substitute* "subprojects/magpie/platform-linux/src/setup_script.rs"
                (("pub const COMMAND: &str = \"/tmp/missioncenter-magpie-setup\";")
                 (string-append
                  "// Disabled for Guix (see the package audit notes).\n"
                  "pub const COMMAND: &str = "
                  "\"/nonexistent/missioncenter-magpie-setup\";")))

              ;; udevadm lives in the eudev store path, not in /usr/bin.
              (substitute* "subprojects/magpie/platform-linux/src/memory.rs"
                (("\"udevadm\"")
                 (string-append "\""
                                #$(file-append eudev "/bin/udevadm")
                                "\"")))

              ;; Launch the sibling backend by absolute path.
              (substitute* "src/magpie_client/client.rs"
                (("\"missioncenter-magpie\"")
                 (string-append "\"" #$output
                                "/bin/missioncenter-magpie\"")))))

          (add-after 'patch-source-shebangs 'unpack-cargo-vendor
            (lambda* (#:key inputs #:allow-other-keys)
              (define source-root (getcwd))
              (define vendor (string-append source-root "/guix-vendor"))

              ;; Unpack every crate origin into a Cargo directory source.  The
              ;; git-based upower_dbus origin is a directory and is handled
              ;; separately as a path dependency.
              (mkdir-p vendor)
              (for-each
               (lambda (input)
                 (let ((label (car input))
                       (path (cdr input)))
                   (when (string-suffix? ".tar.gz" label)
                     (let* ((base (car (reverse (string-split path #\/))))
                            (dest (string-append vendor "/" base)))
                       (mkdir-p dest)
                       (invoke "tar" "xf" path "-C" dest
                               "--strip-components" "1")
                       ;; Cargo requires a checksum file next to each crate.
                       (call-with-output-file
                           (string-append dest "/.cargo-checksum.json")
                         (lambda (port)
                           (display "{\"files\":{}}" port)))
                       ;; Magpie's lockfile pins cargo-util 0.2.30, whose
                       ;; manifest advertises Rust 1.94 while this Guix has
                       ;; 1.93.  Cargo treats the MSRV as a hard gate; the
                       ;; crate does not use 1.94 features, so relax the
                       ;; advertisement on the vendored copy.
                       (when (string-contains label "cargo-util")
                         (substitute* (string-append dest "/Cargo.toml")
                           (("rust-version = \"1.94\"")
                            "rust-version = \"1.93\"")))
                       ;; libsqlite3-sys 0.38 uses the `cfg_select!` macro,
                       ;; stabilized only in Rust 1.94.  It exists but is
                       ;; gated on 1.93, so enable the feature on the vendored
                       ;; build script and let RUSTC_BOOTSTRAP allow it (see
                       ;; setup-cargo-home).
                       (when (string-contains label "libsqlite3-sys")
                         (substitute* (string-append dest "/build.rs")
                           (("^use std::env;")
                            "#![feature(cfg_select)]\nuse std::env;")))
                       ;; rusqlite 0.40 uses cfg_select! in its library code;
                       ;; a crate-level inner attribute covers all its modules.
                       (when (string-contains label "rusqlite")
                         (substitute* (string-append dest "/src/lib.rs")
                           (("^//! Rusqlite")
                            "#![feature(cfg_select)]\n//! Rusqlite")))
                       ;; The GTK4 crate's `gnome_50` feature turns on gio's
                       ;; v2_88, whose system-deps metadata demands glib 2.88;
                       ;; this Guix has 2.86.  The v2_88 bindings are just FFI
                       ;; declarations, so relax the metadata rather than
                       ;; rebuilding the GLib stack.  (The gtk4 4.22 bindings
                       ;; used by the code are still available.)
                       (when (or (string-contains label "glib-sys")
                                 (string-contains label "gio-sys"))
                         (substitute* (string-append dest "/Cargo.toml")
                           (("version = \"2.88\"")
                            "version = \"2.86\"")))))))
               inputs)))

          (add-after 'configure 'setup-cargo-home
            (lambda _
              ;; Meson points CARGO_HOME at a build-local directory; drop a
              ;; config there that redirects crates.io to the vendored tree.
              (define build-root (getcwd))
              (define vendor
                (string-append (canonicalize-path
                                (string-append build-root "/../source"))
                               "/guix-vendor"))
              (for-each
               (lambda (dir)
                 (mkdir-p dir)
                 (call-with-output-file (string-append dir "/config.toml")
                   (lambda (port)
                     (display "[source.crates-io]\n" port)
                     (display "replace-with = 'vendored-sources'\n\n" port)
                     (display "[source.vendored-sources]\n" port)
                     (display (string-append "directory = '" vendor "'\n")
                              port)
                     (display "\n[resolver]\n" port)
                     (display "incompatible-rust-versions = \"allow\"\n"
                              port))))
               (list (string-append build-root "/cargo-home")
                     (string-append build-root
                                    "/subprojects/magpie/cargo-home")))
              ;; cc-rs looks for a literal "cc"; point it at the toolchain.
              (setenv "CC" "gcc")
              (setenv "CXX" "g++")
              ;; Allow the `cfg_select` feature used by libsqlite3-sys 0.38 on
              ;; the 1.93 toolchain (see unpack-cargo-vendor).
              (setenv "RUSTC_BOOTSTRAP" "1")
              ;; The build sandbox has no network anyway, but be explicit.
              (setenv "CARGO_NET_OFFLINE" "true")
              ;; Magpie's lockfile pins cargo-util 0.2.30, which advertises
              ;; Rust 1.94 while this Guix has 1.93.  The MSRV is only a
              ;; resolver gate; the crate itself does not use 1.94 features.
              (setenv "CARGO_RESOLVER_INCOMPATIBLE_RUST_VERSIONS" "allow")))

          (add-after 'glib-or-gtk-wrap 'wrap-runtime-paths
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (libs (list #$(file-append libglvnd "/lib")
                                 #$(file-append mesa "/lib")
                                 #$(file-append libdrm "/lib")
                                 #$(file-append vulkan-loader "/lib")))
                     (hwdb (string-append out
                                          "/share/missioncenter/hw.db")))
                (for-each
                 (lambda (program)
                   (wrap-program (string-append out "/bin/" program)
                     `("LD_LIBRARY_PATH" ":" prefix ,libs)
                     `("LIBGL_DRIVERS_PATH" ":"
                       prefix
                       (,#$(file-append mesa "/lib/dri")))
                     `("MC_MAGPIE_HW_DB" ":" = (,hwdb))))
                 '("missioncenter" "missioncenter-magpie"))))))))
    (native-inputs
     (list blueprint-compiler
           cmake-minimal
           desktop-file-utils
           gettext-minimal
           `(,glib "bin")
           `(,gtk "bin")
           libxml2
           ninja
           pkg-config
           protobuf
           python
           rust
           `(,rust "cargo")))
    (inputs
     (append
      mission-center-cargo-inputs
      (list bash-minimal
            eudev
            gtk
            libadwaita-1.9
            libdrm
            libglvnd
            mesa
            `(,nvtop "source")
            vulkan-loader)))
    (home-page "https://missioncenter.io/")
    (synopsis "Monitor CPU, memory, disk, network and GPU usage")
    (description
     "Mission Center is a GTK4 application to monitor CPU, memory, disk,
network and GPU usage.  It includes a process and service manager.  The
privileged helpers used for the optional first-run setup are not enabled in
this package; CPU, memory, disk, network, GPU and process information work
without them.")
    (license license:gpl3)))
