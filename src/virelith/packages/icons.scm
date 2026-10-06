;;; Icon theme packages for Virelith.

(define-module (virelith packages icons)
               #:use-module (gnu packages python) ;python-minimal
               #:use-module (guix build-system copy)
               #:use-module (guix gexp)
               #:use-module (guix git-download)
               #:use-module (guix packages)
               #:use-module ((guix licenses) #:prefix license:))

;; GTK4 的 symbolic 图标渲染忽略 <g> 上的 transform，只认元素自身的
;; transform。Fluent 主题里大量 Inkscape 风格图标把内容放在一个大
;; translate(-NNN -NN) 的 <g> 下（坐标在 600+），在 GTK4 里因此渲染成
;; 空白（实测如 format-justify-fill-symbolic）。把每个 <g> 的 transform
;; 下推到子元素（组合到子元素自身的 transform 上），语义不变，但 GTK4
;; 能正确渲染。
(define %normalize-svg-transforms
  (plain-file "normalize-svg-transforms.py"
              "\
import os, sys, xml.etree.ElementTree as ET

NS = 'http://www.w3.org/2000/svg'
ET.register_namespace('', NS)


def flatten(elem, inherited=''):
    for child in list(elem):
        own = child.get('transform', '')
        combined = (inherited + ' ' + own).strip()
        if child.tag == '{%s}g' % NS:
            if 'transform' in child.attrib:
                del child.attrib['transform']
            flatten(child, combined)
        elif combined:
            child.set('transform', combined)


def main(root):
    seen = set()
    for dirpath, _dirs, files in os.walk(root, followlinks=True):
        for name in files:
            if not name.endswith('.svg'):
                continue
            path = os.path.join(dirpath, name)
            real = os.path.realpath(path)
            if real in seen:
                continue
            seen.add(real)
            try:
                tree = ET.parse(path)
            except (ET.ParseError, OSError):
                continue
            flatten(tree.getroot())
            tree.write(path, encoding='utf-8', xml_declaration=True)


if __name__ == '__main__':
    main(sys.argv[1])
"))

;; Bump VERSION/COMMIT/SHA256 together when updating the package.
(define %fluent-icon-theme-version "2026.07.27")
(define %fluent-icon-theme-commit
  "c70c2441bcf2ab8bbc267e55635c76d69f659a8b")
(define %fluent-icon-theme-sha256
  (base32 "06gkjzd3jy1an90d1mn07p34wxgm3cn57lspm23wc3lspgjg7lia"))

(define-public fluent-icon-theme
  (package
    (name "fluent-icon-theme")
    (version %fluent-icon-theme-version)
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/vinceliuice/Fluent-icon-theme")
         (commit %fluent-icon-theme-commit)))
       (file-name (git-file-name name version))
       ;; Same upstream checkout as fluent-cursor-theme; keep this hash in
       ;; sync with %fluent-cursor-theme-sha256 in (virelith packages cursors).
       (sha256 %fluent-icon-theme-sha256)
       ;; Icon caches are host/profile specific and should not be embedded
       ;; in this theme package.
       (modules '((guix build utils)))
       (snippet
        '(substitute* "install.sh"
                      (("gtk-update-icon-cache") "true")))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
                       (replace 'install
                                (lambda _
                                  (let ((dest (string-append #$output "/share/icons")))
                                    (mkdir-p dest)
                                    ;; Install every color variant.  The upstream
                                    ;; installer also creates standard/light/dark
                                    ;; variants and the shared base directories
                                    ;; they reference.
                                    (invoke "bash" "install.sh"
                                            "--all"
                                            "--dest" dest))))
                       ;; Normalize Inkscape-style <g transform> so GTK4 renders
                       ;; every symbolic icon (see %normalize-svg-transforms).
                       (add-after 'install 'normalize-svg-transforms
                                  (lambda _
                                    (invoke "python3"
                                            #$%normalize-svg-transforms
                                            (string-append #$output "/share/icons")))))))
    (native-inputs
     (list python-minimal))
    (home-page "https://github.com/vinceliuice/Fluent-icon-theme")
    (synopsis "Fluent Design icon theme")
    (description
     "Fluent is an icon theme for Linux desktops inspired by Microsoft's
Fluent Design.  This package installs all upstream color variants together
with their standard, light, and dark variants.")
    (license license:gpl3+)))
