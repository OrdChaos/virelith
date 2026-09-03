;;; Offline unit tests for (virelith packages nautilus).
;;;
;;; Run:  guix repl -L src tests/nautilus.scm
;;;
;;; Pure record/static assertions: no downloads, no lowering, no build.

(use-modules (srfi srfi-1)              ; member, find
             (srfi srfi-64)
             (guix build-system meson)  ; meson-build-system?
             (guix build-system python) ; python-build-system?
             (guix gexp)                ; gexp->approximate-sexp
             (guix git-download)        ; git-reference-commit
             (guix packages)            ; package-*
             (gnu packages glib)        ; python-pygobject
             (virelith packages nautilus))

;; package inputs 是 (label package) 二元组；name 提取要 cadr。
(define (input-names package)
  (map (compose package-name cadr) (package-inputs package)))
(define (propagated-names package)
  (map (compose package-name cadr) (package-propagated-inputs package)))
(define (native-names package)
  (map (compose package-name cadr) (package-native-inputs package)))

;; keyword 不能跨编译产物用 assoc-ref（keyword 是 eq? 语义、
;; 不同编译单元产出的 keyword 对象不同——已实测）；按名匹配。
(define (arguments-flag package name)
  (let loop ((args (package-arguments package)))
    (and (pair? args)
         (pair? (cdr args))
         (or (and (keyword? (car args))
                  (eq? (keyword->symbol (car args)) name)
                  (cadr args))
             (loop (cddr args))))))

(define (sexp-contains? sexp sym)
  (cond ((eq? sexp sym) #t)
        ((pair? sexp)
         (or (sexp-contains? (car sexp) sym)
             (sexp-contains? (cdr sexp) sym)))
        (else #f)))

(test-begin "nautilus-extensions")

(test-group "python-nautilus"
  (test-equal "package name" "python-nautilus"
    (package-name python-nautilus))
  (test-equal "version 4.1.0" "4.1.0"
    (package-version python-nautilus))
  (test-equal "pinned commit" "52fe5a0339065aa5461075c53002b1534b590188"
    (git-reference-commit (origin-uri (package-source python-nautilus))))
  (test-assert "meson build system"
    (eq? meson-build-system (package-build-system python-nautilus)))
  (test-assert "loads the nautilus extension library and pygobject"
    (let ((names (input-names python-nautilus)))
      (and (member "python-pygobject" names)
           (member "nautilus" names))))
  (test-assert "schema compilation enabled"
    (arguments-flag python-nautilus 'glib-or-gtk?)))

(test-group "nautilus-open-any-terminal"
  (test-equal "package name" "nautilus-open-any-terminal"
    (package-name nautilus-open-any-terminal))
  (test-equal "version 0.8.3" "0.8.3"
    (package-version nautilus-open-any-terminal))
  (test-equal "pinned commit (tag 0.8.3)" "796ba3aa4aba8344710d98242206f83ebc07dba6"
    (git-reference-commit
     (origin-uri (package-source nautilus-open-any-terminal))))
  (test-assert "python build system"
    (eq? python-build-system
        (package-build-system nautilus-open-any-terminal)))
  (test-assert "propagates pygobject, the bindings and gtk (runtime gi/typelib closure)"
    (let ((names (propagated-names nautilus-open-any-terminal)))
      (and (member "python-pygobject" names)
           (member "python-nautilus" names)
           (member "gtk" names))))
  (test-assert "msgfmt present for locale compilation"
    (member "gettext-minimal"
            (native-names nautilus-open-any-terminal)))
  (test-assert "explicit schema compilation phase (python-build-system lacks glib-or-gtk?)"
    (let ((phases (arguments-flag nautilus-open-any-terminal 'phases)))
      (and phases
           (sexp-contains? (gexp->approximate-sexp phases)
                           'compile-schemas)))))

(test-end "nautilus-extensions")
