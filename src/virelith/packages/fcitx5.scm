;;; Fcitx 5 packages for Virelith.

(define-module (virelith packages fcitx5)
               #:use-module (gnu packages fcitx5)
               #:use-module (guix build-system copy)
               #:use-module (guix git-download)
               #:use-module (guix gexp)
               #:use-module ((guix licenses) #:prefix license:)
               #:use-module (guix packages)
               #:use-module (virelith packages rime))

(define-public fcitx5-rime-virelith
  (package
   (inherit fcitx5-rime)
   (name "fcitx5-rime-virelith")
   ;; Preserve the original input labels.  fcitx5-rime's configure flags look
   ;; up the input named "rime-data" to set RIME_DATA_DIR.
   (inputs
    (modify-inputs (package-inputs fcitx5-rime)
                   (replace "librime" librime-virelith)
                   (replace "rime-data" rime-data-virelith)))
   (synopsis "Rime input method for Fcitx 5 with Virelith data and plugins")
   (description
    "This variant of fcitx5-rime uses Virelith's merged-plugin librime and its
immutable Rime Ice plus Wanxiang shared-data tree.")))

;; This is the same upstream revision as the user's Arch package
;; fcitx5-skin-fluentlight-git v0.4.0.r7.g399699a.  The source hash comes from
;; the existing Guix patch for the same upstream commit.
(define-public fcitx5-fluentlight-theme
  (let ((commit "399699ac7d366ed6c1952646ed71647e3c8f99b5")
        (revision "7"))
    (package
     (name "fcitx5-fluentlight-theme")
     (version (git-version "0.4.0" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Reverier-Xu/Fluent-fcitx5")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "188gsggh78gjf2kg9kxds819hxidc2yf5aivwbbqayw7cb2h5ijr"))))
     (build-system copy-build-system)
     (arguments
      (list
       #:install-plan
       #~'(("FluentLight-solid" "share/fcitx5/themes/")
           ("FluentLight" "share/fcitx5/themes/"))))
     (home-page "https://github.com/Reverier-Xu/Fluent-fcitx5")
     (synopsis "Fluent light themes for Fcitx 5")
     (description
      "This package provides the FluentLight and FluentLight-solid themes for
Fcitx 5.  The solid variant is useful on compositors without KWin's blur
effect.")
     (license license:mpl2.0))))
