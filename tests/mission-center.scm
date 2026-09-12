;;; Offline unit tests for (virelith packages mission-center).
;;;
;;; Run:  guix repl -L src tests/mission-center.scm
;;;
;;; Pure record/static assertions: no downloads, no lowering, no build.

(use-modules (srfi srfi-1)
             (srfi srfi-64)
             (guix build-system meson)
             (guix gexp)
             (guix git-download)
             (guix packages)
             (virelith packages mission-center))

;; Inputs are already labelled; crate origins carry their file name, so use
;; the labels rather than calling package-name (which rejects origins).
(define (input-names package)
  (map car (package-inputs package)))
(define (native-names package)
  (map car (package-native-inputs package)))
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

;; Crate origins are labelled with their downloaded file name.
(define (crate-inputs package)
  (filter (lambda (input)
            (let ((label (car input)))
              (and (string? label)
                   (or (string-suffix? ".tar.gz" label)
                       (string-suffix? "-checkout" label)))))
          (package-inputs package)))

(test-begin "mission-center")

(test-group "mission-center"
  (test-equal "package name" "mission-center"
    (package-name mission-center))
  (test-equal "version 1.2.0" "1.2.0"
    (package-version mission-center))
  (test-equal "pinned commit (tag v1.2.0)"
    "193e3729367035cf184da004c3246efe79d5c53e"
    (git-reference-commit (origin-uri (package-source mission-center))))
  (test-assert "fetches submodules recursively"
    (git-reference-recursive? (origin-uri (package-source mission-center))))
  (test-assert "meson build system"
    (eq? meson-build-system (package-build-system mission-center)))
  (test-assert "glib-or-gtk wrapping enabled"
    (arguments-flag mission-center 'glib-or-gtk?))
  (test-assert "all offline build phases present"
    (let ((sexp (gexp->approximate-sexp
                 (arguments-flag mission-center 'phases))))
      (and (sexp-contains? sexp 'prepare-sources)
           (sexp-contains? sexp 'unpack-cargo-vendor)
           (sexp-contains? sexp 'setup-cargo-home)
           (sexp-contains? sexp 'wrap-runtime-paths))))
  (test-assert "vendors the full Cargo closure offline"
    (>= (length (crate-inputs mission-center)) 400))
  (test-assert "consumes nvtop's source output instead of downloading it"
    (let ((entry (assoc "nvtop" (package-inputs mission-center))))
      (and entry (member "source" entry))))
  (test-assert "depends on the local libadwaita 1.9"
    (member "libadwaita" (input-names mission-center)))
  (test-assert "wraps GPU loader and DRM libraries"
    (let ((names (input-names mission-center)))
      (and (member "mesa" names)
           (member "libglvnd" names)
           (member "libdrm" names)
           (member "vulkan-loader" names)
           (member "eudev" names))))
  (test-assert "build toolchain present"
    (let ((names (native-names mission-center)))
      (and (member "rust" names)
           (member "protobuf" names)
           (member "cmake-minimal" names)
           (member "blueprint-compiler" names)
           (member "libxml2" names)
           (member "ninja" names)))))

(test-end "mission-center")
