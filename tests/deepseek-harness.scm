;;; Offline unit tests for (virelith packages deepseek-harness).
;;;
;;; Run:  guix repl -L src tests/deepseek-harness.scm
;;;
;;; Pure record/static assertions: no downloads, no lowering, no build.

(use-modules (ice-9 match)
             (srfi srfi-64)
             (guix build-system)
             ((guix licenses) #:prefix license:)
             (guix packages)
             (virelith packages deepseek-harness)
             (virelith packages pnpm-deps))

(define (input-name input)
  (match input
    ((name (? package? package)) (package-name package))
    ((name (? origin? origin)) (origin-file-name origin))
    (_ #f)))

(define (native-input-names package)
  (map input-name (package-native-inputs package)))

(test-runner-current (test-runner-simple))

(test-begin "deepseek-harness")

(test-assert "deepseek-harness: package shape"
  (and (package? deepseek-harness)
       (string=? "deepseek-harness" (package-name deepseek-harness))
       (string=? "0.2.1-rc.5" (package-version deepseek-harness))
       (eq? 'gnu (build-system-name (package-build-system deepseek-harness)))
       (string=? "https://github.com/deepseek-ai/deepseek-harness"
                 (package-home-page deepseek-harness))
       (string=? "Expat"
                 (license:license-name (package-license deepseek-harness)))))

(test-equal "deepseek-harness: linux x86-64 only"
  '("x86_64-linux")
  (package-supported-systems deepseek-harness))

(test-assert "deepseek-harness: pinned codeload source"
  (let ((uri (origin-uri (package-source deepseek-harness))))
    (and (string? uri)
         (string-contains uri
                          "codeload.github.com/deepseek-ai/deepseek-harness")
         (string-contains uri "dsh-v0.2.1-rc.5"))))

(test-assert "deepseek-harness: fixed pnpm workspace tree input"
  (let ((names (native-input-names deepseek-harness)))
    (and (member "node" names)
         (member "pnpm" names)
         (member "pnpm-node-modules" names)
         (member "gcc" names)
         (member "python-minimal" names))))

(test-assert "deepseek-harness: wrapper uses expose-internals"
  (let ((args (object->string (package-arguments deepseek-harness))))
    (and (string-contains args "--expose-internals")
         (string-contains args "apps/cli/lib/bin.js")
         (string-contains args "libexec/deepseek-harness"))))

(test-equal "deepseek-harness: stable pnpm build root"
  "/tmp/guix-dsh-build"
  %pnpm-build-root)

(test-end "deepseek-harness")
