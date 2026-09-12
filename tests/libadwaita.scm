;;; Offline unit tests for (virelith packages libadwaita).
;;;
;;; Run:  guix repl -L src tests/libadwaita.scm

(use-modules (srfi srfi-1)
             (srfi srfi-64)
             (guix build-system meson)
             (guix gexp)
             (guix packages)
             (virelith packages libadwaita))

(define (input-names package)
  (map (compose package-name cadr) (package-inputs package)))
(define (propagated-names package)
  (map (compose package-name cadr) (package-propagated-inputs package)))
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

(test-begin "libadwaita")

(test-group "libadwaita-1.9"
  (test-equal "package name" "libadwaita"
    (package-name libadwaita-1.9))
  (test-equal "version 1.9.3" "1.9.3"
    (package-version libadwaita-1.9))
  (test-assert "meson build system"
    (eq? meson-build-system (package-build-system libadwaita-1.9)))
  (test-assert "disables introspection/vapi/docs (Rust FFI does not need them)"
    (let ((flags (arguments-flag libadwaita-1.9 'configure-flags)))
      (and flags
           (let ((sexp (gexp->approximate-sexp flags)))
             (and (sexp-contains? sexp "-Dintrospection=disabled")
                  (sexp-contains? sexp "-Dvapi=false"))))))
  (test-assert "propagates gtk and appstream (libadwaita-1.pc Requires)"
    (let ((names (propagated-names libadwaita-1.9)))
      (and (member "gtk" names)
           (member "appstream" names))))
  (test-assert "links fribidi"
    (member "fribidi" (input-names libadwaita-1.9))))

(test-end "libadwaita")
