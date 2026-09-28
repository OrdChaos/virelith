;;; Offline unit tests for (virelith packages carapace).
;;;
;;; Run:  guix repl -L src tests/carapace.scm
;;;
;;; Pure record/static assertions: no downloads, no lowering, no build.

(use-modules (srfi srfi-1)
             (srfi srfi-64)
             (guix build-system go)
             (guix git-download)
             (guix packages)
             (virelith packages carapace)
             (virelith packages carapace-dependencies))

(define (argument package name)
  (let loop ((arguments (package-arguments package)))
    (and (pair? arguments)
         (pair? (cdr arguments))
         (or (and (keyword? (car arguments))
                  (eq? (keyword->symbol (car arguments)) name)
                  (cadr arguments))
             (loop (cddr arguments))))))

(define (input-names package)
  (map (compose package-name cadr) (package-inputs package)))

(test-begin "carapace")

(test-equal "package version" "1.8.0" (package-version carapace-bin))
(test-equal "pinned release commit"
  "00e8827bf6641c4fd1e9a319d3b051a17139778f"
  (git-reference-commit (origin-uri (package-source carapace-bin))))
(test-assert "go build system"
  (eq? go-build-system (package-build-system carapace-bin)))
(test-equal "binary import path"
  "github.com/carapace-sh/carapace-bin/cmd/carapace"
  (argument carapace-bin 'import-path))
(test-equal "source unpacked at the module root"
  "github.com/carapace-sh/carapace-bin"
  (argument carapace-bin 'unpack-path))
(test-assert "pinned Go 1.26 toolchain"
  (string-contains (object->string (argument carapace-bin 'go)) "1.26"))
(test-assert "source tree is not installed"
  (eq? #f (argument carapace-bin 'install-source?)))

(test-assert "completers are generated before building"
  (let ((args (object->string (argument carapace-bin 'phases))))
    (and (string-contains args "generate")
         (string-contains args "./cmd/..."))))
(test-assert "binary reports the packaged version"
  (let ((args (object->string (argument carapace-bin 'phases))))
    (and (string-contains args "set-version")
         (string-contains args "develop")
         (string-contains args "1.8.0"))))
(test-assert "force_all completer registry"
  (string-contains (object->string (argument carapace-bin 'build-flags))
                   "force_all"))
(test-assert "embedded dependency files are materialized"
  (let ((args (object->string (argument carapace-bin 'embed-files))))
    (and (string-contains args "schema.json")
         (string-contains args "attributeComplete.nix"))))
(test-assert "codegen is patched for GOPATH mode"
  (= 1 (length (origin-patches (package-source carapace-bin)))))

(test-equal "complete GOPATH dependency closure"
  '("go-github-com-carapace-sh-carapace"
    "go-github-com-carapace-sh-carapace-bridge"
    "go-github-com-carapace-sh-carapace-jjlex"
    "go-github-com-carapace-sh-carapace-jq"
    "go-github-com-carapace-sh-carapace-pnpm"
    "go-github-com-carapace-sh-carapace-selfupdate"
    "go-github-com-carapace-sh-carapace-shlex"
    "go-github-com-carapace-sh-carapace-spec"
    "go-github-com-kevinburke-ssh-config"
    "go-github-com-micromdm-plist"
    "go-github-com-pelletier-go-toml"
    "go-github-com-pelletier-go-toml-v2"
    "go-github-com-spf13-cobra"
    "go-github-com-spf13-pflag"
    "go-golang-org-x-mod"
    "go-gopkg-in-ini-v1"
    "go-gopkg-in-yaml-v3")
  (sort (input-names carapace-bin) string<?))

(test-assert "pflag input is the carapace fork installed at the stock path"
  (and (string=? "1.3.0" (package-version go-github-com-spf13-pflag))
       (string-contains
        (git-reference-url (origin-uri (package-source go-github-com-spf13-pflag)))
        "carapace-sh/carapace-pflag")
       (string=? "github.com/spf13/pflag"
                 (argument go-github-com-spf13-pflag 'import-path))))

(test-assert "third-party dependencies come from the dependencies module"
  (every package?
         (list go-github-com-spf13-pflag
               go-github-com-kevinburke-ssh-config
               go-github-com-spf13-cobra
               go-github-com-micromdm-plist)))

(test-assert "source-only modules skip compilation"
  (every (lambda (package)
           (eq? #t (argument package 'skip-build?)))
         (list go-github-com-carapace-sh-carapace-bridge
               go-github-com-carapace-sh-carapace-jq
               go-github-com-carapace-sh-carapace-jjlex
               go-github-com-carapace-sh-carapace-pnpm)))

(test-equal "carapace library version" "1.16.2"
  (package-version go-github-com-carapace-sh-carapace))

(test-end "carapace")
