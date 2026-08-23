;;; Rime packages for Virelith.
;;;
;;; This module keeps the plugin set parameterized: callers can construct a
;;; merged librime variant from any list of <librime-plugin> records instead of
;;; baking plugin names into the package API.

(define-module (virelith packages rime)
               #:use-module (gnu packages ibus)
               #:use-module (gnu packages lua)
               #:use-module (guix build-system copy)
               #:use-module (guix build-system trivial)
               #:use-module (guix gexp)
               #:use-module (guix git-download)
               #:use-module (guix download)
               #:use-module ((guix licenses) #:prefix license:)
               #:use-module (guix packages)
               #:use-module (guix records)
               #:use-module (guix utils)
               #:use-module (ice-9 match)
               #:use-module (srfi srfi-1)
               #:export (make-librime-with-plugins))

(define %librime-version "1.17.0")

(define %librime-source
  (origin
   (method git-fetch)
   (uri (git-reference
         (url "https://github.com/rime/librime")
         (commit %librime-version)))
   (file-name (git-file-name "librime" %librime-version))
   (sha256 (base32 "1hqrsjmir0932rzv752ii4wdf6inh8jjhcrs35aw1yxqjl1qn68y"))))

;; These plugin commits follow the plugin revisions used by Arch's librime
;; packaging around librime 1.17.0.  Updating a plugin only requires changing
;; its descriptor below; make-librime-with-plugins itself remains unchanged.
(define %librime-lua-commit
  "68f9c364a2d25a04c7d4794981d7c796b05ab627")

(define %librime-octagram-commit
  "dfcc15115788c828d9dd7b4bff68067d3ce2ffb8")

(define %librime-lua-source
  (origin
   (method git-fetch)
   (uri (git-reference
         (url "https://github.com/hchunhui/librime-lua")
         (commit %librime-lua-commit)))
   (file-name (git-file-name "librime-lua" %librime-lua-commit))
   (sha256 (base32 "1759pk44bslsfv890gmkrg8r3qrnmimidp1hf3nc2c15s9fymgwv"))))

(define %librime-octagram-source
  (origin
   (method git-fetch)
   (uri (git-reference
         (url "https://github.com/lotem/librime-octagram")
         (commit %librime-octagram-commit)))
   (file-name (git-file-name "librime-octagram" %librime-octagram-commit))
   (sha256 (base32 "15vcg6m4pq99y895f36afyiwm9pjfpfxrr3zf62bkwqmblgjq1bn"))))

(define-record-type* <librime-plugin>
                     librime-plugin make-librime-plugin
                     librime-plugin?
                     (name               librime-plugin-name)
                     (source             librime-plugin-source)
                     (inputs             librime-plugin-inputs (default '()))
                     ;; Map pkg-config names expected by an upstream plugin to concrete .pc files
                     ;; supplied by Guix inputs.  Keeping this in the descriptor lets future
                     ;; plugins carry their own distro-specific compatibility without adding
                     ;; plugin-name conditionals to make-librime-with-plugins.
                     (pkg-config-aliases librime-plugin-pkg-config-aliases (default '()))
                     (license            librime-plugin-license))

(define-public %librime-plugin-lua
  (librime-plugin
   (name "librime-lua")
   (source %librime-lua-source)
   (inputs (list lua))
   ;; Guix installs Lua's pkg-config metadata as lua-<major.minor>.pc, while
   ;; librime-lua probes names such as lua, lua54 and lua53.  Expose a local
   ;; lua.pc alias during this build instead of patching Lua or librime-lua.
   (pkg-config-aliases
    (list
     (cons "lua.pc"
           (file-append
            lua
            (string-append "/lib/pkgconfig/lua-"
                           (version-major+minor (package-version lua))
                           ".pc")))))
   (license license:bsd-3)))

(define-public %librime-plugin-octagram
  (librime-plugin
   (name "librime-octagram")
   (source %librime-octagram-source)
   (license license:gpl3)))

(define-public %default-librime-plugins
  (list %librime-plugin-lua
        %librime-plugin-octagram))

(define (librime-source-with-plugins plugins)
  "Return a source tree containing librime plus PLUGINS under plugins/."
  (computed-file
   "librime-with-plugins-source"
   (with-imported-modules '((guix build utils))
                          #~(begin
                             (use-modules (guix build utils))
                             (mkdir-p #$output)
                             (copy-recursively #$%librime-source #$output)
                             (mkdir-p (string-append #$output "/plugins"))
                             #$@(map
                                 (lambda (plugin)
                                   #~(copy-recursively
                                      #$(librime-plugin-source plugin)
                                      (string-append #$output
                                                     "/plugins/"
                                                     #$(librime-plugin-name plugin))))
                                 plugins)))))

(define (input-without-label input)
  "Convert a labeled package input returned by package-inputs to new-style form.

Guix still exposes package-inputs as a labeled alist for compatibility, while
new package definitions should use bare file-like objects (or (OBJECT OUTPUT)
pairs).  Converting the inherited inputs first avoids creating a mixed old/new
input list when plugin dependencies are appended."
  (match input
         (((? string? _) object output)
          (list object output))
         (((? string? _) object)
          object)
         (_
          input)))

(define (package-inputs-without-labels package)
  (map input-without-label (package-inputs package)))

(define (plugin-inputs plugins)
  (delete-duplicates
   (append-map librime-plugin-inputs plugins)
   eq?))

(define (plugin-pkg-config-aliases plugins)
  (append-map librime-plugin-pkg-config-aliases plugins))

(define (plugin-licenses plugins)
  (delete-duplicates
   (cons (package-license librime)
         (map librime-plugin-license plugins))
   equal?))

(define* (make-librime-with-plugins plugins
                                    #:key
                                    (name "librime-with-plugins"))
         "Return librime 1.17.0 with PLUGINS merged into the core library.

Each element of PLUGINS is a <librime-plugin>.  Plugin sources are placed under
librime's plugins/ directory before CMake runs.  BUILD_MERGED_PLUGINS is forced
on, which avoids depending on frontend support for RimeTraits.plugins_dir.
"
         (package
          (inherit librime)
          (name name)
          (version %librime-version)
          (source (librime-source-with-plugins plugins))
          (inputs
           (append (package-inputs-without-labels librime)
                   (plugin-inputs plugins)))
          (arguments
           (let ((pkg-config-aliases (plugin-pkg-config-aliases plugins)))
             (substitute-keyword-arguments (package-arguments librime)
                                           ((#:configure-flags flags #~'())
                                            #~(append
                                               (list "-DBUILD_MERGED_PLUGINS=ON"
                                                     "-DENABLE_LOGGING=OFF")
                                               #$flags))
                                           ((#:phases phases #~%standard-phases)
                                            (if (null? pkg-config-aliases)
                                              phases
                                              #~(modify-phases #$phases
                                                               (add-before 'configure 'prepare-plugin-pkg-config
                                                                           (lambda _
                                                                             (let ((directory
                                                                                    (string-append (getcwd)
                                                                                                   "/.pkgconfig-compat")))
                                                                               (mkdir-p directory)
                                                                               #$@(map
                                                                                   (lambda (alias)
                                                                                     #~(symlink
                                                                                        #$(cdr alias)
                                                                                        (string-append
                                                                                         directory "/" #$(car alias))))
                                                                                   pkg-config-aliases)
                                                                               (let ((current (getenv "PKG_CONFIG_PATH")))
                                                                                 (setenv
                                                                                  "PKG_CONFIG_PATH"
                                                                                  (if (and current
                                                                                           (> (string-length current) 0))
                                                                                    (string-append directory ":" current)
                                                                                    directory))))))))))))
          (description
           "This is a Virelith variant of librime that merges a selected set of Rime
plugins into the core library at build time.  The plugin set is parameterized
by @code{make-librime-with-plugins}, allowing additional plugins to be added
without changing downstream package interfaces.")
          (license (plugin-licenses plugins))))

(define-public librime-virelith
  (make-librime-with-plugins
   %default-librime-plugins
   #:name "librime-virelith"))

;; Match the rime-ice-git revision used as the baseline for this channel draft.
;; Bump COMMIT/REVISION together when updating the package.
(define %rime-ice-commit "80d213e")
(define %rime-ice-revision "976")

(define-public rime-ice
  (package
   (name "rime-ice")
   (version (git-version "0" %rime-ice-revision %rime-ice-commit))
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/iDvel/rime-ice")
           (commit %rime-ice-commit)))
     (file-name (git-file-name name version))
     (sha256 (base32 "0p696mb1a86l20i9abmfvb131rqnnsd54r2z9w2kcypwwi3phihd"))))
   (build-system copy-build-system)
   (arguments
    (list
     #:install-plan
     #~'(("." "share/rime-data"))
     #:phases
     #~(modify-phases %standard-phases
                      (add-after 'unpack 'prepare-shared-data
                                 (lambda _
                                   ;; Follow the nixpkgs/AUR convention: do not let rime-ice's
                                   ;; default.yaml replace the frontend's global default.yaml.
                                   (when (file-exists? "default.yaml")
                                     (rename-file "default.yaml" "rime_ice_suggestion.yaml"))
                                   
                                   ;; Keep runtime-relevant shared data (including upstream's
                                   ;; tracked build/ artifacts), but omit documentation/CI files.
                                   (for-each
                                    (lambda (directory)
                                      (when (file-exists? directory)
                                        (delete-file-recursively directory)))
                                    '("others" ".github"))
                                   (for-each
                                    (lambda (file)
                                      (when (file-exists? file)
                                        (delete-file file)))
                                    '("README.md" "AGENTS.md")))))))
   (home-page "https://github.com/iDvel/rime-ice")
   (synopsis "Rime Ice schemas and dictionaries")
   (description
    "Rime Ice provides Simplified Chinese Rime schemas, dictionaries, Lua
scripts, OpenCC data, and related shared data.  This package installs the data
under @file{share/rime-data} for use as immutable Rime shared data.")
   (license license:gpl3)))

;; The upstream LTS release asset is intentionally a moving URL.  A fixed hash
;; protects a build from silently accepting changed bytes, but once upstream
;; replaces the asset the old derivation cannot be fetched from that URL.  For
;; long-term channel reproducibility, mirror each accepted snapshot to an
;; immutable Virelith release URL and replace this URI with that mirror.
(define %wanxiang-model-snapshot "2026-08-23")

(define %wanxiang-gram-source
  (origin
   (method url-fetch)
   (uri "https://github.com/amzxyz/RIME-LMDG/releases/download/LTS/wanxiang-lts-zh-hans.gram")
   (sha256 (base32 "1k7f1npaj2hhfn5wzkdqxf92hr5pkrkh6ac0dk3i8wxg8g7sgz65"))))

(define-public rime-wanxiang-gram-zh-hans
  (package
   (name "rime-wanxiang-gram-zh-hans")
   (version %wanxiang-model-snapshot)
   (source %wanxiang-gram-source)
   (build-system trivial-build-system)
   (arguments
    (list
     #:modules '((guix build utils))
     #:builder
     #~(begin
        (use-modules (guix build utils))
        (let ((target (string-append #$output "/share/rime-data")))
          (mkdir-p target)
          (copy-file #$%wanxiang-gram-source
                     (string-append target
                                    "/wanxiang-lts-zh-hans.gram"))))))
   (home-page "https://github.com/amzxyz/RIME-LMDG")
   (synopsis "Wanxiang Simplified Chinese grammar model for Rime")
   (description
    "This package provides the Wanxiang LTS Simplified Chinese Octagram
language model as immutable Rime shared data.")
   (license license:cc-by4.0)))

(define-public rime-data-virelith
  (package
   (name "rime-data-virelith")
   (version (string-append (package-version rime-ice)
                           "+wanxiang-"
                           (package-version rime-wanxiang-gram-zh-hans)))
   (source #f)
   (build-system trivial-build-system)
   (arguments
    (list
     #:modules '((guix build utils))
     #:builder
     #~(begin
        (use-modules (guix build utils))
        (let ((target (string-append #$output "/share/rime-data")))
          (mkdir-p target)
          (copy-recursively
           (string-append #$rime-ice "/share/rime-data")
           target)
          (copy-file
           (string-append #$rime-wanxiang-gram-zh-hans
                          "/share/rime-data/wanxiang-lts-zh-hans.gram")
           (string-append target "/wanxiang-lts-zh-hans.gram"))
          ;; fcitx5-rime expects a shared data directory.  Keep the global
          ;; default empty; user policy can include rime_ice_suggestion from
          ;; declarative default.custom.yaml later.
          (unless (file-exists? (string-append target "/default.yaml"))
            (call-with-output-file (string-append target "/default.yaml")
                                   (lambda (port) (display "" port))))))))
   (home-page "https://github.com/iDvel/rime-ice")
   (synopsis "Rime shared data set for Virelith")
   (description
    "This package composes Rime Ice and the Wanxiang Simplified Chinese
Octagram model into one @file{share/rime-data} tree for fcitx5-rime.")
   (license (list license:gpl3 license:cc-by4.0))))