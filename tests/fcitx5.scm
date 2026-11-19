;;; Tests for Virelith Fcitx 5 packages.

(use-modules (srfi srfi-64)
             (guix git-download)
             (guix packages)
             (virelith packages fcitx5)
             (virelith packages rime))

(define (package-input package label)
  (let ((entry (assoc label (package-inputs package))))
    (and entry (cadr entry))))

(test-runner-current (test-runner-simple))
(test-begin "fcitx5")

(test-equal "fcitx5-rime version" "5.1.16"
  (package-version fcitx5-rime-virelith))

(test-equal "fcitx5-rime release commit"
  "ce38ca9daba13209b3d36303c3c5ca6d086e8612"
  (git-reference-commit
   (origin-uri (package-source fcitx5-rime-virelith))))

(test-equal "compatible Fcitx core version" "5.1.22"
  (package-version (package-input fcitx5-rime-virelith "fcitx5")))

(test-equal "Virelith Rime data remains wired" "rime-data-virelith"
  (package-name (package-input fcitx5-rime-virelith "rime-data")))

(test-equal "Rime Ice snapshot" "2026.11.11"
  (package-version rime-ice))

(test-equal "Wanxiang snapshot" "20261114234332"
  (package-version rime-data-wanxiang))

(test-end "fcitx5")
