;;; Tests for Virelith Fcitx 5 packages.

(use-modules (srfi srfi-64)
             (gnu packages fcitx5)
             (guix packages)
             (virelith packages fcitx5)
             (virelith packages rime))

(define (package-input package label)
  (let ((entry (assoc label (package-inputs package))))
    (and entry (cadr entry))))

(test-runner-current (test-runner-simple))
(test-begin "fcitx5")

;; The addon must stay loadable by the Guix core: 5.1.15+ needs core 5.1.22
;; and an addon built against that core fails to load in a 5.1.21 daemon.
(test-equal "fcitx5-rime stays on the core-compatible release" "5.1.14"
  (package-version fcitx5-rime-virelith))

(test-equal "addon links the inherited Fcitx core"
  fcitx5
  (package-input fcitx5-rime-virelith "fcitx5"))

(test-equal "Virelith Rime data remains wired" "rime-data-virelith"
  (package-name (package-input fcitx5-rime-virelith "rime-data")))

(test-equal "Rime Ice snapshot" "2026.11.11"
  (package-version rime-ice))

(test-equal "Wanxiang snapshot" "20261114234332"
  (package-version rime-data-wanxiang))

(test-end "fcitx5")
