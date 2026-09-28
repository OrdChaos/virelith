;;; Go dependency packages for Carapace.
;;;
;;; Carapace's go.mod replaces spf13/pflag with carapace-sh/carapace-pflag and
;;; kevinburke/ssh_config with carapace-sh/ssh_config.  Both forks keep the
;;; upstream module path, so in GOPATH mode (see (virelith packages carapace))
;;; they are installed below the original import path.
;;;
;;; Cobra is packaged here instead of reusing Guix's go-github-com-spf13-cobra
;;; because that package propagates the stock pflag, which would collide with
;;; the fork at src/github.com/spf13/pflag in the GOPATH union; it must live in
;;; the same module as the fork.  The two forks therefore sit with the
;;; third-party dependencies rather than with Carapace's own modules.
;;;
;;; Dependencies that Guix already provides unchanged (go-toml, ini, yaml.v3,
;;; x/mod) are re-exported so that (virelith packages carapace) has a single
;;; place to import its dependency set from.

(define-module (virelith packages carapace-dependencies)
  #:use-module (gnu packages golang-build) ;go-golang-org-x-mod
  #:use-module (gnu packages golang-xyz)   ;go-toml, ini, yaml.v3
  #:use-module (guix build-system go)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:re-export (go-golang-org-x-mod
               go-github-com-pelletier-go-toml
               go-github-com-pelletier-go-toml-v2
               go-gopkg-in-ini-v1
               go-gopkg-in-yaml-v3)
  #:export (go-github-com-spf13-pflag
            go-github-com-kevinburke-ssh-config
            go-github-com-spf13-cobra
            go-github-com-micromdm-plist))

;;; The two drop-in forks.  They keep the upstream module path on purpose,
;;; which is what makes them usable as replacements in module mode and lets
;;; GOPATH mode resolve them at the original import path.

;; Bump VERSION/hash together.  This is carapace-sh/carapace-pflag, the fork
;; of spf13/pflag that adds the shorthand flag helpers (StringS, BoolS, ...)
;; used throughout carapace.
(define-public go-github-com-spf13-pflag
  (package
    (name "go-github-com-spf13-pflag")
    (version "1.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/carapace-sh/carapace-pflag")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1d34di93q1l1zq7z0k4hig5sky7dnihgxdgr6q9rqrzhdia1rf8x"))))
    (build-system go-build-system)
    (arguments
     (list
      ;; Same import path as the fork's upstream parent.
      #:import-path "github.com/spf13/pflag"
      #:tests? #f))
    (home-page "https://github.com/carapace-sh/carapace-pflag")
    (synopsis "Drop-in spf13/pflag fork with shorthand flag helpers")
    (description
     "This package is a fork of spf13/pflag that keeps the upstream module
path and adds helpers such as @code{StringS} and @code{BoolS}, which create a
flag from its name and shorthand in one call.  Carapace uses it in place of
the stock pflag.")
    (license license:bsd-3)))

;; carapace-sh also forks kevinburke/ssh_config; the replace directive pins a
;; pseudo-version, so the commit is stored explicitly.
(define %carapace-ssh-config-commit
  "4f04016b8b4bcc44b97f1dda9324620d35a89e10")

(define-public go-github-com-kevinburke-ssh-config
  (package
    (name "go-github-com-kevinburke-ssh-config")
    (version "1.4.1-0.20260319075335")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/carapace-sh/ssh_config")
             (commit %carapace-ssh-config-commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0342zwl1cvizwi69hijrj5jgpkwppzhxg6gkxq1inh55154xlzbd"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/kevinburke/ssh_config"
      #:tests? #f))
    (home-page "https://github.com/carapace-sh/ssh_config")
    (synopsis "Drop-in ssh_config parser fork for Carapace")
    (description
     "This package is carapace-sh's fork of kevinburke/ssh_config.  It keeps
the upstream module path and adds host enumeration used by the Carapace ssh
completer.")
    (license license:expat)))

;; A minimal cobra: same 1.10.2 source as Guix's package, but wired to the
;; pflag fork above instead of propagating the stock pflag (which would
;; collide in the GOPATH union).  The library only needs pflag; the yaml and
;; md2man inputs of the upstream go.mod belong to the cobra generator and its
;; doc package, neither of which Carapace uses.  mousetrap is only imported on
;; Windows (command_win.go), so it is not required for our builds.
(define-public go-github-com-spf13-cobra
  (package
    (name "go-github-com-spf13-cobra")
    (version "1.10.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/spf13/cobra")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1scbqfd58kbbkpcj1rqg4dhapfwzzlp1xh5f52ijs243b1645d4x"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/spf13/cobra"
      #:tests? #f))
    (propagated-inputs
     (list go-github-com-spf13-pflag))
    (home-page "https://github.com/spf13/cobra")
    (synopsis "Go library for creating CLI applications")
    (description
     "Cobra is both a library for creating powerful modern CLI applications as
well as a program to generate applications and command files.  This variant
builds against the Carapace pflag fork.")
    (license license:asl2.0)))

(define-public go-github-com-micromdm-plist
  (package
    (name "go-github-com-micromdm-plist")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/micromdm/plist")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1cigdhb0977f3qfqnjp7svg6yskpd77847d84mgfl9gwngw9m4vb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/micromdm/plist"
      #:tests? #f))
    (home-page "https://github.com/micromdm/plist")
    (synopsis "Go property list encoder and decoder")
    (description
     "This package provides a Go library to decode and encode Apple property
lists.  Carapace uses it for macOS-specific completers.")
    (license license:bsd-3)))
