(define-module (virelith packages elogind)
               #:use-module (gnu packages freedesktop)
               #:use-module (guix packages)
               #:use-module (guix git-download))


;; 项目需要比当前 GNU Guix 主线更新的 elogind（255 系列 → 257 系列）。
;;
;; GNU Guix master 的 elogind 停留在 255.22；257 系列从上游原生支持
;; D-Bus activation（org.freedesktop.login1.service 由包自身安装），
;; 并引入 varlink 支持（默认开启）。Guix 的 gnome-team 分支已做过
;; 257.14 的升级验证（package 层仅改 version/commit 前缀/hash，其余
;; 构建逻辑原样可用）。这里继承官方 elogind 的依赖与构建逻辑，只覆盖
;; source——版本间如有构建问题，应在实际构建后按证据最小修改。
(define-public elogind-compat
  (package
   (inherit elogind)
   (name "elogind-compat")
   (version "257.16")

   ;; 上游 tag 从 V255.22 之后改为小写 v 前缀（v257.16）。
   (source
    (origin
     (method git-fetch)
     (uri
      (git-reference
       (url "https://github.com/elogind/elogind")
       (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0sbggvmc3ni5pp5ybmxi0mxxgkyl84d539jsb6nf9qwqvxming8j"))))))
