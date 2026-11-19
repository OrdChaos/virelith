;;; Niri with virtual-output support.
;;;
;;; Upstream PR #3800 (willybarret, commit 7fd585dd) adds virtual
;;; (HEADLESS-*) outputs: creation/removal via IPC and config.kdl's
;;; `create-virtual', plus a real headless backend.  The PR is based on
;;; niri main at 2026-09-18; we carry it as a patch on top of the
;;; version packaged by Guix (26.04) so the rest of the package
;;; (Cargo inputs, build phases, native deps) is inherited unchanged.
;;;
;;; Porting notes (26.04 vs the PR base): three conflicts were resolved
;;; by hand:
;;;   - src/backend/headless.rs: took the PR's rewritten backend;
;;;   - src/backend/mod.rs: 26.04's winit backend has no gbm_device(),
;;;     so primary_gbm_device() keeps `None' for Winit and delegates to
;;;     the PR's Headless::gbm_device();
;;;   - src/tests/mod.rs: keep 26.04's module list and add
;;;     `mod virtual_output' (26.04 has no virtual_pointer test).
;;;
;;; The binary name, IPC, wayland-session entry and config format are
;;; inherited unchanged; the package only differs by the patch.

(define-module (virelith packages niri)
  #:use-module ((gnu packages) #:select (search-patches))
  #:use-module (gnu packages window-management) ;niri
  #:use-module (guix packages) ;package、inherit
  #:export (niri-virtual-output))

(define %niri-virtual-output-patch
  (car (search-patches
        "virelith/packages/patches/niri-virtual-output.patch")))

(define-public niri-virtual-output
  (package
    (inherit niri)
    (name "niri-virtual-output")
    (source (origin
              (inherit (package-source niri))
              (patches (list %niri-virtual-output-patch))))))
