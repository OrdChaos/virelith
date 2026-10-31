;;; Offline unit tests for (virelith packages dsh-bundles).
;;;
;;; Run:  guix repl -L src tests/dsh-bundles.scm
;;;
;;; Static assertions only: no downloads, no lowering, no build.

(use-modules (srfi srfi-64)
             (guix build-system)
             ((guix licenses) #:prefix license:)
             (guix packages)
             (virelith packages dsh-bundles))

(define %dummy-hash
  (base32 "07xq1p7mhyyrmya1b4rqrjn7i2szmrs653493lgvp1rs33qlzfd2"))

(define %foo
  (dsh-npm-bundle "@example/foo" "1.2.3" %dummy-hash
                  #:license license:expat))

(define %bar
  (dsh-npm-bundle "@example/bar" "2.0.0" %dummy-hash
                  #:license license:expat))

(test-runner-current (test-runner-simple))

(test-begin "dsh-bundles")

(test-assert "descriptor package shape"
  (and (package? %foo)
       (string=? "dsh-bundle--example-foo" (package-name %foo))
       (string=? "1.2.3" (package-version %foo))
       (eq? 'copy (build-system-name (package-build-system %foo)))
       (string=? "Expat" (license:license-name (package-license %foo)))))

(test-assert "descriptor records bundle identity"
  (and (dsh-bundle-package? %foo)
       (string=? "@example/foo" (dsh-bundle-package-name %foo))
       (string=? "1.2.3" (dsh-bundle-package-version %foo))
       (not (dsh-bundle-package? (package-source %foo)))))

(test-assert "descriptor source is the immutable npm tarball"
  (let ((uri (origin-uri (package-source %foo))))
    (and (string=? uri
                   "https://registry.npmjs.org/@example/foo/-/foo-1.2.3.tgz")
         (string=? "foo-1.2.3.tgz"
                   (origin-file-name (package-source %foo))))))

(test-assert "descriptor supports linux x86-64 and aarch64"
  (equal? '("x86_64-linux" "aarch64-linux")
          (package-supported-systems %foo)))

(test-assert "validate-dsh-bundle-set preserves declaration order"
  (equal? (list %bar %foo)
          (validate-dsh-bundle-set (list %bar %foo))))

(test-assert "duplicate bundle names fail closed"
  (catch #t
    (lambda ()
      (validate-dsh-bundle-set (list %foo %foo))
      #f)
    (lambda args #t)))

(test-assert "non-descriptor inputs fail closed"
  (catch #t
    (lambda ()
      (validate-dsh-bundle-set (list %foo #f))
      #f)
    (lambda args #t)))

(test-end "dsh-bundles")
