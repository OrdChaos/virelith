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
             (virelith packages dsh-profiles))

(define %dummy-hash
  (base32 "07xq1p7mhyyrmya1b4rqrjn7i2szmrs653493lgvp1rs33qlzfd2"))

(define %plugin
  (dsh-npm-bundle "@example/foo" "1.2.3" %dummy-hash))

(define %profile
  (dsh-profile "unit-test"
               #:bundles (list "@deepseek-ai/dsh-base"
                               %plugin)
               #:lockfile (plain-file "pnpm-lock.yaml" "lockfileVersion: '9.0'\n")
               #:patch (plain-file "cordis.patch.yml" "[]\n")
               #:node-modules-hash %dummy-hash))

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

(test-end "dsh-profiles")
