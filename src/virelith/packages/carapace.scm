;;; Carapace for Virelith.
;;;
;;; Carapace-bin and the Carapace modules it is compiled from.  Its third-party
;;; Go dependencies (including the pflag/ssh_config forks and the custom cobra)
;;; live in (virelith packages carapace-dependencies); Guix-provided
;;; dependencies are re-exported from there.
;;;
;;; The build uses Guix's go-build-system, which works in GOPATH mode
;;; (GO111MODULE=off): go.mod/go.sum are ignored and every dependency is
;;; resolved as a source tree below GOPATH/src.  The consequences are the
;;; following.
;;;
;;; 1. The completion registries are not committed upstream.  They are
;;;    produced by `go generate ./cmd/...', which builds carapace-generate and
;;;    writes cmd/carapace/cmd/completers/completers_*.go plus the generated
;;;    completers_release/ overlay from the completers/ specs.  The build
;;;    therefore runs code generation first and then installs with
;;;    `-tags force_all' (the flags upstream CI uses for the GNU/Linux
;;;    artifact) so every completer is compiled into the binary.
;;;
;;;    carapace-generate locates the module path with `go mod edit', which
;;;    does not work with GO111MODULE=off; a small patch derives it from the
;;;    GOPATH layout instead.
;;;
;;; 2. Modules whose root directory holds no Go package (carapace-bridge,
;;;    carapace-jq, carapace-jjlex, carapace-pnpm) are only needed as source
;;;    trees by carapace-bin, hence #:skip-build?; the remaining modules are
;;;    compiled to catch API drift from the Guix-provided dependencies.
;;;
;;; 3. None of the upstream test suites is run: they are extensive and
;;;    exercise completers by spawning external commands.  The sandbox build
;;;    verifies compilation of the whole closure and the resulting binary.

(define-module (virelith packages carapace)
  #:use-module (virelith packages carapace-dependencies)
  #:use-module ((gnu packages) #:select (search-patches))
  #:use-module (gnu packages golang)       ;go-1.26
  #:use-module (guix build-system go)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (go-github-com-carapace-sh-carapace-shlex
            go-github-com-carapace-sh-carapace
            go-github-com-carapace-sh-carapace-bridge
            go-github-com-carapace-sh-carapace-spec
            go-github-com-carapace-sh-carapace-jq
            go-github-com-carapace-sh-carapace-jjlex
            go-github-com-carapace-sh-carapace-pnpm
            go-github-com-carapace-sh-carapace-selfupdate
            carapace-bin))

;;; Carapace's own modules.  Their relative order mirrors the dependency
;;; graph: shlex first, then carapace, then the modules built on top of it.

(define-public go-github-com-carapace-sh-carapace-shlex
  (package
    (name "go-github-com-carapace-sh-carapace-shlex")
    (version "1.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/carapace-sh/carapace-shlex")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vhip9mjmvwwbv3vjlnd8c4sqg7fzjw6y45z7fmiagywfxbbvy51"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/carapace-sh/carapace-shlex"
      #:tests? #f))
    (home-page "https://github.com/carapace-sh/carapace-shlex")
    (synopsis "POSIX shell lexer for Carapace")
    (description
     "This package provides a POSIX shell lexer used by Carapace to split
command lines for completion.")
    (license license:asl2.0)))

(define-public go-github-com-carapace-sh-carapace
  (package
    (name "go-github-com-carapace-sh-carapace")
    (version "1.16.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/carapace-sh/carapace")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0l125hbdi2l2wcrbq468fcp0fn8g8hymlcz7cgxf5izi4v2idhcp"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/carapace-sh/carapace"
      #:tests? #f))
    (propagated-inputs
     (list go-github-com-carapace-sh-carapace-shlex
           go-github-com-spf13-cobra
           go-github-com-spf13-pflag
           go-gopkg-in-yaml-v3))
    (home-page "https://github.com/carapace-sh/carapace")
    (synopsis "Completion engine for Carapace")
    (description
     "This package is the Carapace completion library.  It provides actions,
formatters and shell integrations used to describe and serve argument
completions.  The bundled @file{third_party} packages are vendored in-tree
and resolved as-is from the source tree.")
    (license license:asl2.0)))

(define-public go-github-com-carapace-sh-carapace-bridge
  (package
    (name "go-github-com-carapace-sh-carapace-bridge")
    (version "1.6.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/carapace-sh/carapace-bridge")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03hwsgl7y776gm0b72p72z9fc4a1xxyvala906zl13vagdl6nz6a"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/carapace-sh/carapace-bridge"
      ;; No Go package at the module root; only the source tree is consumed.
      #:skip-build? #t
      #:tests? #f))
    (home-page "https://github.com/carapace-sh/carapace-bridge")
    (synopsis "Bridge to external completion engines for Carapace")
    (description
     "This package bridges Carapace to completion systems such as cobra,
clap, urfave/cli, argcomplete and others.  Only the source tree is installed;
carapace-bin compiles the packages it needs.")
    (license license:expat)))

(define-public go-github-com-carapace-sh-carapace-spec
  (package
    (name "go-github-com-carapace-sh-carapace-spec")
    (version "1.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/carapace-sh/carapace-spec")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1f4j5n6knq379ai07fsksbnnk2rbsx8hwcxcv2lfb7247d44jic5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/carapace-sh/carapace-spec"
      #:tests? #f))
    (propagated-inputs
     (list go-github-com-carapace-sh-carapace
           go-github-com-carapace-sh-carapace-shlex
           go-github-com-spf13-cobra
           go-github-com-spf13-pflag
           go-gopkg-in-yaml-v3))
    (home-page "https://github.com/carapace-sh/carapace-spec")
    (synopsis "YAML completion spec support for Carapace")
    (description
     "This package implements Carapace's YAML spec format, which turns a
declarative document into completions without writing Go code.")
    (license license:expat)))

(define-public go-github-com-carapace-sh-carapace-jq
  (package
    (name "go-github-com-carapace-sh-carapace-jq")
    (version "0.0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/carapace-sh/carapace-jq")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1chrfgf1xc95p7s9n8wjy1cfr04fmw9n544ngvd010f3lfcksv2d"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/carapace-sh/carapace-jq"
      #:skip-build? #t
      #:tests? #f))
    (home-page "https://github.com/carapace-sh/carapace-jq")
    (synopsis "jq completion support for Carapace")
    (description
     "This package adds completion for jq expressions to Carapace.  Only the
source tree is installed; carapace-bin compiles the packages it needs.")
    (license license:expat)))

(define-public go-github-com-carapace-sh-carapace-jjlex
  (package
    (name "go-github-com-carapace-sh-carapace-jjlex")
    (version "0.1.17")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/carapace-sh/carapace-jjlex")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dpi2ckk51a263kynz61y1sc566pd73h86cqq7p57znn4i4przmc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/carapace-sh/carapace-jjlex"
      #:skip-build? #t
      #:tests? #f))
    (home-page "https://github.com/carapace-sh/carapace-jjlex")
    (synopsis "Jujutsu revset and fileset completion for Carapace")
    (description
     "This package adds completion of Jujutsu revsets, filesets and templates
to Carapace.  Only the source tree is installed; carapace-bin compiles the
packages it needs.")
    (license license:expat)))

(define-public go-github-com-carapace-sh-carapace-pnpm
  (package
    (name "go-github-com-carapace-sh-carapace-pnpm")
    (version "0.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/carapace-sh/carapace-pnpm")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1andzl6hvqmqbjrm2yz83gy7c6ig9fbib5k4mhk2rp494rxh1n14"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/carapace-sh/carapace-pnpm"
      #:skip-build? #t
      #:tests? #f))
    (home-page "https://github.com/carapace-sh/carapace-pnpm")
    (synopsis "pnpm completion support for Carapace")
    (description
     "This package adds pnpm-specific completion to Carapace.  Only the source
tree is installed; carapace-bin compiles the packages it needs.")
    (license license:expat)))

(define-public go-github-com-carapace-sh-carapace-selfupdate
  (package
    (name "go-github-com-carapace-sh-carapace-selfupdate")
    (version "0.0.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/carapace-sh/carapace-selfupdate")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0z3wnb7z4a82cvckg42zfnpw22y4s95arfra1s471fc6k2m25l9q"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/carapace-sh/carapace-selfupdate"
      #:tests? #f))
    (propagated-inputs
     (list go-github-com-carapace-sh-carapace
           go-github-com-spf13-cobra
           ;; cobra needs the pflag fork when compiled from source.
           go-github-com-spf13-pflag))
    (home-page "https://github.com/carapace-sh/carapace-selfupdate")
    (synopsis "Self-update helper for Carapace")
    (description
     "This package implements the self-update machinery shared by Carapace
commands, including release lookup, checksum verification and binary
replacement.")
    (license license:expat)))

;;; The binary.  Its completion registries are generated and the embed files
;;; of its dependencies must be materialized, so the build adds phases before
;;; compilation; see the file header and the origin patch.

;; Bump VERSION/COMMIT/hash together when updating.
(define %carapace-bin-version "1.8.0")
(define %carapace-bin-commit
  "00e8827bf6641c4fd1e9a319d3b051a17139778f") ; tag v1.8.0

(define-public carapace-bin
  (package
    (name "carapace-bin")
    (version %carapace-bin-version)
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/carapace-sh/carapace-bin")
             (commit %carapace-bin-commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04b7a2bbn7w1adr7ggljchq9hzl2j3n7sl63h6y85j2grl7rzvr8"))
       ;; Make the code generator work under GO111MODULE=off; see the patch.
       (patches
        (search-patches
         "virelith/packages/patches/carapace-bin-gopath-codegen.patch"))))
    (build-system go-build-system)
    (arguments
     (list
      ;; Carapace's go.mod asks for Go 1.26; the pinned toolchain matches it.
      #:go go-1.26
      ;; The repository root is the module root; the command lives in ./cmd/carapace.
      #:unpack-path "github.com/carapace-sh/carapace-bin"
      #:import-path "github.com/carapace-sh/carapace-bin/cmd/carapace"
      #:tests? #f
      ;; Only the binary is installed, not the whole source tree.
      #:install-source? #f
      ;; force_all is what upstream CI compiles for the GNU/Linux artifact: it
      ;; selects the generated completer registry that covers every group.
      #:build-flags #~(list "-tags" "force_all")
      ;; Compiled dependencies embed these files; in the GOPATH union they are
      ;; symlinks, which //go:embed rejects, so they must be materialized.
      #:embed-files
      #~(list "bash.sh" "zsh.sh" "capture.zsh" "schema.json"
              "command.yaml" "core.yaml" "flag.yaml" "modifier.yaml"
              "run.yaml" "nonposix.yaml"
              "blockdevice-diskutil.plist" "attributeComplete.nix")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'fix-embed-files 'generate
            (lambda _
              ;; Builds carapace-generate and writes the completion registries
              ;; (cmd/carapace/cmd/completers/completers_*.go) from the specs
              ;; in completers/ and the generated completers_release/ overlay.
              (with-directory-excursion
                  "src/github.com/carapace-sh/carapace-bin"
                (invoke "go" "generate" "./cmd/..."))))
          (add-after 'generate 'set-version
            (lambda _
              ;; main.version defaults to "develop"; record the packaged tag.
              (substitute* (string-append
                            "src/github.com/carapace-sh/carapace-bin"
                            "/cmd/carapace/main.go")
                (("var version = \"develop\"")
                 (format #f "var version = ~s" #$%carapace-bin-version))))))))
    (inputs
     ;; The GOPATH union must contain the complete dependency closure: the
     ;; go-build-system does not follow package inputs transitively.
     (list go-github-com-carapace-sh-carapace
           go-github-com-carapace-sh-carapace-shlex
           go-github-com-carapace-sh-carapace-bridge
           go-github-com-carapace-sh-carapace-spec
           go-github-com-carapace-sh-carapace-jq
           go-github-com-carapace-sh-carapace-jjlex
           go-github-com-carapace-sh-carapace-pnpm
           go-github-com-carapace-sh-carapace-selfupdate
           go-github-com-spf13-cobra
           go-github-com-spf13-pflag
           go-github-com-kevinburke-ssh-config
           go-github-com-micromdm-plist
           go-gopkg-in-yaml-v3
           go-gopkg-in-ini-v1
           go-github-com-pelletier-go-toml
           go-github-com-pelletier-go-toml-v2
           go-golang-org-x-mod))
    (home-page "https://carapace.sh/")
    (synopsis "Multi-shell command argument completion binary")
    (description
     "Carapace-bin provides argument completion for a large number of CLI
commands and integrates with multiple shells, including Bash, Elvish, Fish,
Nushell, Oil, PowerShell, Tcsh, Xonsh and Zsh.  This package compiles the
binary and all completers from source.")
    (license license:expat)))
