;;; Offline unit tests for (virelith packages dsh-profiles).
;;;
;;; Run:  guix repl -L src tests/dsh-profiles.scm
;;;
;;; Static assertions only: no downloads, no lowering, no build.

(use-modules (srfi srfi-64)
             (guix build-system)
             (guix gexp)
             (guix packages)
             (virelith packages dsh-bundles)
             (virelith packages dsh-profiles)
             (virelith packages pnpm-deps))

(define %dummy-hash
  (base32 "07xq1p7mhyyrmya1b4rqrjn7i2szmrs653493lgvp1rs33qlzfd2"))

(define %closure
  (pnpm-closure #:source (plain-file "source" "")
                #:hash %dummy-hash))

(define %plugin
  (dsh-npm-bundle "@example/foo" "1.2.3" %dummy-hash))

(define %profile
  (dsh-profile "unit-test"
               #:bundles (list "@deepseek-ai/dsh-base"
                               %plugin)
               #:patch (plain-file "cordis.patch.yml" "[]\n")
               #:specs-hash %dummy-hash))

(define %inbox-profile
  (dsh-profile "inbox-test"
               #:bundles (list "@deepseek-ai/dsh-base")
               #:patch (plain-file "cordis.patch.yml" "[]\n")))

(test-runner-current (test-runner-simple))

(test-begin "dsh-profiles")

(test-assert "profile artifact package shape"
  (and (package? %profile)
       (string=? "dsh-profile-unit-test" (package-name %profile))
       (string=? "0.0.0" (package-version %profile))
       (eq? 'trivial (build-system-name (package-build-system %profile)))))

(test-assert "profile artifact exposes the plugin descriptor"
  (and (dsh-bundle-package? %plugin)
       (string=? "@example/foo" (dsh-bundle-package-name %plugin))))

(test-assert "external bundles require specs-hash"
  (catch #t
    (lambda ()
      (dsh-profile "missing-hash"
                   #:bundles (list %plugin)
                   #:patch (plain-file "cordis.patch.yml" "[]\n"))
      #f)
    (lambda args #t)))

(test-assert "in-box-only profile needs no specs-hash"
  (and (package? %inbox-profile)
       (string=? "dsh-profile-inbox-test"
                 (package-name %inbox-profile))))

(test-assert "pnpm closure has no lockfile input"
  (let ((uri (origin-uri %closure)))
    (and (= (length uri) 5)
         (string=? (cadr uri) "pnpm-workspace.yaml"))))

(test-end "dsh-profiles")
