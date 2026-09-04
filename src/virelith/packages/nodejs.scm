;;; Node.js toolchain for Virelith.
;;;
;;; pnpm — fast, disk space efficient package manager for Node.js.
;;; Pinned Guix has node (with bundled npm) but no pnpm; ported from
;;; upstream Guix master (2026-09): pnpm is distributed as a Node.js
;;; Single Executable Application (SEA) — the binary needs patchelf
;;; for glibc/gcc:lib and must sit next to dist/ (the SEA loads
;;; ./dist/pnpm.mjs relative to its own location).  The dist tree
;;; contains absolute symlinks from the upstream CI build path, so
;;; validate-runpath is skipped; strip is skipped because it corrupts
;;; the embedded SEA blob.

(define-module (virelith packages nodejs)
  #:use-module (nonguix build-system binary)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build utils) ; modify-phases
  #:use-module (guix download)    ; url-fetch
  #:use-module (ice-9 match)      ; match
  #:use-module (guix packages)
  #:use-module (gnu packages base) ; glibc
  #:use-module (gnu packages gcc)  ; gcc
  #:export (pnpm))

(define-public pnpm
  (package
    (name "pnpm")
    (version "11.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/pnpm/pnpm/releases/download/v"
                           version "/pnpm-linux-"
                           (match (or (%current-system)
                                      (%current-target-system))
                             ("x86_64-linux" "x64")
                             ("aarch64-linux" "arm64"))
                           ".tar.gz"))
       (sha256
        (base32
         (match (or (%current-system)
                    (%current-target-system))
           ("x86_64-linux"
            "0qw21m5vylw17j2lkb2f80ypkd8kw4cmqsn0zvq2lg27wjf4ip5a")
           ("aarch64-linux"
            "0fzla4a6hvnld6vcn5g8jghbgc10kj8wxyw1dlblqylg02dj3sv4"))))))
    (build-system binary-build-system)
    (arguments
     `(#:patchelf-plan `(("pnpm" ("glibc" "gcc:lib")))
       ;; The `pnpm' binary loads `./dist/pnpm.mjs' relative to its own
       ;; location, so install it next to `dist/' and symlink into `bin/'.
       #:install-plan `(("pnpm" "lib/pnpm/pnpm")
                        ("dist" "lib/pnpm/dist"))
       ;; `dist/node_modules/.bin/' contains absolute symlinks pointing to the
       ;; upstream CI build path; `validate-runpath' chokes trying to read
       ;; them.  Skip it -- only the `pnpm' binary needs patching.
       #:validate-runpath? #f
       ;; `pnpm' is a Node.js Single Executable Application; `strip' moves
       ;; sections and corrupts the embedded SEA blob, so leave it alone.
       #:strip-binaries? #f
       #:phases
       (modify-phases %standard-phases
         ;; The tarball has multiple top-level entries (`pnpm' and `dist').
         ;; The standard `unpack' phase chdirs into the only subdirectory it
         ;; finds (`dist'), so step back up before patching and installing.
         (add-after 'unpack 'chdir-up
           (lambda _
             (chdir "..")))
         (add-after 'install 'symlink-bin
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin")))
               (mkdir-p bin)
               (symlink (string-append out "/lib/pnpm/pnpm")
                        (string-append bin "/pnpm"))))))))
    (inputs `(("glibc" ,glibc)
              ("gcc:lib" ,gcc "lib")))
    (supported-systems '("x86_64-linux" "aarch64-linux"))
    (home-page "https://pnpm.io")
    (synopsis "Fast, disk space efficient package manager for nodejs")
    (description "PNPM uses a content-addressable filesystem to
store all files from all module directories on a disk")
    (license license:expat)))
