;;; Hardware monitoring packages for Virelith.
;;;
;;; nvtop does not expose a library: Mission Center embeds selected nvtop
;;; sources in its Magpie backend.  Keep a source output so both packages use
;;; the same pinned and authenticated tree without downloading during builds.

(define-module (virelith packages monitoring)
  #:use-module (gnu packages check)       ; googletest
  #:use-module (gnu packages linux)       ; eudev
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xdisorg)     ; libdrm
  #:use-module (guix build-system cmake)
  #:use-module (guix gexp)                ; output:source in the phase
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (nvtop))

(define %nvtop-commit
  "3d4a953da02bc18886734613bb9f60ff80669de7")

(define-public nvtop
  (package
    (name "nvtop")
    ;; Mission Center 1.2.0 embeds this post-3.3.2 revision.
    (version (git-version "3.3.2" "34" %nvtop-commit))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Syllo/nvtop")
             (commit %nvtop-commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gc6dlhr7z9kvpz74lkj7k1xqxm38s7h3l3jc7bqhd5pvmk8j468"))))
    (build-system cmake-build-system)
    (outputs '("out" "source"))
    (arguments
     (list
      #:build-type "Release"
      #:configure-flags
      #~(list "-DNVIDIA_SUPPORT=ON"
              "-DAMDGPU_SUPPORT=ON"
              "-DRADEON_SUPPORT=ON"
              "-DINTEL_SUPPORT=ON"
              "-DMSM_SUPPORT=ON"
              "-DPANFROST_SUPPORT=ON"
              "-DPANTHOR_SUPPORT=ON"
              "-DV3D_SUPPORT=ON"
              "-DASCEND_SUPPORT=OFF"
              "-DTPU_SUPPORT=OFF"
              "-DROCKCHIP_SUPPORT=ON"
              "-DMETAX_SUPPORT=OFF"
              "-DENFLAME_SUPPORT=OFF"
              "-DTENSTORRENT_SUPPORT=ON"
              "-DIXML_SUPPORT=OFF"
              "-DUSE_LIBUDEV_OVER_LIBSYSTEMD=ON"
              "-DBUILD_TESTING=ON")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'install-source-output
            (lambda _
              (copy-recursively "." #$output:source))))))
    (native-inputs (list googletest pkg-config))
    (inputs (list eudev libdrm ncurses))
    (home-page "https://github.com/Syllo/nvtop")
    (synopsis "Interactive GPU process monitor")
    (description
     "NVTOP is an htop-like task monitor for GPUs and accelerators.  It
supports multiple vendors through Linux DRM and dynamically discovers optional
vendor management libraries at run time.  The @code{source} output contains
the authenticated source tree used by software embedding nvtop's collectors.")
    (license license:gpl3)))
