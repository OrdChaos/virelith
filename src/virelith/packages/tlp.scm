;;; TLP with the profiles daemon (tlp-pd) for Virelith.

;; GNU Guix's tlp package runs "make install-tlp install-man-tlp" only,
;; so the profiles daemon that ships in the same TLP 1.9 source is not
;; produced: tlp-pd, tlpctl, tlp-pd.policy and the D-Bus system policy
;; files are left out.  tlp-pd implements the
;; org.freedesktop.UPower.PowerProfiles interface (plus the legacy
;; net.hadess.PowerProfiles one) that desktop shells use for the
;; power-profile switch, with TLP itself as the backend: the three
;; profiles are applied by running "tlp <profile>" and map to TLP's
;; _ON_AC / _ON_BAT / _ON_SAV settings.

;; tlp-pd is a Python program (dbus-python + PyGObject).  Its shebang is
;; rewritten to the Guix python, and it is wrapped with the build-time
;; GUIX_PYTHONPATH and GI_TYPELIB_PATH so the dbus/gi modules and the
;; GLib typelib are found at run time.  The wrapper also prepends the
;; package's own sbin to PATH because tlp-pd applies profiles by
;; invoking the "tlp" executable.

;; Unlike GNU Guix's tlp package, this variant installs after the
;; inherited 'wrap phase: the generic wrapper only scans bin/ and sbin/
;; for the files that already exist at that point, so tlp-pd/tlpctl are
;; wrapped explicitly here instead.

(define-module (virelith packages tlp)
  #:use-module (gnu packages glib)           ;python-pygobject
  #:use-module (gnu packages linux)          ;tlp
  #:use-module (gnu packages python)         ;python
  #:use-module (gnu packages python-xyz)     ;python-dbus
  #:use-module (guix gexp)                   ;#~
  #:use-module (guix packages)               ;inherit、modify-inputs、package-arguments
  #:use-module (guix utils)                  ;substitute-keyword-arguments
  #:export (tlp-with-pd))

(define-public tlp-with-pd
  (package
    (inherit tlp)
    (name "tlp-with-pd")
    (synopsis "Power management tool with the TLP profiles daemon")
    (arguments
     (substitute-keyword-arguments (package-arguments tlp)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'wrap 'install-tlp-pd
              (lambda* (#:key inputs outputs #:allow-other-keys)
                (invoke "make" "install-pd" "install-man-pd")
                (let* ((out (assoc-ref outputs "out"))
                       (python (assoc-ref inputs "python"))
                       (tlp-pd (string-append out "/sbin/tlp-pd"))
                       (tlpctl (string-append out "/bin/tlpctl")))
                  ;; Upstream ships /usr/bin/python3 shebangs.
                  (substitute* (list tlp-pd tlpctl)
                    (("^#!.*python3")
                     (string-append "#!" python "/bin/python3")))
                  (for-each
                   (lambda (program)
                     (wrap-program program
                       ;; tlp-pd applies a profile by running "tlp".
                       `("PATH" ":" prefix (,(string-append out "/sbin")))
                       `("GUIX_PYTHONPATH" ":" prefix
                         (,(or (getenv "GUIX_PYTHONPATH") "")))
                       `("GI_TYPELIB_PATH" ":" prefix
                         (,(or (getenv "GI_TYPELIB_PATH") "")))))
                   (list tlp-pd tlpctl)))))))))
    (inputs
     (modify-inputs (package-inputs tlp)
       (append python python-dbus python-pygobject)))))
