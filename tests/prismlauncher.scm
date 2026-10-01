;;; Offline unit tests for (virelith packages prismlauncher).
;;;
;;; Run:  guix time-machine -C channels.lock.scm -- \
;;;         repl -L src tests/prismlauncher.scm
;;;
;;; Pure record/static assertions: no downloads, no lowering, no build.

(use-modules (srfi srfi-1)
             (srfi srfi-64)
             (guix build-system cmake)
             (guix gexp)
             (guix git-download)
             (guix licenses)
             (guix packages)
             (guix search-paths)
             (virelith packages prismlauncher))

(define (input-names package)
  (map (compose package-name cadr) (package-inputs package)))
(define (native-names package)
  (map (compose package-name cadr) (package-native-inputs package)))
(define (arguments-flag package name)
  (let loop ((args (package-arguments package)))
    (and (pair? args)
         (pair? (cdr args))
         (or (and (keyword? (car args))
                  (eq? (keyword->symbol (car args)) name)
                  (cadr args))
             (loop (cddr args))))))
(define (sexp-contains? sexp obj)
  (cond ((equal? sexp obj) #t)
        ((pair? sexp)
         (or (sexp-contains? (car sexp) obj)
             (sexp-contains? (cdr sexp) obj)))
        (else #f)))

(test-begin "prismlauncher")

(test-equal "package name" "prismlauncher"
  (package-name prismlauncher))
(test-equal "version 11.1.1" "11.1.1"
  (package-version prismlauncher))
(test-equal "pinned release tag"
  "11.1.1"
  (git-reference-commit (origin-uri (package-source prismlauncher))))
(test-assert "fetches the libnbtplusplus submodule"
  (git-reference-recursive? (origin-uri (package-source prismlauncher))))
(test-assert "cmake build system"
  (eq? cmake-build-system (package-build-system prismlauncher)))

(test-assert "the Java runtime downloader is disabled"
  (let ((flags (arguments-flag prismlauncher 'configure-flags)))
    (and flags
         (sexp-contains?
          (gexp->approximate-sexp flags)
          "-DLauncher_ENABLE_JAVA_DOWNLOADER=OFF"))))

(test-assert "source and runtime adjustments are present"
  (let ((sexp (gexp->approximate-sexp
               (arguments-flag prismlauncher 'phases))))
    (and (sexp-contains? sexp 'disable-werror)
         (sexp-contains? sexp 'lower-java-target)
         (sexp-contains? sexp 'wrap-runtime-paths)
         (sexp-contains? sexp "-target 8 -source 8"))))

(test-assert "no Java runtime is bundled"
  (let ((names (append (input-names prismlauncher)
                       (map (compose package-name cadr)
                            (package-propagated-inputs prismlauncher)))))
    (not (any (lambda (name)
                (member name '("openjdk" "icedtea")))
              names))))

(test-assert "a build-time JDK compiles the bundled jars"
  (member "openjdk" (native-names prismlauncher)))

(test-assert "Java is discovered through PRISMLAUNCHER_JAVA_PATHS"
  (let ((spec (find (lambda (spec)
                      (string=? "PRISMLAUNCHER_JAVA_PATHS"
                                (search-path-specification-variable spec)))
                    (package-search-paths prismlauncher))))
    (and spec
         (eq? 'regular (search-path-specification-file-type spec))
         (member "bin/java" (search-path-specification-files spec)))))

(test-assert "wrapper carries the runtime helper inputs"
  (let ((names (input-names prismlauncher)))
    (and (member "bash-minimal" names)
         (member "xrandr" names)
         (member "pciutils" names)
         (member "qtwayland" names)
         (member "qtsvg" names)
         (member "pulseaudio" names)
         (member "mesa" names)
         (member "sed" names))))

(test-assert "does not depend on QuaZip (MMCZip uses libarchive)"
  (not (member "quazip" (input-names prismlauncher))))

(test-assert "declares the nonfree Batch icon set"
  (any (lambda (license)
         (string=? "Nonfree" (license-name license)))
       (package-license prismlauncher)))

(test-end "prismlauncher")
