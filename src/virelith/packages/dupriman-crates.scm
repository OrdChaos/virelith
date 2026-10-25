;;; Rust crate sources for DupriMan.
;;;
;;; Generated with `guix import crate --lockfile=<Cargo.lock> dupriman' for
;;; DupriMan 0.1.0, commit 1b1721d.  Do not edit by hand.

(define-module (virelith packages dupriman-crates)
  #:use-module (srfi srfi-1)
  #:use-module (guix build-system cargo)
  #:export (lookup-cargo-inputs dupriman-cargo-inputs))

(define rust-anstream-1.0.0
  (crate-source "anstream" "1.0.0"
                "13d2bj0xfg012s4rmq44zc8zgy1q8k9yp7yhvfnarscnmwpj2jl2"))

(define rust-anstyle-1.0.14
  (crate-source "anstyle" "1.0.14"
                "0030szmgj51fxkic1hpakxxgappxzwm6m154a3gfml83lq63l2wl"))

(define rust-anstyle-parse-1.0.0
  (crate-source "anstyle-parse" "1.0.0"
                "03hkv2690s0crssbnmfkr76kw1k7ah2i6s5amdy9yca2n8w7zkjj"))

(define rust-anstyle-query-1.1.5
  (crate-source "anstyle-query" "1.1.5"
                "1p6shfpnbghs6jsa0vnqd8bb8gd7pjd0jr7w0j8jikakzmr8zi20"))

(define rust-anstyle-wincon-3.0.11
  (crate-source "anstyle-wincon" "3.0.11"
                "0zblannm70sk3xny337mz7c6d8q8i24vhbqi42ld8v7q1wjnl7i9"))

(define rust-anyhow-1.0.104
  (crate-source "anyhow" "1.0.104"
                "0w34jjcm02p5g9kvsjr1dvpw0zs2fi7igi6nr414fkm5gz85w2ik"))

(define rust-autocfg-1.5.1
  (crate-source "autocfg" "1.5.1"
                "0lqasy5i30flcgih1b50kvsk6z32g09r1q4ql7q81pj6228jy0zj"))

(define rust-bitflags-2.13.1
  (crate-source "bitflags" "2.13.1"
                "1nl76mpykmwmb8rq1l5vw1azdh1wvxdrnsk4sy3rdrzx01nvg25m"))

(define rust-cairo-rs-0.21.5
  (crate-source "cairo-rs" "0.21.5"
                "1r679k0wbrxa773cw207wmnhx8sypm4s7pmncbiay5mxq0sy27xh"))

(define rust-cairo-sys-rs-0.21.5
  (crate-source "cairo-sys-rs" "0.21.5"
                "0p14dpy8ar6gqi493nn04w5n7rp438km8icywfsma85iqs085hh6"))

(define rust-cfg-expr-0.20.8
  (crate-source "cfg-expr" "0.20.8"
                "0z4r6l4936g1c1s27ryvjdy5pjij6sfvs3myk3hji9dgpi13asgv"))

(define rust-clap-4.6.4
  (crate-source "clap" "4.6.4"
                "1dz5brl39xchkml0khm348i87w89misprlinmnk77vwjawa0q7nr"))

(define rust-clap-builder-4.6.2
  (crate-source "clap_builder" "4.6.2"
                "12sl6fyj6w2djxj0lsc1lkj1h3wpx74fjhb37izvaf65vjpji5ph"))

(define rust-clap-derive-4.6.4
  (crate-source "clap_derive" "4.6.4"
                "0qd0v7pa2arwxjjinmjim6xrjy61bc28m1yryhc7zjjssswx44nh"))

(define rust-clap-lex-1.1.0
  (crate-source "clap_lex" "1.1.0"
                "1ycqkpygnlqnndghhcxjb44lzl0nmgsia64x9581030yifxs7m68"))

(define rust-colorchoice-1.0.5
  (crate-source "colorchoice" "1.0.5"
                "0w75k89hw39p0mnnhlrwr23q50rza1yjki44qvh2mgrnj065a1qx"))

(define rust-equivalent-1.0.2
  (crate-source "equivalent" "1.0.2"
                "03swzqznragy8n0x31lqc78g2af054jwivp7lkrbrc0khz74lyl7"))

(define rust-field-offset-0.3.6
  (crate-source "field-offset" "0.3.6"
                "0zq5sssaa2ckmcmxxbly8qgz3sxpb8g1lwv90sdh1z74qif2gqiq"))

(define rust-futures-channel-0.3.33
  (crate-source "futures-channel" "0.3.33"
                "1bn5hlhfkl1sgypmiachaqcgwmr6wmjal7dyhfyb1zkazvs90996"))

(define rust-futures-core-0.3.33
  (crate-source "futures-core" "0.3.33"
                "1iqdbvcdlplfr2g43h7xrfkv2sg5p1a26x8acz1xgxl07i3hrm9c"))

(define rust-futures-executor-0.3.33
  (crate-source "futures-executor" "0.3.33"
                "0n3lpkmcfrsnh40i4armn040gnqbpd257hz5qs46zipjr6f8fm37"))

(define rust-futures-io-0.3.33
  (crate-source "futures-io" "0.3.33"
                "0yjx13qdm9b2p4w00ddw85k6yccnnmqrlrrz8yfmi5jg7jmfqxs5"))

(define rust-futures-macro-0.3.33
  (crate-source "futures-macro" "0.3.33"
                "02xiyd5y1nk9b805aympj4wq2czgvxnhcml9w9xkc665d3g3qv9d"))

(define rust-futures-task-0.3.33
  (crate-source "futures-task" "0.3.33"
                "02f1y1yvjg1cv998zkgl1706pi9y4fyc9045l1hlmyqyhclfscdj"))

(define rust-futures-util-0.3.33
  (crate-source "futures-util" "0.3.33"
                "1anyg40j5www5l22r2jbn1birsafz4q1w9qmcjk4vqzwasi90ym7"))

(define rust-gdk-pixbuf-0.21.5
  (crate-source "gdk-pixbuf" "0.21.5"
                "0350zm38d7sf3ilnwy9fxyhajbdslvjdcm7xxlk4dn6dwcwhvfyy"))

(define rust-gdk-pixbuf-sys-0.21.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gdk-pixbuf-sys" "0.21.5"
                "1rqc1bv3ln6hx4a4bn3jagz75dzhmy96hkyx4lg5blm3p58av5dx"))

(define rust-gdk4-0.10.3
  (crate-source "gdk4" "0.10.3"
                "1gxzhk55r0nh48ld7l1j700cc6jqh8jvvzw8bph4qjmy5chn8rbm"))

(define rust-gdk4-sys-0.10.3
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gdk4-sys" "0.10.3"
                "0d5hk2agfifnn0hgcjyb4lcrvrdlaxgkzj6w99m854gmrjrybm56"))

(define rust-gio-0.21.5
  (crate-source "gio" "0.21.5"
                "06l1nlq5r0dvm0xmhrpgvs8ypx7jcb3vgihxwrvb8s0cc2zlizy5"))

(define rust-gio-sys-0.21.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gio-sys" "0.21.5"
                "08hgv0lqm94hyhdisjrl52bg9699c9ibp6zzr2301r58vf4gww80"))

(define rust-glib-0.21.5
  (crate-source "glib" "0.21.5"
                "12xxy5js4bfpjz9k6831xj090r5y37g30wrvawxwx43c5qy15phn"))

(define rust-glib-macros-0.21.5
  (crate-source "glib-macros" "0.21.5"
                "05vzv1m4dg1cpkakxk3n1846acv4fhwhghq1zsbaca0j61svcnfg"))

(define rust-glib-sys-0.21.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "glib-sys" "0.21.5"
                "0v1ymxb51sbwv242slq21kbn8g38j2day53f52kn9r4sl6iy359d"))

(define rust-gobject-sys-0.21.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gobject-sys" "0.21.5"
                "157jv8ga4f7p4vrn4mmg84lrl0ly3kz9kjzkfm2qz88r1pd3bjid"))

(define rust-graphene-rs-0.21.5
  (crate-source "graphene-rs" "0.21.5"
                "1yg23ws354622ya5qccwvf9gpjn188vhkrz1pzc3yrnvr4506c17"))

(define rust-graphene-sys-0.21.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "graphene-sys" "0.21.5"
                "14zxhk20yypksyh8kx14xf5ddhjifcmzcjh49cg29bd93q4k4pli"))

(define rust-gsk4-0.10.3
  (crate-source "gsk4" "0.10.3"
                "0lx17acgawg9xn216lgikcdpy1lxjvhqk2q2mazcb5jqijfxwmg7"))

(define rust-gsk4-sys-0.10.3
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gsk4-sys" "0.10.3"
                "1xzlf8yidajc86cm7fcmn5br11lgdn3l242z0s1g8ihi75r19sbw"))

(define rust-gtk4-0.10.3
  (crate-source "gtk4" "0.10.3"
                "1971514d9kadzj61rn28fgc4gjk77g2335sl8fpvzxy6rx9ivcmc"))

(define rust-gtk4-macros-0.10.3
  (crate-source "gtk4-macros" "0.10.3"
                "0hiy02q0gnfqg1bj8iycb5xmgm0jz80q2psxh521551x9ahvbkrw"))

(define rust-gtk4-sys-0.10.3
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gtk4-sys" "0.10.3"
                "1pc803r3921h44pa773qpirn3aqcrq2fibykdhb5vq8ybbz7f9c4"))

(define rust-hashbrown-0.17.1
  (crate-source "hashbrown" "0.17.1"
                "0jmqz7i4yl6cm7rbn0i2ffkfrmwi6xkmzkaldr2v8bcsx2v0jngd"))

(define rust-heck-0.5.0
  (crate-source "heck" "0.5.0"
                "1sjmpsdl8czyh9ywl3qcsfsq9a307dg4ni2vnlwgnzzqhc4y0113"))

(define rust-indexmap-2.14.0
  (crate-source "indexmap" "2.14.0"
                "1na9z6f0d5pkjr1lgsni470v98gv2r7c41j8w48skr089x2yjrnl"))

(define rust-is-terminal-polyfill-1.70.2
  (crate-source "is_terminal_polyfill" "1.70.2"
                "15anlc47sbz0jfs9q8fhwf0h3vs2w4imc030shdnq54sny5i7jx6"))

(define rust-itoa-1.0.18
  (crate-source "itoa" "1.0.18"
                "10jnd1vpfkb8kj38rlkn2a6k02afvj3qmw054dfpzagrpl6achlg"))

(define rust-libc-0.2.189
  (crate-source "libc" "0.2.189"
                "1whjfs375vlng2q6yrbzs73cvp5lm3w1n2gfqajb2vgf7zg3xbry"))

(define rust-memchr-2.8.3
  (crate-source "memchr" "2.8.3"
                "161xa63ipfanf8v3nb82xd5hqgydv55nzw59wyngqbz6alfaz2yg"))

(define rust-memoffset-0.9.1
  (crate-source "memoffset" "0.9.1"
                "12i17wh9a9plx869g7j4whf62xw68k5zd4k0k5nh6ys5mszid028"))

(define rust-once-cell-polyfill-1.70.2
  (crate-source "once_cell_polyfill" "1.70.2"
                "1zmla628f0sk3fhjdjqzgxhalr2xrfna958s632z65bjsfv8ljrq"))

(define rust-pango-0.21.5
  (crate-source "pango" "0.21.5"
                "0sgb6xls3l07f7b257rp3gjx9g6mhckhgz5pbc37l1vq41gdilaj"))

(define rust-pango-sys-0.21.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "pango-sys" "0.21.5"
                "1zbcw3b2i5ixzy0ds65z2xdvllifzh8m5xid7lqgzmbfsckndw5l"))

(define rust-pin-project-lite-0.2.17
  (crate-source "pin-project-lite" "0.2.17"
                "1kfmwvs271si96zay4mm8887v5khw0c27jc9srw1a75ykvgj54x8"))

(define rust-pkg-config-0.3.33
  (crate-source "pkg-config" "0.3.33"
                "17jnqmcbxsnwhg9gjf0nh6dj5k0x3hgwi3mb9krjnmfa9v435w8r"))

(define rust-proc-macro-crate-3.5.0
  (crate-source "proc-macro-crate" "3.5.0"
                "0kv1g1d1zjwxlgcaba2qlshzyy32j03xic8rskqlcr5mnblsfyz6"))

(define rust-proc-macro2-1.0.107
  (crate-source "proc-macro2" "1.0.107"
                "1nb6ly8kp65f724kj73ippc7lvydss24sm2vagk6qpklpg4pwplq"))

(define rust-quote-1.0.47
  (crate-source "quote" "1.0.47"
                "00ch0yyzvv6s671ik0kcsbw8nigdaj2g3fr61kcahwx48aqlvgqz"))

(define rust-rustc-version-0.4.1
  (crate-source "rustc_version" "0.4.1"
                "14lvdsmr5si5qbqzrajgb6vfn69k0sfygrvfvr2mps26xwi3mjyg"))

(define rust-semver-1.0.28
  (crate-source "semver" "1.0.28"
                "1kaimrpy876bcgi8bfj0qqfxk77zm9iz2zhn1hp9hj685z854y4a"))

(define rust-serde-1.0.229
  (crate-source "serde" "1.0.229"
                "1fp04fq4a79bpm61xz1zy0pbz4kpc7d771zii1k3inmszq55jj21"))

(define rust-serde-core-1.0.229
  (crate-source "serde_core" "1.0.229"
                "0j1ajiha76h3nmd976il9li6975k121xa7jb39ws8n0yqp4s5p37"))

(define rust-serde-derive-1.0.229
  (crate-source "serde_derive" "1.0.229"
                "0j4k63i7h1bikxwz2c89ig0hrwbnl9mz1czn85xx99x5cc9dg9g7"))

(define rust-serde-json-1.0.151
  (crate-source "serde_json" "1.0.151"
                "051zww7lvpw147vvwss1ng6w587qyrkzg75fvj08q2dfrmgbahf8"))

(define rust-serde-spanned-0.6.9
  (crate-source "serde_spanned" "0.6.9"
                "18vmxq6qfrm110caszxrzibjhy2s54n1g5w1bshxq9kjmz7y0hdz"))

(define rust-serde-spanned-1.1.1
  (crate-source "serde_spanned" "1.1.1"
                "09jzk7i6wihn3d8i3wi4j4n98ghi93c3b8m8k64nxq0ijn3vaqk6"))

(define rust-slab-0.4.12
  (crate-source "slab" "0.4.12"
                "1xcwik6s6zbd3lf51kkrcicdq2j4c1fw0yjdai2apy9467i0sy8c"))

(define rust-smallvec-1.15.2
  (crate-source "smallvec" "1.15.2"
                "143wzbqf6vgapdp2z4qpl0yvlqcn17s8cnk8m28rqly808zsdmlf"))

(define rust-strsim-0.11.1
  (crate-source "strsim" "0.11.1"
                "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x"))

(define rust-syn-2.0.119
  (crate-source "syn" "2.0.119"
                "15vjy620l91a3q4n4f4gzhnflmdr6pnm38v2m6cpk86i8av32a47"))

(define rust-syn-3.0.3
  (crate-source "syn" "3.0.3"
                "18srnql3cd39j9q6hf1az02p67rlr1rf6njx9zx4vxj9i3jvmsak"))

(define rust-system-deps-7.0.8
  (crate-source "system-deps" "7.0.8"
                "1rwnfw9dm6ck65a7lfjfpn2c91gwj88brz2i09z3fdbknvz3asir"))

(define rust-target-lexicon-0.13.5
  (crate-source "target-lexicon" "0.13.5"
                "1jm6lmf9hsn7ri2d6v9gg6fy24lylhskh6pbxh71f82wdxd97dmd"))

(define rust-toml-0.8.23
  (crate-source "toml" "0.8.23"
                "0qnkrq4lm2sdhp3l6cb6f26i8zbnhqb7mhbmksd550wxdfcyn6yw"))

(define rust-toml-1.1.3+spec-1.1.0
  (crate-source "toml" "1.1.3+spec-1.1.0"
                "0g2c3lqf61ss14ak0lzg5r8fvsx8mnclzldfzk28y74lzb6nxjak"))

(define rust-toml-datetime-0.6.11
  (crate-source "toml_datetime" "0.6.11"
                "077ix2hb1dcya49hmi1avalwbixmrs75zgzb3b2i7g2gizwdmk92"))

(define rust-toml-datetime-1.1.1+spec-1.1.0
  (crate-source "toml_datetime" "1.1.1+spec-1.1.0"
                "1mws2mkkf46l7inn77azhm0vdwxngv9vsbhbl0ah33p2c9gzcr9i"))

(define rust-toml-edit-0.22.27
  (crate-source "toml_edit" "0.22.27"
                "16l15xm40404asih8vyjvnka9g0xs9i4hfb6ry3ph9g419k8rzj1"))

(define rust-toml-edit-0.25.13+spec-1.1.0
  (crate-source "toml_edit" "0.25.13+spec-1.1.0"
                "16xgmjdnxssdpj7rjyimsk4fqbv29g8zl7zhdbc6dxrf9mz3cxb9"))

(define rust-toml-parser-1.1.2+spec-1.1.0
  (crate-source "toml_parser" "1.1.2+spec-1.1.0"
                "09kmzc55a0j21whm290wlf5a8b18a0qc87a1s8sncrckc6wfkax2"))

(define rust-toml-write-0.1.2
  (crate-source "toml_write" "0.1.2"
                "008qlhqlqvljp1gpp9rn5cqs74gwvdgbvs92wnpq8y3jlz4zi6ax"))

(define rust-toml-writer-1.1.2+spec-1.1.0
  (crate-source "toml_writer" "1.1.2+spec-1.1.0"
                "1lk6pqf9mac3v1x6282n6a66qx5b18c8f4a23bsd0nk658x3amkx"))

(define rust-unicode-ident-1.0.24
  (crate-source "unicode-ident" "1.0.24"
                "0xfs8y1g7syl2iykji8zk5hgfi5jw819f5zsrbaxmlzwsly33r76"))

(define rust-utf8parse-0.2.2
  (crate-source "utf8parse" "0.2.2"
                "088807qwjq46azicqwbhlmzwrbkz7l4hpw43sdkdyyk524vdxaq6"))

(define rust-version-compare-0.2.1
  (crate-source "version-compare" "0.2.1"
                "03nziqxwnxlizl42cwsx33vi5xd2cf2jnszhh9rzay7g6xl8bhh3"))

(define rust-windows-link-0.2.1
  (crate-source "windows-link" "0.2.1"
                "1rag186yfr3xx7piv5rg8b6im2dwcf8zldiflvb22xbzwli5507h"))

(define rust-windows-sys-0.61.2
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.61.2"
                "1z7k3y9b6b5h52kid57lvmvm05362zv1v8w0gc7xyv5xphlp44xf"))

(define rust-winnow-0.7.15
  (crate-source "winnow" "0.7.15"
                "0i9rkl2rqpbnnxlgs20gmkj3nd0b2k8q55mjmpc2ybb84xwxjyfz"))

(define rust-winnow-1.0.4
  (crate-source "winnow" "1.0.4"
                "10fzxipa7lx16172p3aca9j60hzbqgjki2f95kqksd5qywcp7f93"))

(define rust-zmij-1.0.23
  (crate-source "zmij" "1.0.23"
                "06zwri21nnrl34rwinmvbciap8yk1mrl8qfg9pff7lgspc56sri9"))

;; `cargo-inputs' looks up this binding in the crate module.  Keep every
;; lockfile crate, including target-specific entries Cargo filters locally.
(define (lookup-cargo-inputs package-name)
  (if (eq? package-name 'dupriman)
      (let ((bindings '()))
        (module-map
         (lambda (name variable)
           (when (string-prefix? "rust-" (symbol->string name))
             (set! bindings (cons (cons name variable) bindings))))
         (resolve-module '(virelith packages dupriman-crates)))
        (map (lambda (binding) (variable-ref (cdr binding)))
             (sort bindings
                   (lambda (left right)
                     (string<? (symbol->string (car left))
                               (symbol->string (car right)))))))
      '()))

(define dupriman-cargo-inputs lookup-cargo-inputs)
