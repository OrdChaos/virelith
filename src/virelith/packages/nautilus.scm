;;; Nautilus extension stack for Virelith.
;;;
;;; "Open Terminal Here" in the Nautilus context menu, configurable via
;;; GSettings, so the config repo can declare the terminal through its
;;; ordinary gsettings desired-state mechanism
;;; (com.github.stunkymonkey.nautilus-open-any-terminal / terminal).
;;;
;;; Audit notes (pinned guix = the revision in the consuming repo's
;;; channels.lock.scm; nothing here relies on a newer API):
;;;
;;; - Nautilus removed the built-in "Open in Terminal" in GNOME 43; the
;;;   supported upstream mechanism is a nautilus extension. The current
;;;   upstream implementation of nautilus-open-any-terminal (0.8.x) is
;;;   a nautilus-python extension (Python rewrite landed in 0.7.0; the
;;;   0.6.x C versions predate it and hardcode an enum of terminals
;;;   that does not include ghostty, so they are not an option here).
;;; - Pinned Guix has neither nautilus-open-any-terminal nor the
;;;   nautilus-python bindings (grep of gnu/packages: only
;;;   python-nautilus-sampler, unrelated). Both are therefore packaged
;;;   here.
;;; - python-nautilus (upstream nautilus-python) 4.1.0: meson,
;;;   dependencies pygobject-3.0 + libnautilus-extension-4 (>= 43.beta,
;;;   provided by the nautilus package) + gmodule-2.0 + python3 embed.
;;;   No gir build tools needed (src/meson.build compiles only the
;;;   extension .so, installed into nautilus's extensiondir; the Nautilus
;;;   typelib comes from the nautilus package). Upstream has no modern
;;;   release tags (only ancient 1.x), so the pinned commit is the
;;;   "Release 4.1.0" commit on master.
;;; - nautilus-open-any-terminal 0.8.3: setuptools (scm) install with a
;;;   custom install command that places the extension .py under
;;;   share/nautilus-python/extensions (found via XDG_DATA_DIRS by
;;;   nautilus-python, so a profile entry is enough) plus locales and
;;;   the GSettings schema; msgfmt is required at build time and the
;;;   schema is compiled by the glib-or-gtk phase.
;;; - Runtime imports of the extension are `gi` (pygobject) and the
;;;   Nautilus/Gtk-4.0 typelibs; pygobject, python-nautilus and gtk are
;;;   therefore propagated so the user profile closure carries them.

(define-module (virelith packages nautilus)
               #:use-module (guix build-system meson)
               #:use-module (guix build-system python)
               #:use-module (guix git-download)      ; git-fetch
               #:use-module (guix gexp)              ; setenv phase
               #:use-module (guix packages)
               #:use-module ((guix licenses) #:prefix license:)
               #:use-module (gnu packages gettext)   ; gettext-minimal
               #:use-module (gnu packages glib)      ; glib, python-pygobject
               #:use-module (gnu packages gnome)     ; nautilus
               #:use-module (gnu packages gtk)       ; gtk
               #:use-module (gnu packages pkg-config)
               #:use-module (gnu packages python)    ; python
               #:use-module (gnu packages python-build) ; python-setuptools-scm
               #:export (python-nautilus
                         nautilus-open-any-terminal))

(define %nautilus-python-version "4.1.0")
(define %nautilus-python-commit
  "52fe5a0339065aa5461075c53002b1534b590188") ; master "Release 4.1.0"

(define-public python-nautilus
  (package
    (name "python-nautilus")
    (version %nautilus-python-version)
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.gnome.org/GNOME/nautilus-python.git")
             (commit %nautilus-python-commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wj27hkbgp7l8hda794jxn16vk57lwknf2qv69whbl46p72zlhav"))))
    (build-system meson-build-system)
    (arguments
     (list #:glib-or-gtk? #t))
    (native-inputs (list pkg-config))
    (inputs (list glib python python-pygobject nautilus))
    (home-page "https://gitlab.gnome.org/GNOME/nautilus-python")
    (synopsis "Python bindings for the Nautilus extension API")
    (description
     "Nautilus-Python provides Python bindings to the Nautilus extension
framework, allowing extensions to be written in Python.  It installs a
loader into Nautilus's extension directory; extension scripts placed in
@file{share/nautilus-python/extensions} on @code{XDG_DATA_DIRS} are
loaded at startup.")
    (license license:gpl2+)))

(define %nautilus-open-any-terminal-version "0.8.3")
(define %nautilus-open-any-terminal-commit
  "796ba3aa4aba8344710d98242206f83ebc07dba6") ; tag 0.8.3

(define-public nautilus-open-any-terminal
  (package
    (name "nautilus-open-any-terminal")
    (version %nautilus-open-any-terminal-version)
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Stunkymonkey/nautilus-open-any-terminal.git")
             (commit %nautilus-open-any-terminal-commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1x3vs576wm6hj73z2732ssrm9bimv9wg4n1401pjsdlzka5fwjpj"))))
    (build-system python-build-system)
    (arguments
     (list
      ;; Upstream has no test suite wired into setuptools.
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; setuptools_scm derives the version from git metadata, which
          ;; guix git-fetch does not preserve; pin it explicitly instead.
          (add-after 'unpack 'pin-scm-version
            (lambda _
              (setenv "SETUPTOOLS_SCM_PRETEND_VERSION"
                      #$%nautilus-open-any-terminal-version)))
          ;; The pinned python-build-system does not support the
          ;; glib-or-gtk? flag, so compile the schema shipped by the
          ;; custom install command (share/glib-2.0/schemas) explicitly.
          (add-after 'install 'compile-schemas
            (lambda _
              (invoke "glib-compile-schemas"
                      (string-append #$output
                                     "/share/glib-2.0/schemas")))))))
    (native-inputs (list `(,glib "bin") gettext-minimal
                         python-setuptools-scm))
    (inputs (list python))
    (propagated-inputs (list gtk python-pygobject python-nautilus))
    (home-page "https://github.com/Stunkymonkey/nautilus-open-any-terminal")
    (synopsis "Nautilus extension to open a terminal in the current directory")
    (description
     "Nautilus extension that adds a context-menu entry to open the
configured terminal emulator in the current directory (\"Open
<terminal> Here\").  The terminal is configured through the
@code{com.github.stunkymonkey.nautilus-open-any-terminal} GSettings
schema (@code{terminal}, @code{keybindings}, @code{new-tab}, ...);
arbitrary terminals such as @command{ghostty}, @command{alacritty},
@command{kitty} or @command{foot} are supported.")
    (license license:gpl3+)))
