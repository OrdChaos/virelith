;;; Noctalia Greeter system integration for Virelith.
;;;
;;; The display-manager layer stays with upstream Guix's
;;; greetd-service-type; this module only provides the Noctalia-specific
;;; integration on top of it:
;;;
;;; - greetd-noctalia-session: a greetd session command that gives the
;;;   greeter a deterministic runtime environment.  greetd starts greeter
;;;   sessions with an empty environment, while upstream's session script
;;;   and the greeter's power actions resolve their commands from PATH at
;;;   runtime.
;;; - noctalia-greeter-service-type: exposes the greeter's polkit policy
;;;   for appearance sync, ensures the greeter state directory exists
;;;   with the expected owner/mode, and puts the package on the system
;;;   profile so Noctalia Shell can discover the sync helper.
;;;
;;; Deliberately out of scope: greetd configuration (wire the returned
;;; session command into greetd-terminal-configuration yourself), PAM
;;; (greetd's own PAM service already registers the greeter session with
;;; elogind), greeter.toml generation, sync.toml/wallpaper state, and
;;; machine-specific persistence policy.

(define-module (virelith services noctalia-greeter)
               #:use-module (gnu packages base)          ; coreutils
               #:use-module (gnu packages freedesktop)   ; elogind (loginctl)
               #:use-module (gnu packages glib)          ; dbus (dbus-run-session)
               #:use-module (gnu services)
               #:use-module (gnu services dbus)          ; polkit-service-type
               #:use-module (guix gexp)
               #:use-module (guix records)
               #:use-module (ice-9 match)
               #:use-module (virelith packages noctalia-greeter)
               #:export (noctalia-greeter-configuration
                         noctalia-greeter-configuration?
                         make-noctalia-greeter-configuration
                         noctalia-greeter-configuration-package
                         noctalia-greeter-configuration-user
                         noctalia-greeter-configuration-state-directory
                         noctalia-greeter-service-type
                         greetd-noctalia-session))

(define-record-type* <noctalia-greeter-configuration>
  noctalia-greeter-configuration make-noctalia-greeter-configuration
  noctalia-greeter-configuration?
  (package noctalia-greeter-configuration-package
           (default noctalia-greeter))
  (user noctalia-greeter-configuration-user
        (default "greeter"))
  (state-directory noctalia-greeter-configuration-state-directory
                   (default "/var/lib/noctalia-greeter")))

(define* (greetd-noctalia-session #:key
                                  (package noctalia-greeter)
                                  (extra-environment '())
                                  (extra-xdg-data-dirs '()))
  "Return a file-like greetd session command that runs PACKAGE's
@command{noctalia-greeter-session} with a deterministic runtime
environment.

greetd starts greeter sessions with an empty environment, but upstream's
session script resolves its POSIX utilities and @command{dbus-run-session}
from PATH at runtime, and the greeter's power actions use
@command{loginctl}.  The wrapper therefore sets PATH to coreutils, dbus
and elogind and XDG_DATA_DIRS to the system profile (extended with
EXTRA-XDG-DATA-DIRS, a list of paths) so Wayland session entries and
fonts are discovered.  EXTRA-ENVIRONMENT is an alist of
(@var{name} . @var{value}) pairs applied last, so it can override the
defaults.

The wrapper execs the real script with its full store path as argv0:
upstream locates the greeter and compositor relative to @code{$0}, so the
script must not see the wrapper's name."
  (program-file
   "noctalia-greeter-session-wrapper"
   #~(begin
       (use-modules (ice-9 match))
       ;; Deterministic runtime PATH.  The session script needs coreutils
       ;; (date id mkdir chmod touch env dirname pwd) and dbus
       ;; (dbus-run-session); power actions prefer loginctl over the FHS
       ;; fallbacks Guix does not provide.
       (setenv "PATH"
               (string-append #$coreutils "/bin:"
                              #$dbus "/bin:"
                              #$elogind "/bin"))
       ;; Session .desktop discovery appends "/wayland-sessions" to every
       ;; XDG_DATA_DIRS entry; the system profile is the Guix location for
       ;; them.  fontconfig in Guix also honors XDG_DATA_DIRS for fonts.
       (setenv "XDG_DATA_DIRS"
               (string-join
                (append (list "/run/current-system/profile/share"
                              #$@extra-xdg-data-dirs)
                        (match (getenv "XDG_DATA_DIRS")
                          ((? string? current)
                           (if (string-null? current) '() (list current)))
                          (_ '())))
                ":"))
       ;; Optional caller overrides (e.g. XCURSOR_*, XKB_DEFAULT_*).
       (for-each (match-lambda ((name . value) (setenv name value)))
                 (quote (#$@extra-environment)))
       ;; argv0 stays the real script path: upstream resolves the greeter
       ;; and compositor relative to its own directory ($0).
       (apply execl #$(file-append package "/bin/noctalia-greeter-session")
              #$(file-append package "/bin/noctalia-greeter-session")
              (cdr (command-line))))))

(define (noctalia-greeter-activation config)
  "Return an activation program that ensures the state directory of CONFIG
exists, is owned by the configured user and has mode 0750.

The activation is idempotent and fail-closed: it never removes the
directory or its contents (@file{sync.toml}, synced wallpapers, mutable
state), and it also works when the directory is backed by a persistence
bind mount; it errors when the path is a non-directory or the configured
user does not exist."
  (program-file
   "noctalia-greeter-activation"
   #~(begin
       (use-modules (ice-9 match))
       (match (command-line)
         ((_ directory user)
          (let ((pw (getpwnam user)))
            (unless pw
              (error "noctalia-greeter: no such user" user))
            (cond
             ((not (file-exists? directory))
              (mkdir directory #o750))
             ((not (file-is-directory? directory))
              (error "noctalia-greeter: state path is not a directory"
                     directory)))
            ;; Ownership/mode repair only; contents are left untouched.
            (chown directory (passwd:uid pw) (passwd:gid pw))
            (chmod directory #o750)))
         (_
          (error "noctalia-greeter-activation: expected DIRECTORY USER"))))))

(define (noctalia-greeter-polkit config)
  ;; polkit-service-type unions extension packages' share/polkit-1 into
  ;; /etc/polkit-1; the policy's exec.path already points at the greeter's
  ;; store path, so nothing is copied or rewritten.
  (list (noctalia-greeter-configuration-package config)))

(define (noctalia-greeter-profile config)
  ;; Noctalia Shell resolves noctalia-greeter-apply-appearance and the
  ;; noctalia-greeter binary from the session PATH before falling back to
  ;; FHS paths that do not exist on Guix; the system profile makes the
  ;; appearance sync chain discoverable.
  (list (noctalia-greeter-configuration-package config)))

(define (noctalia-greeter-activation-service config)
  #~(begin
      (let ((status (system*
                     #$(noctalia-greeter-activation config)
                     #$(noctalia-greeter-configuration-state-directory config)
                     #$(noctalia-greeter-configuration-user config))))
        (unless (zero? status)
          (error "noctalia-greeter: state directory activation failed")))))

(define noctalia-greeter-service-type
  (service-type
   (name 'noctalia-greeter)
   (description
    "Noctalia-specific integration for @code{noctalia-greeter}: expose its
polkit policy for appearance sync, ensure the greeter state directory
exists with the expected owner and mode, and put the package on the system
profile for Noctalia Shell discovery.  The greetd layer itself and its PAM
stack remain the responsibility of @code{greetd-service-type}.")
   (extensions
    (list (service-extension polkit-service-type
                             noctalia-greeter-polkit)
          (service-extension profile-service-type
                             noctalia-greeter-profile)
          (service-extension activation-service-type
                             noctalia-greeter-activation-service)))
   (default-value (noctalia-greeter-configuration))))
