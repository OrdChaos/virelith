;;; Deterministic pnpm node_modules production for Virelith.
;;;
;;; Guix's node-build-system only knows npm.  DSH is a pnpm workspace whose
;;; install shims embed the absolute source directory, and pnpm's store index
;;; contains validation timestamps.  A fixed-output derivation that directly
;;; pins the pnpm store is therefore not reproducible.
;;;
;;; Instead, install once in a fixed absolute directory and pin the resulting
;;; source + workspace node_modules tree.  The shims then contain that constant
;;; path.  The consuming package materializes the tree at the same path, so
;;; build-time shims work; the install phase rewrites them to the store path.
;;; pnpm's per-install metadata files (which carry timestamps) are removed.
;;; Shim shebangs and `command -p' are made Guix-compatible before hashing so
;;; the same tree works in the build sandbox and after installation.

(define-module (virelith packages pnpm-deps)
  #:use-module (gnu packages base) ;tar
  #:use-module (gnu packages bash) ;bash-minimal
  #:use-module (gnu packages compression) ;gzip, zstd
  #:use-module (gnu packages node) ;node
  #:use-module (guix gexp)
  #:use-module (guix monads)
  #:use-module (guix packages)
  #:use-module (guix store)
  #:use-module (ice-9 match)
  #:use-module (virelith packages nodejs) ;pnpm
  #:export (%pnpm-build-root
            pnpm-install-method
            pnpm-install
            pnpm-closure-method
            pnpm-closure))

;; Keep this path stable: pnpm install shims embed it, and the fixed-output
;; hash depends on it.  The consuming package must build at the same path.
(define %pnpm-build-root "/tmp/guix-dsh-build")

(define* (pnpm-install-method uri hash-algo hash
                              #:optional (name "pnpm-node-modules")
                              #:key (system (%current-system))
                              (guile (default-guile)))
  "Return a fixed-output derivation containing SOURCE after a frozen-lockfile
pnpm install of URI, a (SOURCE LOCKFILE WORKSPACE PNPM NODE) tuple.  SOURCE is
a tarball or a directory; LOCKFILE and WORKSPACE are relative names.  The
install runs in %PNPM-BUILD-ROOT; per-install metadata is removed and pnpm
shims are made Guix-compatible before the tree is hashed."
  (match uri
    ((source lockfile workspace pnpm node root)
     (unless (and (string? lockfile)
                  (or (not workspace) (string? workspace))
                  (string? root))
       (error "pnpm-install-method: lockfile/workspace must be relative names"
              lockfile workspace root))
     (mlet %store-monad ((guile (package->derivation guile system #:graft? #f)))
       (gexp->derivation name
         (with-imported-modules '((guix build utils))
           #~(begin
               (use-modules (guix build utils))
               (let* ((root #$root)
                      (home (string-append root "-home"))
                      (cache (string-append root "-cache"))
                      (store (string-append root "-store"))
                      (source #$source))
                 (for-each (lambda (path)
                             (when (file-exists? path)
                               (delete-file-recursively path)))
                           (list root home cache store))
                 (mkdir-p root)
                 (mkdir-p home)
                 (mkdir-p cache)
                 (setenv "PATH"
                         (string-append #$(file-append gzip "/bin") ":"
                                        #$(file-append zstd "/bin") ":"
                                        #$(file-append tar "/bin") ":"
                                        (getenv "PATH")))
                 (if (eq? 'directory (stat:type (stat source)))
                     (copy-recursively source root #:follow-symlinks? #f)
                     ;; Guix may store a downloaded tarball recompressed as
                     ;; .tar.zst regardless of the origin's file-name, so let
                     ;; tar detect the compression instead of forcing gzip.
                     (invoke #$(file-append tar "/bin/tar")
                             "-xf" source "-C" root
                             "--strip-components=1"))
                 (when #$(if workspace #t #f)
                   (unless (file-exists? (string-append root "/" #$workspace))
                     (error "workspace file missing from pnpm install source"
                            #$workspace)))
                 (unless (file-exists? (string-append root "/" #$lockfile))
                   (error "lockfile missing from pnpm install source"
                          #$lockfile))
                 (setenv "HOME" home)
                 (setenv "XDG_CACHE_HOME" cache)
                 (setenv "npm_config_cache" (string-append cache "/npm"))
                 (setenv "pnpm_config_pm_on_fail" "ignore")
                 (setenv "pnpm_config_ignore_scripts" "true")
                 (setenv "CI" "true")
                 (setenv "PATH"
                         (string-append #$(file-append node "/bin") ":"
                                        #$(file-append pnpm "/bin") ":"
                                        (getenv "PATH")))
                 (with-directory-excursion root
                   (invoke #$(file-append pnpm "/bin/pnpm")
                           "install"
                           "--frozen-lockfile"
                           "--store-dir" store
                           "--package-import-method=copy"
                           "--reporter=append-only"))
                 (for-each (lambda (file)
                             (when (file-exists? file)
                               (delete-file file)))
                           (list (string-append root
                                                "/node_modules/.modules.yaml")
                                 (string-append
                                  root
                                  "/node_modules/.pnpm-workspace-state-v1.json")))
                 ;; Make pnpm shims usable without an FHS /bin/sh or a
                 ;; compiled-in `command -p' default path.
                 (for-each
                  (lambda (file)
                    (substitute* file
                      (("#!/bin/sh")
                       (string-append "#!"
                                      #$(file-append bash-minimal "/bin/sh")))
                      (("#!/usr/bin/env node")
                       (string-append "#!"
                                      #$(file-append node "/bin/node")))
                      (("#!/usr/bin/env bash")
                       (string-append "#!"
                                      #$(file-append bash-minimal "/bin/bash")))
                      (("command -p ") "")))
                  (find-files root
                              (lambda (file stat)
                                (and (eq? 'regular (stat:type stat))
                                     (string-contains file "/.bin/")))))
                 (copy-recursively root #$output
                                   #:follow-symlinks? #f))))
         #:system system
         #:graft? #f
         #:hash-algo hash-algo
         #:hash hash
         #:recursive? #t
         #:guile-for-build guile
         #:leaked-env-vars '("http_proxy" "https_proxy" "no_proxy"
                             "TMPDIR")
         #:local-build? #t)))))

(define* (pnpm-closure-method uri hash-algo hash
                              #:optional (name "pnpm-closure")
                              #:key (system (%current-system))
                              (guile (default-guile)))
  "Return a fixed-output derivation containing SOURCE after a non-frozen pnpm
install.  URI is a (SOURCE WORKSPACE PNPM NODE ROOT) tuple.  The generated
lockfile is left in the output for inspection; dependency resolution is pinned
only by the recursive output hash."
  (match uri
    ((source workspace pnpm node root)
     (unless (and (string? workspace) (string? root))
       (error "pnpm-closure-method: workspace/root must be strings"
              workspace root))
     (mlet %store-monad ((guile (package->derivation guile system #:graft? #f)))
       (gexp->derivation name
         (with-imported-modules '((guix build utils))
           #~(begin
               (use-modules (guix build utils))
               (let* ((root #$root)
                      (home (string-append root "-home"))
                      (cache (string-append root "-cache"))
                      (store (string-append root "-store"))
                      (source #$source))
                 (for-each (lambda (path)
                             (when (file-exists? path)
                               (delete-file-recursively path)))
                           (list root home cache store))
                 (mkdir-p root)
                 (mkdir-p home)
                 (mkdir-p cache)
                 (copy-recursively source root #:follow-symlinks? #f)
                 (unless (file-exists? (string-append root "/" #$workspace))
                   (error "workspace file missing from pnpm closure source"
                          #$workspace))
                 (setenv "HOME" home)
                 (setenv "XDG_CACHE_HOME" cache)
                 (setenv "npm_config_cache" (string-append cache "/npm"))
                 (setenv "pnpm_config_pm_on_fail" "ignore")
                 (setenv "pnpm_config_ignore_scripts" "true")
                 (setenv "CI" "true")
                 (setenv "PATH"
                         (string-append #$(file-append node "/bin") ":"
                                        #$(file-append pnpm "/bin") ":"
                                        (getenv "PATH")))
                 (with-directory-excursion root
                   (invoke #$(file-append pnpm "/bin/pnpm")
                           "install"
                           "--ignore-scripts"
                           "--store-dir" store
                           "--package-import-method=copy"
                           "--reporter=append-only"))
                 (for-each (lambda (file)
                             (when (file-exists? file)
                               (delete-file file)))
                           (list (string-append root
                                                "/node_modules/.modules.yaml")
                                 (string-append
                                  root
                                  "/node_modules/.pnpm-workspace-state-v1.json")))
                 (for-each
                  (lambda (file)
                    (substitute* file
                      (("#!/bin/sh")
                       (string-append "#!"
                                      #$(file-append bash-minimal "/bin/sh")))
                      (("#!/usr/bin/env node")
                       (string-append "#!"
                                      #$(file-append node "/bin/node")))
                      (("#!/usr/bin/env bash")
                       (string-append "#!"
                                      #$(file-append bash-minimal "/bin/bash")))
                      (("command -p ") "")))
                  (find-files root
                              (lambda (file stat)
                                (and (eq? 'regular (stat:type stat))
                                     (string-contains file "/.bin/")))))
                 (copy-recursively root #$output
                                   #:follow-symlinks? #f))))
         #:system system
         #:graft? #f
         #:hash-algo hash-algo
         #:hash hash
         #:recursive? #t
         #:guile-for-build guile
         #:leaked-env-vars '("http_proxy" "https_proxy" "no_proxy"
                             "TMPDIR")
         #:local-build? #t)))))

(define* (pnpm-install #:key source
                       (lockfile "pnpm-lock.yaml")
                       (workspace "pnpm-workspace.yaml")
                       (pnpm pnpm)
                       (node node)
                       (root %pnpm-build-root)
                       hash)
  "Return a fixed-output origin holding SOURCE after pnpm install (source
plus all workspace node_modules trees).  HASH is the recursive sha256.
ROOT is the fixed absolute install directory; it is embedded in pnpm shims
and must be unique per concurrently built profile."
  (origin
    (method pnpm-install-method)
    (uri (list source lockfile workspace pnpm node root))
    (file-name "pnpm-node-modules")
    (sha256 hash)))

(define* (pnpm-closure #:key source
                       (workspace "pnpm-workspace.yaml")
                       (pnpm pnpm)
                       (node node)
                       (root %pnpm-build-root)
                       hash)
  "Return a fixed-output origin holding SOURCE after a non-frozen pnpm
install.  HASH is the recursive sha256 of the installed tree.  ROOT is the
fixed install directory embedded in pnpm shims."
  (origin
    (method pnpm-closure-method)
    (uri (list source workspace pnpm node root))
    (file-name "pnpm-closure")
    (sha256 hash)))
