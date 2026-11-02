;;; DeepSeek Harness (DSH) for Virelith.
;;;
;;; DSH is a pnpm workspace.  Guix has no pnpm build system.  A fixed-output
;;; derivation installs the workspace once at a stable absolute path and pins
;;; the resulting source + workspace node_modules tree; the package build
;;; reuses that tree at the same path and runs the official build.  The
;;; package installs the complete CLI/web workspace under libexec.
;;;
;;; The wrapper always passes --expose-internals: DSH's profile resolver and
;;; HMR service use Node internal module loaders.  The wrapper deliberately
;;; does not put pnpm on PATH: installed profiles are read-only compositions
;;; managed by Guix.

(define-module (virelith packages deepseek-harness)
  #:use-module (gnu packages bash) ;bash-minimal
  #:use-module (gnu packages base) ;patch
  #:use-module (gnu packages gcc) ;gcc
  #:use-module (gnu packages node) ;node
  #:use-module (gnu packages pkg-config) ;pkg-config
  #:use-module (gnu packages python) ;python-minimal
  #:use-module (gnu packages version-control) ;git-minimal
  #:use-module (guix build-system gnu)
  #:use-module (guix download) ;url-fetch
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (virelith packages nodejs) ;pnpm
  #:use-module (virelith packages pnpm-deps)
  #:export (deepseek-harness))

(define %deepseek-harness-version "0.2.1-rc.5")
(define %deepseek-harness-commit
  "b830ec950faba0a46dda564be3e2d854afed94f1")
(define %deepseek-harness-source-hash
  (base32 "07xq1p7mhyyrmya1b4rqrjn7i2szmrs653493lgvp1rs33qlzfd2"))
;; Bump together with the source, pnpm, node, or bash-minimal version:
;; pnpm install shims embed those store paths and %pnpm-build-root.
(define %deepseek-harness-node-modules-hash
  (base32 "1p5zd02pb30f88b9i46mb2wr6j13ff7ln8gb18r8mn1y2k40glcr"))

(define %deepseek-harness-source
  (origin
    (method url-fetch)
    (uri (string-append "https://codeload.github.com/deepseek-ai/"
                        "deepseek-harness/tar.gz/refs/tags/dsh-v"
                        %deepseek-harness-version))
    (file-name (string-append "deepseek-harness-"
                              %deepseek-harness-version
                              ".tar.gz"))
    (sha256 %deepseek-harness-source-hash)
    (patches (list (local-file "patches/config-editor-home.patch")))))

(define %deepseek-harness-node-modules
  (pnpm-install #:source %deepseek-harness-source
                #:lockfile "pnpm-lock.yaml"
                #:workspace "pnpm-workspace.yaml"
                #:hash %deepseek-harness-node-modules-hash))

(define-public deepseek-harness
  (package
    (name "deepseek-harness")
    (version %deepseek-harness-version)
    (source %deepseek-harness-source)
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:validate-runpath? #f
      #:strip-binaries? #f
      #:modules '((guix build gnu-build-system) (guix build utils))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda _
              (let* ((root #$%pnpm-build-root)
                     (home "/tmp/guix-dsh-build-home")
                     (cache "/tmp/guix-dsh-build-cache"))
                (for-each (lambda (path)
                            (when (file-exists? path)
                              (delete-file-recursively path)))
                          (list root home cache))
                (mkdir-p root)
                (mkdir-p home)
                (mkdir-p cache)
                (copy-recursively #$%deepseek-harness-node-modules
                                  root
                                  #:follow-symlinks? #f)
                (invoke "chmod" "-R" "u+w" root)
                (chdir root)
                ;; The build root comes from the pinned pnpm closure, not the
                ;; unpacked source; apply the source patch to that tree too.
                (invoke #$(file-append patch "/bin/patch")
                        "-p1" "-i"
                        #$(local-file "patches/config-editor-home.patch"))
                ;; The native addon build invokes `cc' directly.
                (let ((tools "/tmp/guix-dsh-build-tools"))
                  (when (file-exists? tools)
                    (delete-file-recursively tools))
                  (mkdir-p (string-append tools "/bin"))
                  (symlink #$(file-append gcc "/bin/gcc")
                           (string-append tools "/bin/cc"))
                  (symlink #$(file-append gcc "/bin/gcc")
                           (string-append tools "/bin/c++"))
                  (setenv "PATH"
                          (string-append tools "/bin:" (getenv "PATH"))))
                (setenv "HOME" home)
                (setenv "XDG_CACHE_HOME" cache)
                (setenv "npm_config_cache" (string-append cache "/npm"))
                (setenv "CI" "true")
                (setenv "pnpm_config_pm_on_fail" "ignore")
                ;; The fixed node_modules tree intentionally omits pnpm's
                ;; timestamped state file.  Do not let `pnpm run' try to
                ;; re-install before executing the build script.
                (setenv "pnpm_config_verify_deps_before_run" "false")
                (setenv "DSH_CLIENT_COMMIT_HASH"
                        #$%deepseek-harness-commit)
                (setenv "DSH_CLIENT_BUILD_PROFILE" "official")
                (setenv "PATH"
                        (string-append #$(file-append node "/bin") ":"
                                       #$(file-append pnpm "/bin") ":"
                                       (getenv "PATH")))
                (invoke #$(file-append pnpm "/bin/pnpm") "run" "build"))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (dest (string-append out "/libexec/deepseek-harness"))
                     (root #$%pnpm-build-root)
                     (nm (string-append dest "/node_modules")))
                (mkdir-p dest)
                (copy-recursively root dest #:follow-symlinks? #f)

                ;; Drop dangling links from optional cross-platform packages.
                (invoke "find" (string-append nm "/.pnpm")
                        "-type" "l" "!" "-exec" "test" "-e" "{}" ";"
                        "-delete")

                ;; Per-install files carry timestamps and must not leak into
                ;; the package output.
                (for-each (lambda (file)
                            (when (file-exists? file)
                              (delete-file file)))
                          (list (string-append nm "/.modules.yaml")
                                (string-append
                                 nm "/.pnpm-workspace-state-v1.json")))

                ;; pnpm shims embed the fixed build root.  Retarget them to
                ;; the installed tree so they remain usable at runtime.
                (for-each
                 (lambda (file)
                   (substitute* file
                     ((#$%pnpm-build-root) dest)))
                 (find-files nm
                             (lambda (file stat)
                               (and (eq? 'regular (stat:type stat))
                                    (string-contains file "/.bin/")))))

                (let ((bin (string-append out "/bin")))
                  (mkdir-p bin)
                  (call-with-output-file (string-append bin "/dsh")
                    (lambda (port)
                      (format port "#!~a~%"
                              #$(file-append bash-minimal "/bin/sh"))
                      (format port
                              "exec ~a --expose-internals ~a \"$@\"~%"
                              #$(file-append node "/bin/node")
                              (string-append dest
                                             "/apps/cli/lib/bin.js"))))
                  (chmod (string-append bin "/dsh") #o555)))))
          (add-after 'install 'check-installed
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (home (string-append (getenv "TMPDIR")
                                          "/dsh-check-home")))
                (mkdir-p home)
                (setenv "HOME" home)
                (setenv "DSH_HOME" (string-append home "/.dsh"))
                (setenv "DSH_AGENTS_HOME" (string-append home "/.dsh/agents"))
                (invoke (string-append out "/bin/dsh") "--version")))))))
    (native-inputs
     (list node pnpm %deepseek-harness-node-modules
           gcc patch python-minimal pkg-config git-minimal bash-minimal))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/deepseek-ai/deepseek-harness")
    (synopsis "AI agent harness with a plugin-based architecture")
    (description
     "DeepSeek Harness is a self-hosted AI agent harness built around a plugin
architecture.  It ships a CLI and a web UI and is extended through workspace
plugins.  This package builds the official CLI/web tree from the pinned
upstream release and installs the dsh launcher.")
    (license license:expat)))
