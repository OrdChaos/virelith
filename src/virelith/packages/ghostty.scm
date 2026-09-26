;;; Ghostty for Virelith.
;;;
;;; Ghostty's upstream Zig dependencies are locked separately in
;;; (virelith packages ghostty-dependencies), mirroring the generated Cargo
;;; source file used by the channel's Rust packages.

(define-module (virelith packages ghostty)
  #:use-module (virelith packages ghostty-dependencies)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages image)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages zig)
  #:use-module (guix build utils)
  #:use-module (guix build-system zig)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((guix packages) #:hide (replace))
  #:export (ghostty))

(define-public ghostty
  (package
    (name "ghostty")
    (version "1.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ghostty-org/ghostty")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0d064l17drqcf6bc27jmjxak0n2xqp2mpalakwp3j9mx8yclrmzr"))))
    (build-system zig-build-system)
    (arguments
     (list
      #:tests? #f
      #:zig zig-0.15
      #:install-source? #f
      #:zig-release-type "fast"
      #:zig-build-flags
      #~(list "-Dcpu=baseline"
              "-Drenderer=opengl"
              "--system"
              (string-append (getenv "TMPDIR") "/source/zig-cache")
              "--search-prefix" #$(this-package-input "libadwaita")
              "--search-prefix" #$(this-package-input "gtk4-layer-shell")
              "--search-prefix"
              (string-append (getenv "TMPDIR") "/source/bzip2")
              "-fno-sys=oniguruma")
      #:modules
      '((guix build zig-build-system)
        (guix build utils)
        (ice-9 match))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack-dependencies
            (lambda _
              (mkdir-p "bzip2/lib")
              (symlink (string-append #$(this-package-input "bzip2")
                                      "/lib/libbz2.so")
                       "bzip2/lib/libbzip2.so")))
          (add-after 'unpack 'fix-freedesktop-exec-paths
            (lambda _
              ;; Ghostty templates substitute this while Zig's install prefix
              ;; is still relative; install the final absolute store path.
              (for-each (lambda (file)
                          (substitute* file
                            (("@GHOSTTY@")
                             (string-append #$output "/bin/ghostty"))))
                        (find-files "dist/linux" "\\.in$"))))
          (add-after 'unpack 'unpack-zig-dependencies
            (lambda* (#:key inputs #:allow-other-keys)
              (for-each
               (match-lambda
                 ((destination . source)
                  (let ((directory (string-append "zig-cache/" destination)))
                    (mkdir-p directory)
                    (cond
                     ((or (string-contains source ".tar.gz")
                          (string-contains source ".tgz")
                          (string-contains source ".tar.xz")
                          (string-contains source ".tar.zst"))
                      (invoke "tar" "-xf" source "-C" directory
                              "--strip-components=1"))
                     (else (copy-recursively source directory))))))
               (map (lambda (dependency)
                      (cons (car dependency)
                            (assoc-ref inputs (cdr dependency))))
                    '#$(map (lambda (dependency)
                              (cons (car dependency)
                                    (origin-file-name (cdr dependency))))
                            ghostty-zig-dependencies)))))))
      )
    (native-inputs
     (list `(,glib "bin")
           blueprint-compiler
           gnu-gettext
           gobject-introspection
           ncurses
           pandoc
           pkg-config
           tar))
    (inputs
     (append (map cdr ghostty-zig-dependencies)
             (list bzip2 expat fontconfig freetype glslang gtk4-layer-shell
                   harfbuzz libadwaita libglvnd libpng libx11 libxcursor libxi
                   libxrandr zlib)))
    (native-search-paths
     (list (search-path-specification
            (variable "TERMINFO_DIRS")
            (files '("share/terminfo")))))
    (synopsis "Fast, native, feature-rich terminal emulator")
    (description
     "Ghostty is a fast, native terminal emulator with modern features and
platform-native user interfaces.")
    (home-page "https://ghostty.org")
    (license license:expat)))
