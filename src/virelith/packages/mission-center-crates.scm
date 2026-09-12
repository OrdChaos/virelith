;;; Rust crate sources for Mission Center and Magpie.
;;;
;;; Generated with `guix import crate -f <Cargo.lock> <root>` for the
;;; Mission Center 1.2.0 GUI workspace and the bundled Magpie workspace,
;;; then deduplicated.  Do not edit by hand.

(define-module (virelith packages mission-center-crates)
  #:use-module (guix build-system cargo)  ; crate-source
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)        ; upower_dbus git origin
  #:use-module (guix packages)
  #:export (mission-center-cargo-inputs))

(define rust-aho-corasick-1.1.4
  (crate-source "aho-corasick" "1.1.4"
                "00a32wb2h07im3skkikc495jvncf62jl6s96vwc7bhi70h9imlyx"))

(define rust-anyhow-1.0.104
  (crate-source "anyhow" "1.0.104"
                "0w34jjcm02p5g9kvsjr1dvpw0zs2fi7igi6nr414fkm5gz85w2ik"))

(define rust-arrayvec-0.7.8
  (crate-source "arrayvec" "0.7.8"
                "0mmd8lrijbvg1qp4c5zis5dq41a3mjv2rb6bxkyj9kwaw2k6gyyk"))

(define rust-autocfg-1.5.1
  (crate-source "autocfg" "1.5.1"
                "0lqasy5i30flcgih1b50kvsk6z32g09r1q4ql7q81pj6228jy0zj"))

(define rust-beef-0.5.2
  (crate-source "beef" "0.5.2"
                "1c95lbnhld96iwwbyh5kzykbpysq0fnjfhwxa1mhap5qxgrl30is"))

(define rust-bitfield-0.19.4
  (crate-source "bitfield" "0.19.4"
                "06b4qjc40kgyv0a5cxfx4a7l6f5hcjmqgqb0pq4bzwmhqqbnbfi1"))

(define rust-bitfield-macros-0.19.4
  (crate-source "bitfield-macros" "0.19.4"
                "15qym2fxzj079hic6xibci256h8812s6nmkbzm2ipprg4776m3gl"))

(define rust-bitflags-2.13.1
  (crate-source "bitflags" "2.13.1"
                "1nl76mpykmwmb8rq1l5vw1azdh1wvxdrnsk4sy3rdrzx01nvg25m"))

(define rust-block-0.1.6
  (crate-source "block" "0.1.6"
                "16k9jgll25pzsq14f244q22cdv0zb4bqacldg3kx6h89d7piz30d"))

(define rust-bytes-1.12.1
  (crate-source "bytes" "1.12.1"
                "017z19dpg4f942h051m7bpnzcgng042hhcpd7bmg7bjjqd42lrgw"))

(define rust-cairo-rs-0.22.0
  (crate-source "cairo-rs" "0.22.0"
                "15fb1m9vlsni37g9qwqgmag7s69f3bplylm0v567901lg6mdkj2w"))

(define rust-cairo-sys-rs-0.22.0
  (crate-source "cairo-sys-rs" "0.22.0"
                "0m3dnyax3l8nwypc2lzzd41bbfrjxykbd39bw2p5yzq42dbrid7q"))

(define rust-cc-1.3.0
  (crate-source "cc" "1.3.0"
                "1f27b93qhs65bjq04ljwgwxf8xq2qbba4j1k99cv9d9qav88i5f8"))

(define rust-cfg-expr-0.20.8
  (crate-source "cfg-expr" "0.20.8"
                "0z4r6l4936g1c1s27ryvjdy5pjij6sfvs3myk3hji9dgpi13asgv"))

(define rust-cfg-if-1.0.4
  (crate-source "cfg-if" "1.0.4"
                "008q28ajc546z5p2hcwdnckmg0hia7rnx52fni04bwqkzyrghc4k"))

(define rust-chacha20-0.10.1
  (crate-source "chacha20" "0.10.1"
                "108aajbvs3rwl4d0pdvq3p8ydy4pwh0rxy2z265ynwkflrmla96m"))

(define rust-cmake-0.1.58
  (crate-source "cmake" "0.1.58"
                "0y06zxw5sv1p5vvpp5rz1qwbrq7ccawrl09nqy5ahx1a5418mxy0"))

(define rust-const-random-0.1.18
  (crate-source "const-random" "0.1.18"
                "0n8kqz3y82ks8znvz1mxn3a9hadca3amzf33gmi6dc3lzs103q47"))

(define rust-const-random-macro-0.1.16
  (crate-source "const-random-macro" "0.1.16"
                "03iram4ijjjq9j5a7hbnmdngj8935wbsd0f5bm8yw2hblbr3kn7r"))

(define rust-cpufeatures-0.3.0
  (crate-source "cpufeatures" "0.3.0"
                "00fjhygsqmh4kbxxlb99mcsbspxcai6hjydv4c46pwb67wwl2alb"))

(define rust-crunchy-0.2.4
  (crate-source "crunchy" "0.2.4"
                "1mbp5navim2qr3x48lyvadqblcxc1dm0lqr0swrkkwy2qblvw3s6"))

(define rust-dlv-list-0.5.2
  (crate-source "dlv-list" "0.5.2"
                "0pqvrinxzdz7bpy4a3p450h8krns3bd0mc3w0qqvm03l2kskj824"))

(define rust-either-1.16.0
  (crate-source "either" "1.16.0"
                "17k7jfbdz7k440h6lws9baz8p9zlxgb41sig3w81h80nwzsjyqli"))

(define rust-equivalent-1.0.2
  (crate-source "equivalent" "1.0.2"
                "03swzqznragy8n0x31lqc78g2af054jwivp7lkrbrc0khz74lyl7"))

(define rust-errno-0.3.14
  (crate-source "errno" "0.3.14"
                "1szgccmh8vgryqyadg8xd58mnwwicf39zmin3bsn63df2wbbgjir"))

(define rust-error-code-3.3.2
  (crate-source "error-code" "3.3.2"
                "0nacxm9xr3s1rwd6fabk3qm89fyglahmbi4m512y0hr8ym6dz8ny"))

(define rust-fastrand-2.5.0
  (crate-source "fastrand" "2.5.0"
                "08q2r30y62winysimnlpbvw9kiwn0rmdlidqlmzd6z90mv764z6s"))

(define rust-field-offset-0.3.6
  (crate-source "field-offset" "0.3.6"
                "0zq5sssaa2ckmcmxxbly8qgz3sxpb8g1lwv90sdh1z74qif2gqiq"))

(define rust-find-msvc-tools-0.1.9
  (crate-source "find-msvc-tools" "0.1.9"
                "10nmi0qdskq6l7zwxw5g56xny7hb624iki1c39d907qmfh3vrbjv"))

(define rust-fixedbitset-0.5.7
  (crate-source "fixedbitset" "0.5.7"
                "16fd3v9d2cms2vddf9xhlm56sz4j0zgrk3d2h6v1l7hx760lwrqx"))

(define rust-fnv-1.0.7
  (crate-source "fnv" "1.0.7"
                "1hc2mcqha06aibcaza94vbi81j6pr9a1bbxrxjfhc91zin8yr7iz"))

(define rust-foldhash-0.1.5
  (crate-source "foldhash" "0.1.5"
                "1wisr1xlc2bj7hk4rgkcjkz3j2x4dhd1h9lwk7mj8p71qpdgbi6r"))

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

(define rust-gdk-pixbuf-0.22.0
  (crate-source "gdk-pixbuf" "0.22.0"
                "0imnx7m6f3agw91hqv1zpci658wj71by8k1pvfr43q5ydlvj1x15"))

(define rust-gdk-pixbuf-sys-0.22.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gdk-pixbuf-sys" "0.22.0"
                "1ywipm5pg65rsyfkb62xb2s013n10kpvg4bb9yslhjzwn4vipws8"))

(define rust-gdk4-0.11.4
  (crate-source "gdk4" "0.11.4"
                "0f8f3zvwq6vwqbnhb0ffzl5zl0wbhvqqva9k0svam8nbdrn2l7nq"))

(define rust-gdk4-sys-0.11.4
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gdk4-sys" "0.11.4"
                "04wdqzz40653n1i54g5bvp29h587sgsjdl6hqisrj8kxin6n13rx"))

(define rust-getrandom-0.2.17
  (crate-source "getrandom" "0.2.17"
                "1l2ac6jfj9xhpjjgmcx6s1x89bbnw9x6j9258yy6xjkzpq0bqapz"))

(define rust-getrandom-0.4.3
  (crate-source "getrandom" "0.4.3"
                "16b0202fkdwz3p2cyll82dv24ljbn0wiyy829v4lwbkbflyqh3ih"))

(define rust-gettext-rs-0.7.7
  (crate-source "gettext-rs" "0.7.7"
                "1prb49j0d33kam9ww0pi5bbr95726ks37s0xjs3fw3vz3gf5fn2x"))

(define rust-gettext-sys-0.26.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gettext-sys" "0.26.0"
                "1scfknchxmmdfl3w3ik8bnb9rlq3gl3kwaq34gw0zryp1nmmka2f"))

(define rust-gio-0.22.8
  (crate-source "gio" "0.22.8"
                "1vcxfs28jrhkvck57x3qgl5ckf4p41s5mpiv86wjdhq9k5k1yglb"))

(define rust-gio-sys-0.22.8
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gio-sys" "0.22.8"
                "1mdhnh532ridfi6hv8mar34hwf6ywzjf1c84c68xl5ndlxyxqgrm"))

(define rust-glib-0.22.8
  (crate-source "glib" "0.22.8"
                "0041i04ba9r8sicbvpff7gdg8wr8x2s54khfjqdzr08qplagbg6x"))

(define rust-glib-macros-0.22.6
  (crate-source "glib-macros" "0.22.6"
                "06bgdnz54l50vxkcp8iraab1v1x3v7l5g5s2k0l19iq7jx4j6vah"))

(define rust-glib-sys-0.22.8
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "glib-sys" "0.22.8"
                "0cr2jp2z0g3k9iap56zccbacc9bqxanh8qrchx8nhrwzkx2nf283"))

(define rust-gobject-sys-0.22.6
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gobject-sys" "0.22.6"
                "0b57dwgs2yp56892kp990bxxhmvsr69c2n8k8v7pjyl8kf2n3a12"))

(define rust-graphene-rs-0.22.8
  (crate-source "graphene-rs" "0.22.8"
                "1zvx1l25phywms3y191jd420nwfs4s4kb4mn7bqw6wc9anf6p1gb"))

(define rust-graphene-sys-0.22.8
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "graphene-sys" "0.22.8"
                "017xd7svbz7a8yzhp4zjl63x6dp06cj8l3ayf39p0dcgx3yzszsw"))

(define rust-gsk4-0.11.4
  (crate-source "gsk4" "0.11.4"
                "1zsj97c8kj337by8wgll8f5mznmim7lzdvy0absvip0lbwfbwrxq"))

(define rust-gsk4-sys-0.11.4
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gsk4-sys" "0.11.4"
                "123hf2kcl44vkll874msafgx090z8cmqgf6g8rk8kvl1wsr7wz2v"))

(define rust-gtk4-0.11.4
  (crate-source "gtk4" "0.11.4"
                "1nbn1dvivwws2x7aw14f1gmpigj6z91ls65qnl3lpxl4ci3a184q"))

(define rust-gtk4-macros-0.11.4
  (crate-source "gtk4-macros" "0.11.4"
                "03nh83f5p3gf4cxv81xrj9lmkia1p1mj094w0gg08sm302a1giss"))

(define rust-gtk4-sys-0.11.4
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gtk4-sys" "0.11.4"
                "00bg3jmwll7qwdmk30b16ja6bzzmfxml9i158jcb3w3ag1agkf42"))

(define rust-hashbrown-0.14.5
  (crate-source "hashbrown" "0.14.5"
                "1wa1vy1xs3mp11bn3z9dv0jricgr6a2j0zkf1g19yz3vw4il89z5"))

(define rust-hashbrown-0.15.5
  (crate-source "hashbrown" "0.15.5"
                "189qaczmjxnikm9db748xyhiw04kpmhm9xj9k9hg0sgx7pjwyacj"))

(define rust-hashbrown-0.17.1
  (crate-source "hashbrown" "0.17.1"
                "0jmqz7i4yl6cm7rbn0i2ffkfrmwi6xkmzkaldr2v8bcsx2v0jngd"))

(define rust-heck-0.5.0
  (crate-source "heck" "0.5.0"
                "1sjmpsdl8czyh9ywl3qcsfsq9a307dg4ni2vnlwgnzzqhc4y0113"))

(define rust-indexmap-2.14.0
  (crate-source "indexmap" "2.14.0"
                "1na9z6f0d5pkjr1lgsni470v98gv2r7c41j8w48skr089x2yjrnl"))

(define rust-itertools-0.14.0
  (crate-source "itertools" "0.14.0"
                "118j6l1vs2mx65dqhwyssbrxpawa90886m3mzafdvyip41w2q69b"))

(define rust-lazy-static-1.5.0
  (crate-source "lazy_static" "1.5.0"
                "1zk6dqqni0193xg6iijh7i3i44sryglwgvx20spdvwk3r6sbrlmv"))

(define rust-libadwaita-0.9.2
  (crate-source "libadwaita" "0.9.2"
                "1yivylbik000y0ff5k3hjy5mqwghjj6l8yqm3xdlnahqcw791fc5"))

(define rust-libadwaita-sys-0.9.2
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libadwaita-sys" "0.9.2"
                "1kcw0yc235d1bdzxvsv35f56zv0r9i5bshckm4m8b2dk89vc5lr8"))

(define rust-libc-0.2.187
  (crate-source "libc" "0.2.187"
                "0cp7jh51z9fq4vb8fkjakd28dlpfjw3mkill271zb3kjxa1kfx57"))

(define rust-linux-raw-sys-0.12.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "linux-raw-sys" "0.12.1"
                "0lwasljrqxjjfk9l2j8lyib1babh2qjlnhylqzl01nihw14nk9ij"))

(define rust-locale-config-0.3.0
  (crate-source "locale_config" "0.3.0"
                "0d399alr1i7h7yji4vydbdbzd8hp0xaykr7h4rn3yj7l2rdw7lh8"))

(define rust-log-0.4.33
  (crate-source "log" "0.4.33"
                "1bd9dmk22pxgnf0h0slba6rz99zb0a0b2mdhpk8p92bp26ycbvhc"))

(define rust-logos-0.15.1
  (crate-source "logos" "0.15.1"
                "0m41xcjn6yh3v18618v9f04v7vkmf3zn07y5c68xkhjfkf4jyizz"))

(define rust-logos-0.16.1
  (crate-source "logos" "0.16.1"
                "0pvws33khp431y6x9ykligqlpd28440w5y0ghzm00xm832imab7b"))

(define rust-logos-codegen-0.15.1
  (crate-source "logos-codegen" "0.15.1"
                "0p04jfvaaiw2rj4kzk1s4hlmwhbwvgn3xi5jl0kmph5hj0mklahr"))

(define rust-logos-codegen-0.16.1
  (crate-source "logos-codegen" "0.16.1"
                "0w49rzls4a7yw00zpj30y8y5ii0ql6nh8zd52z8504sf52mgzcsq"))

(define rust-logos-derive-0.15.1
  (crate-source "logos-derive" "0.15.1"
                "0w5l4qm67b551pnx3dksbyia9mm339a53z4fsd13mvympjbrcpb0"))

(define rust-logos-derive-0.16.1
  (crate-source "logos-derive" "0.16.1"
                "0cdaz299mk22vnkvwpzakfs6lw90a89kz0l38fppxha7ay2sklsj"))

(define rust-malloc-buf-0.0.6
  (crate-source "malloc_buf" "0.0.6"
                "1jqr77j89pwszv51fmnknzvd53i1nkmcr8rjrvcxhm4dx1zr1fv2"))

(define rust-memchr-2.8.3
  (crate-source "memchr" "2.8.3"
                "161xa63ipfanf8v3nb82xd5hqgydv55nzw59wyngqbz6alfaz2yg"))

(define rust-memoffset-0.9.1
  (crate-source "memoffset" "0.9.1"
                "12i17wh9a9plx869g7j4whf62xw68k5zd4k0k5nh6ys5mszid028"))

(define rust-miette-7.6.0
  (crate-source "miette" "7.6.0"
                "1dwjnnpcff4jzpf5ns1m19di2p0n5j31zmjv5dskrih7i3nfz62z"))

(define rust-miette-derive-7.6.0
  (crate-source "miette-derive" "7.6.0"
                "12w13a67n2cc37nzidvv0v0vrvf4rsflzxz6slhbn3cm9rqjjnyv"))

(define rust-multimap-0.10.1
  (crate-source "multimap" "0.10.1"
                "1150lf0hjfjj4ksb8s3y0hl7a2nqzqlbh0is7vdym2iyjfrfr1qx"))

(define rust-nng-c-1.11.1
  (crate-source "nng-c" "1.11.1"
                "1i2xd0fpcqwbjmj8y0mpxqs4xcq01fki4w56cnic5snv9wjch4li"))

(define rust-nng-c-sys-1.11.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "nng-c-sys" "1.11.1"
                "16fc5jqw0cw02fc5hif3j18j5z0zbr9ksn757qda5ajk3lg6s9pz"))

(define rust-objc-0.2.7
  (crate-source "objc" "0.2.7"
                "1cbpf6kz8a244nn1qzl3xyhmp05gsg4n313c9m3567625d3innwi"))

(define rust-objc-foundation-0.1.1
  (crate-source "objc-foundation" "0.1.1"
                "1y9bwb3m5fdq7w7i4bnds067dhm4qxv4m1mbg9y61j9nkrjipp8s"))

(define rust-objc-id-0.1.1
  (crate-source "objc_id" "0.1.1"
                "0fq71hnp2sdblaighjc82yrac3adfmqzhpr11irhvdfp9gdlsbf9"))

(define rust-once-cell-1.21.4
  (crate-source "once_cell" "1.21.4"
                "0l1v676wf71kjg2khch4dphwh1jp3291ffiymr2mvy1kxd5kwz4z"))

(define rust-ordered-multimap-0.7.3
  (crate-source "ordered-multimap" "0.7.3"
                "0ygg08g2h381r3zbclba4zx4amm25zd2hsqqmlxljc00mvf3q829"))

(define rust-pango-0.22.8
  (crate-source "pango" "0.22.8"
                "0v1ix8skv2c53p17rlixrw1s055sp96k9xa6n07mvbg21n6hv02x"))

(define rust-pango-sys-0.22.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "pango-sys" "0.22.0"
                "1mnm14vf7xcrag51qjfqy400kh3rqs1rgi897vqfs3x91ji13ldv"))

(define rust-paste-1.0.15
  (crate-source "paste" "1.0.15"
                "02pxffpdqkapy292harq6asfjvadgp1s005fip9ljfsn9fvxgh2p"))

(define rust-petgraph-0.8.3
  (crate-source "petgraph" "0.8.3"
                "0mblnaqbx1y20h5y7pz6y11hk9jjk6k87lsmn7jxaq3hm67ba0c7"))

(define rust-pin-project-lite-0.2.17
  (crate-source "pin-project-lite" "0.2.17"
                "1kfmwvs271si96zay4mm8887v5khw0c27jc9srw1a75ykvgj54x8"))

(define rust-pkg-config-0.3.33
  (crate-source "pkg-config" "0.3.33"
                "17jnqmcbxsnwhg9gjf0nh6dj5k0x3hgwi3mb9krjnmfa9v435w8r"))

(define rust-prettyplease-0.2.37
  (crate-source "prettyplease" "0.2.37"
                "0azn11i1kh0byabhsgab6kqs74zyrg69xkirzgqyhz6xmjnsi727"))

(define rust-proc-macro-crate-3.5.0
  (crate-source "proc-macro-crate" "3.5.0"
                "0kv1g1d1zjwxlgcaba2qlshzyy32j03xic8rskqlcr5mnblsfyz6"))

(define rust-proc-macro2-1.0.107
  (crate-source "proc-macro2" "1.0.107"
                "1nb6ly8kp65f724kj73ippc7lvydss24sm2vagk6qpklpg4pwplq"))

(define rust-prost-0.14.4
  (crate-source "prost" "0.14.4"
                "1qas5v5rap45f43v3ja0jngxrrafrkcwl0iw5a3ld1pz2rscd2jj"))

(define rust-prost-build-0.14.4
  (crate-source "prost-build" "0.14.4"
                "0hmh8nqxa0r6h7rv5rhl2yw0pmszq1h4hza09mmbni7z05w09nh3"))

(define rust-prost-derive-0.14.4
  (crate-source "prost-derive" "0.14.4"
                "1pqa77d7da5pf6ba3kjj7510m5cynz6902ax01ckvr0pfrgv4w5m"))

(define rust-prost-reflect-0.16.5
  (crate-source "prost-reflect" "0.16.5"
                "1lfvzqvqmrsyyx6znjlchgvjhrhms5zc1qwj5ggg46n3cfihxf01"))

(define rust-prost-types-0.14.4
  (crate-source "prost-types" "0.14.4"
                "02ivjvc4cwl5bfgjs3l00hwlrk74z8zlg1xcgx60bww8fvf6fjgr"))

(define rust-protox-0.9.1
  (crate-source "protox" "0.9.1"
                "18g3y10ym7cw7nw5197vgrgq3yaxiy8qbmmvkc5pywf6fdxa09ag"))

(define rust-protox-parse-0.9.0
  (crate-source "protox-parse" "0.9.0"
                "0rk32pwjcsnv9ghnnagvsgxwjmf2y7ziry6z8d36lf9lh4sywbh7"))

(define rust-quote-1.0.47
  (crate-source "quote" "1.0.47"
                "00ch0yyzvv6s671ik0kcsbw8nigdaj2g3fr61kcahwx48aqlvgqz"))

(define rust-r-efi-6.0.0
  (crate-source "r-efi" "6.0.0"
                "1gyrl2k5fyzj9k7kchg2n296z5881lg7070msabid09asp3wkp7q"))

(define rust-rand-0.10.2
  (crate-source "rand" "0.10.2"
                "105yqkdzqbgggd3r1yjm9jg0zvibfdsmxylvxxkmblwc0lxgmxf7"))

(define rust-rand-core-0.10.1
  (crate-source "rand_core" "0.10.1"
                "0s9wiacxrr100icl7i41308gcj85nlcclrc5jx1jd6p10dhigf33"))

(define rust-regex-1.13.1
  (crate-source "regex" "1.13.1"
                "1391a0a4100ik8cp7l577p3ip3haqq03rd9c5vdr7vcfdixj687h"))

(define rust-regex-automata-0.4.16
  (crate-source "regex-automata" "0.4.16"
                "1b8ihxq99g3hr8mr37bvhib4bfn8rlmpmp0wjg2q1j50plvdpkwg"))

(define rust-regex-syntax-0.8.11
  (crate-source "regex-syntax" "0.8.11"
                "1m25h5q2wp976fb9gc3dsc9l99svcvd5cri8lncb51c46ydgzxnn"))

(define rust-rust-ini-0.21.3
  (crate-source "rust-ini" "0.21.3"
                "1iw8yss8ncygd9yx5ay5gmr2jk7vcyv1d0d5pr1jlfcncqmqsvkr"))

(define rust-rustc-version-0.4.1
  (crate-source "rustc_version" "0.4.1"
                "14lvdsmr5si5qbqzrajgb6vfn69k0sfygrvfvr2mps26xwi3mjyg"))

(define rust-rustix-1.1.4
  (crate-source "rustix" "1.1.4"
                "14511f9yjqh0ix07xjrjpllah3325774gfwi9zpq72sip5jlbzmn"))

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

(define rust-serde-spanned-1.1.1
  (crate-source "serde_spanned" "1.1.1"
                "09jzk7i6wihn3d8i3wi4j4n98ghi93c3b8m8k64nxq0ijn3vaqk6"))

(define rust-shlex-2.0.1
  (crate-source "shlex" "2.0.1"
                "1fjsll1cd7d2bcpdij9kd6w62rpbc7qqzvydvs021vsmr1cxvypq"))

(define rust-slab-0.4.12
  (crate-source "slab" "0.4.12"
                "1xcwik6s6zbd3lf51kkrcicdq2j4c1fw0yjdai2apy9467i0sy8c"))

(define rust-smallvec-1.15.2
  (crate-source "smallvec" "1.15.2"
                "143wzbqf6vgapdp2z4qpl0yvlqcn17s8cnk8m28rqly808zsdmlf"))

(define rust-strum-0.28.0
  (crate-source "strum" "0.28.0"
                "1ggr0if083c1mz9w33hkdjsp0iqk2fz9n49bvb73knwihydxwa4n"))

(define rust-strum-macros-0.28.0
  (crate-source "strum_macros" "0.28.0"
                "0r7n6v5b3x85m52isyc8wq78irmr22g0hmj1xn3pbq8f4yhfx1db"))

(define rust-syn-2.0.119
  (crate-source "syn" "2.0.119"
                "15vjy620l91a3q4n4f4gzhnflmdr6pnm38v2m6cpk86i8av32a47"))

(define rust-syn-3.0.2
  (crate-source "syn" "3.0.2"
                "18w7g5b9c585jw2rgvhygqdli8hq7w2jcds4h05lgz5plbbdc1x2"))

(define rust-system-deps-7.0.8
  (crate-source "system-deps" "7.0.8"
                "1rwnfw9dm6ck65a7lfjfpn2c91gwj88brz2i09z3fdbknvz3asir"))

(define rust-target-lexicon-0.13.5
  (crate-source "target-lexicon" "0.13.5"
                "1jm6lmf9hsn7ri2d6v9gg6fy24lylhskh6pbxh71f82wdxd97dmd"))

(define rust-temp-dir-0.1.16
  (crate-source "temp-dir" "0.1.16"
                "0r09qwiiqm8pk6inaqmmp0h6zjg9py6m1dkcwqgghv21x5cnf5w3"))

(define rust-tempfile-3.27.0
  (crate-source "tempfile" "3.27.0"
                "1gblhnyfjsbg9wjg194n89wrzah7jy3yzgnyzhp56f3v9jd7wj9j"))

(define rust-textdistance-1.1.1
  (crate-source "textdistance" "1.1.1"
                "06dq9aj8y0c9rwj4apjqbxcxszz5vf3w6v0jr7dqgxv9mdajqrxa"))

(define rust-thiserror-2.0.19
  (crate-source "thiserror" "2.0.19"
                "1ngwxsjsa64v1n7vb90h2b0i3fqk1piwaf0z6fqdacqfhjc3b909"))

(define rust-thiserror-impl-2.0.19
  (crate-source "thiserror-impl" "2.0.19"
                "1ka10pqy1g8zy5al9m8yadg30jp8hx0q80j8awmd8131yw6gxjs3"))

(define rust-tiny-keccak-2.0.2
  (crate-source "tiny-keccak" "2.0.2"
                "0dq2x0hjffmixgyf6xv9wgsbcxkd65ld0wrfqmagji8a829kg79c"))

(define rust-toml-1.1.3+spec-1.1.0
  (crate-source "toml" "1.1.3+spec-1.1.0"
                "0g2c3lqf61ss14ak0lzg5r8fvsx8mnclzldfzk28y74lzb6nxjak"))

(define rust-toml-datetime-1.1.1+spec-1.1.0
  (crate-source "toml_datetime" "1.1.1+spec-1.1.0"
                "1mws2mkkf46l7inn77azhm0vdwxngv9vsbhbl0ah33p2c9gzcr9i"))

(define rust-toml-edit-0.25.13+spec-1.1.0
  (crate-source "toml_edit" "0.25.13+spec-1.1.0"
                "16xgmjdnxssdpj7rjyimsk4fqbv29g8zl7zhdbc6dxrf9mz3cxb9"))

(define rust-toml-parser-1.1.2+spec-1.1.0
  (crate-source "toml_parser" "1.1.2+spec-1.1.0"
                "09kmzc55a0j21whm290wlf5a8b18a0qc87a1s8sncrckc6wfkax2"))

(define rust-toml-writer-1.1.2+spec-1.1.0
  (crate-source "toml_writer" "1.1.2+spec-1.1.0"
                "1lk6pqf9mac3v1x6282n6a66qx5b18c8f4a23bsd0nk658x3amkx"))

(define rust-unicode-ident-1.0.24
  (crate-source "unicode-ident" "1.0.24"
                "0xfs8y1g7syl2iykji8zk5hgfi5jw819f5zsrbaxmlzwsly33r76"))

(define rust-unicode-width-0.1.14
  (crate-source "unicode-width" "0.1.14"
                "1bzn2zv0gp8xxbxbhifw778a7fc93pa6a1kj24jgg9msj07f7mkx"))

(define rust-version-compare-0.2.1
  (crate-source "version-compare" "0.2.1"
                "03nziqxwnxlizl42cwsx33vi5xd2cf2jnszhh9rzay7g6xl8bhh3"))

(define rust-wasi-0.11.1+wasi-snapshot-preview1
  (crate-source "wasi" "0.11.1+wasi-snapshot-preview1"
                "0jx49r7nbkbhyfrfyhz0bm4817yrnxgd3jiwwwfv0zl439jyrwyc"))

(define rust-winapi-0.3.9
  (crate-source "winapi" "0.3.9"
                "06gl025x418lchw1wxj64ycr7gha83m44cjr5sarhynd9xkrm0sw"))

(define rust-winapi-i686-pc-windows-gnu-0.4.0
  (crate-source "winapi-i686-pc-windows-gnu" "0.4.0"
                "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc"))

(define rust-winapi-x86-64-pc-windows-gnu-0.4.0
  (crate-source "winapi-x86_64-pc-windows-gnu" "0.4.0"
                "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))

(define rust-windows-link-0.2.1
  (crate-source "windows-link" "0.2.1"
                "1rag186yfr3xx7piv5rg8b6im2dwcf8zldiflvb22xbzwli5507h"))

(define rust-windows-sys-0.61.2
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.61.2"
                "1z7k3y9b6b5h52kid57lvmvm05362zv1v8w0gc7xyv5xphlp44xf"))

(define rust-winnow-1.0.4
  (crate-source "winnow" "1.0.4"
                "10fzxipa7lx16172p3aca9j60hzbqgjki2f95kqksd5qywcp7f93"))

(define rust-adler2-2.0.1
  (crate-source "adler2" "2.0.1"
                "1ymy18s9hs7ya1pjc9864l30wk8p2qfqdi7mhhcc5nfakxbij09j"))

(define rust-ahash-0.8.12
  (crate-source "ahash" "0.8.12"
                "0xbsp9rlm5ki017c0w6ay8kjwinwm8knjncci95mii30rmwz25as"))

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

(define rust-ash-0.38.0+1.3.281
  (crate-source "ash" "0.38.0+1.3.281"
                "0vx4yf689v1rc680jvy8bnysx5sgd8f33wnp2vqaizh0v0v4kd0b"))

(define rust-async-broadcast-0.7.2
  (crate-source "async-broadcast" "0.7.2"
                "0ckmqcwyqwbl2cijk1y4r0vy60i89gqc86ijrxzz5f2m4yjqfnj3"))

(define rust-async-channel-2.5.0
  (crate-source "async-channel" "2.5.0"
                "1ljq24ig8lgs2555myrrjighycpx2mbjgrm3q7lpa6rdsmnxjklj"))

(define rust-async-executor-1.14.0
  (crate-source "async-executor" "1.14.0"
                "0al1rmxjy7p7r6h50z698q5lwssqs5a2vzmqbazm1z2sv1rgjsy9"))

(define rust-async-io-2.6.0
  (crate-source "async-io" "2.6.0"
                "1z16s18bm4jxlmp6rif38mvn55442yd3wjvdfhvx4hkgxf7qlss5"))

(define rust-async-lock-3.4.2
  (crate-source "async-lock" "3.4.2"
                "04c3xrrdrfrvh9v0ajxrangpy38qi76qq268zslphnxxjqjpy3r9"))

(define rust-async-process-2.5.0
  (crate-source "async-process" "2.5.0"
                "0xfswxmng6835hjlfhv7k0jrfp7czqxpfj6y2s5dsp05q0g94l7w"))

(define rust-async-recursion-1.1.1
  (crate-source "async-recursion" "1.1.1"
                "04ac4zh8qz2xjc79lmfi4jlqj5f92xjvfaqvbzwkizyqd4pl4hrv"))

(define rust-async-signal-0.2.14
  (crate-source "async-signal" "0.2.14"
                "11dlpb15la279r5cazppy18gbk2xzzl60ahzl19m1kr0l2psmdaj"))

(define rust-async-task-4.7.1
  (crate-source "async-task" "4.7.1"
                "1pp3avr4ri2nbh7s6y9ws0397nkx1zymmcr14sq761ljarh3axcb"))

(define rust-async-trait-0.1.91
  (crate-source "async-trait" "0.1.91"
                "1v3cm8mzg66037wm392p1vsdx0lq8bid6y2ivr7z03lpfx0xqdmf"))

(define rust-atomic-waker-1.1.2
  (crate-source "atomic-waker" "1.1.2"
                "1h5av1lw56m0jf0fd3bchxq8a30xv0b4wv8s4zkp4s0i7mfvs18m"))

(define rust-base64-0.22.1
  (crate-source "base64" "0.22.1"
                "1imqzgh7bxcikp5vx3shqvw9j09g9ly0xr0jma0q66i52r7jbcvj"))

(define rust-bitcode-0.6.9
  (crate-source "bitcode" "0.6.9"
                "0p84zxgillmn8wv95spzhma67x32jbx00kb0pvkk7hwd9nsx2vha"))

(define rust-bitcode-derive-0.6.9
  (crate-source "bitcode_derive" "0.6.9"
                "1yf7kn7dv08pgz9rxr5xah2birny3kng6q5xk95dmngsgm1912r3"))

(define rust-bitflags-1.3.2
  (crate-source "bitflags" "1.3.2"
                "12ki6w8gn1ldq7yz9y680llwk5gmrhrzszaa17g1sbrw2r2qvwxy"))

(define rust-block-buffer-0.12.1
  (crate-source "block-buffer" "0.12.1"
                "1ak0cvmxz3yifqmzv6aba9606brsz7d5g3piv5xdcvjsx7dwgxnj"))

(define rust-blocking-1.6.2
  (crate-source "blocking" "1.6.2"
                "08bz3f9agqlp3102snkvsll6wc9ag7x5m1xy45ak2rv9pq18sgz8"))

(define rust-bmart-0.2.12
  (crate-source "bmart" "0.2.12"
                "0691rprsgg9z44xi6dqznvx65c6ii0f0r1sw112rkp60nszir4jj"))

(define rust-bmart-derive-0.1.4
  (crate-source "bmart-derive" "0.1.4"
                "0mcqanxpgzbjzcffz7z8k7dksznfjv0kxl9m47x88w5rkbdg9zh3"))

(define rust-bstr-1.13.0
  (crate-source "bstr" "1.13.0"
                "0c6mzdwk0ydxdpfmcgax8sji9bpagvi11lcsap0y3whqsyac0z8z"))

(define rust-bumpalo-3.20.3
  (crate-source "bumpalo" "3.20.3"
                "0jc6va3nwcqikm7chnpdv1s87my3gs2j7g1sc7g3k91brg3arxbj"))

(define rust-bytemuck-1.25.2
  (crate-source "bytemuck" "1.25.2"
                "15rp2m7j7kq22s76cbjwmrkd5r8lvacnm0mnrj013cnzka22x0wm"))

(define rust-bytemuck-derive-1.11.0
  (crate-source "bytemuck_derive" "1.11.0"
                "1r9xdwcdxw385lbflmqlcc2via7hvg7d3zk2ky5mi73bkc2r6mpn"))

(define rust-cargo-util-0.2.30
  (crate-source "cargo-util" "0.2.30"
                "0p6gx5lb78ssqc7xpvmjcl272xb0fm41wxwsi4jxllpnjg926wax"))

(define rust-cfg-aliases-0.2.2
  (crate-source "cfg_aliases" "0.2.2"
                "09rm3dv28gbsal7w6q76lg2nfyn8wp789ska9b8vr1w750xfhygh"))

(define rust-clap-4.6.3
  (crate-source "clap" "4.6.3"
                "0xnp40g68nnzzbsjq4zzskk4kjd58rh7k8dlnygrk04rh5jrbf8g"))

(define rust-clap-builder-4.6.2
  (crate-source "clap_builder" "4.6.2"
                "12sl6fyj6w2djxj0lsc1lkj1h3wpx74fjhb37izvaf65vjpji5ph"))

(define rust-clap-derive-4.6.3
  (crate-source "clap_derive" "4.6.3"
                "0xzhblqgw7xl9xgnlmlqdz5b5cjp5shz6zkj7mx5a5kzmqp3kwij"))

(define rust-clap-lex-1.1.0
  (crate-source "clap_lex" "1.1.0"
                "1ycqkpygnlqnndghhcxjb44lzl0nmgsia64x9581030yifxs7m68"))

(define rust-colorchoice-1.0.5
  (crate-source "colorchoice" "1.0.5"
                "0w75k89hw39p0mnnhlrwr23q50rza1yjki44qvh2mgrnj065a1qx"))

(define rust-colored-1.9.4
  (crate-source "colored" "1.9.4"
                "0mc302pm2x0vpmc3ni35w0666858pmqlqzbipyz42cw2j4f78pss"))

(define rust-concurrent-queue-2.5.0
  (crate-source "concurrent-queue" "2.5.0"
                "0wrr3mzq2ijdkxwndhf79k952cp4zkz35ray8hvsxl96xrx1k82c"))

(define rust-const-oid-0.10.2
  (crate-source "const-oid" "0.10.2"
                "0p7m286mp8aai4sa72g7ji6qm0d4ns8wg4i4b2hj9p9615zm3vx6"))

(define rust-core-foundation-0.10.1
  (crate-source "core-foundation" "0.10.1"
                "1xjns6dqf36rni2x9f47b65grxwdm20kwdg9lhmzdrrkwadcv9mj"))

(define rust-core-foundation-sys-0.8.7
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "core-foundation-sys" "0.8.7"
                "12w8j73lazxmr1z0h98hf3z623kl8ms7g07jch7n4p8f9nwlhdkp"))

(define rust-crc32fast-1.5.0
  (crate-source "crc32fast" "1.5.0"
                "04d51liy8rbssra92p0qnwjw8i9rm9c4m3bwy19wjamz1k4w30cl"))

(define rust-crossbeam-deque-0.8.7
  (crate-source "crossbeam-deque" "0.8.7"
                "1sqcxia1mmz2fw8ba1v72jjrvbkvg7c6sz9l3sl07sv1gggf10ai"))

(define rust-crossbeam-epoch-0.9.20
  (crate-source "crossbeam-epoch" "0.9.20"
                "0gzg0v8in20iajikalg5i5qgpp0m26r426f0fs8nwk953w218s9d"))

(define rust-crossbeam-utils-0.8.22
  (crate-source "crossbeam-utils" "0.8.22"
                "05vwf7pmjq8c8f3fp5qqdm0z3cnk4p62wi8spf0jms5yjnh3v031"))

(define rust-crypto-common-0.2.2
  (crate-source "crypto-common" "0.2.2"
                "0lql5wjlrjkd3r0w32rwbgqfmgg84ms3h65ldnlckmkc3nb4qvnf"))

(define rust-defmt-1.1.1
  (crate-source "defmt" "1.1.1"
                "1lc8xlfj700xqjmvp7n9hhc1czgpaqkq960iqw6d5fwk9zz3p5g2"))

(define rust-defmt-macros-1.1.1
  (crate-source "defmt-macros" "1.1.1"
                "1s2zkcbaj1l306ph1n1gsfm6vzc2sah4acl1qc6pw4x2ghpcgnds"))

(define rust-defmt-parser-1.0.0
  (crate-source "defmt-parser" "1.0.0"
                "0gpfky9sssil5qfaix5wxcwiqk7snszhl5gq3vcwkrxjncs07mhh"))

(define rust-digest-0.11.3
  (crate-source "digest" "0.11.3"
                "1hnmhd4rkybr11292w42pz9ppzx1h49glrhqg107k4s1b2xnvpgi"))

(define rust-dirs-5.0.1
  (crate-source "dirs" "5.0.1"
                "0992xk5vx75b2x91nw9ssb51mpl8x73j9rxmpi96cryn0ffmmi24"))

(define rust-dirs-sys-0.4.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "dirs-sys" "0.4.1"
                "071jy0pvaad9lsa6mzawxrh7cmr7hsmsdxwzm7jzldfkrfjha3sj"))

(define rust-displaydoc-0.2.6
  (crate-source "displaydoc" "0.2.6"
                "0kyxwfbdmagd8afzb2pzja7wj8dhah7smxdsgw00iq8pa2jhmiqs"))

(define rust-drm-0.14.1
  (crate-source "drm" "0.14.1"
                "0vvmj9n0wslrbw3rinpzlfyhwwgr02gqspy1al5gfh99dif8rg40"))

(define rust-drm-ffi-0.9.1
  (crate-source "drm-ffi" "0.9.1"
                "147n13dnkr4kzdj4662dqgbjfvnnw14yhmf2vq2q2kmc6adiraai"))

(define rust-drm-fourcc-2.2.0
  (crate-source "drm-fourcc" "2.2.0"
                "1x76v9a0pkgym4n6cah4barnai9gsssm7gjzxskw2agwibdvrbqa"))

(define rust-drm-sys-0.8.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "drm-sys" "0.8.1"
                "1y59h9x5yn9p36f9bqjvw76kx75yqfin1w6gzigiznb620vf3j7c"))

(define rust-endi-1.1.1
  (crate-source "endi" "1.1.1"
                "16a0076dx41vgrzzimm9clcym77h732czqjiajanmzvd1i1y5dv6"))

(define rust-enumflags2-0.7.12
  (crate-source "enumflags2" "0.7.12"
                "1vzcskg4dca2jiflsfx1p9yw1fvgzcakcs7cpip0agl51ilgf9qh"))

(define rust-enumflags2-derive-0.7.12
  (crate-source "enumflags2_derive" "0.7.12"
                "09rqffacafl1b83ir55hrah9gza0x7pzjn6lr6jm76fzix6qmiv7"))

(define rust-env-filter-2.0.0
  (crate-source "env_filter" "2.0.0"
                "05s267np8pphhpxzrzl4j956gjj87f4ik6yas7l1x6kr0cd2f3ch"))

(define rust-env-logger-0.11.11
  (crate-source "env_logger" "0.11.11"
                "1xnkbhnlwf45a6val2340bi7avi7fwgbm2g2kbf9g9vmgb91nryy"))

(define rust-event-listener-5.4.1
  (crate-source "event-listener" "5.4.1"
                "1asnp3agbr8shcl001yd935m167ammyi8hnvl0q1ycajryn6cfz1"))

(define rust-event-listener-strategy-0.5.4
  (crate-source "event-listener-strategy" "0.5.4"
                "14rv18av8s7n8yixg38bxp5vg2qs394rl1w052by5npzmbgz7scb"))

(define rust-fallible-iterator-0.3.0
  (crate-source "fallible-iterator" "0.3.0"
                "0ja6l56yka5vn4y4pk6hn88z0bpny7a8k1919aqjzp0j1yhy9k1a"))

(define rust-fallible-streaming-iterator-0.1.9
  (crate-source "fallible-streaming-iterator" "0.1.9"
                "0nj6j26p71bjy8h42x6jahx1hn0ng6mc2miwpgwnp8vnwqf4jq3k"))

(define rust-filetime-0.2.29
  (crate-source "filetime" "0.2.29"
                "0napyyfccb26r7fyh9hg7ixrh4vph9h7y7k4iv1j19phqwrpla2w"))

(define rust-flate2-1.1.9
  (crate-source "flate2" "1.1.9"
                "0g2pb7cxnzcbzrj8bw4v6gpqqp21aycmf6d84rzb6j748qkvlgw4"))

(define rust-fluent-0.17.0
  (crate-source "fluent" "0.17.0"
                "0xq4cxw4mkdh1k9i5w850sky0m41la8sm6nbpw76n3f5lbascdw1"))

(define rust-fluent-bundle-0.16.0
  (crate-source "fluent-bundle" "0.16.0"
                "1x1v8bmym6x9pl87f82lbzwlc84kdn0lgcwi73ki2mwgj6w3q801"))

(define rust-fluent-langneg-0.13.1
  (crate-source "fluent-langneg" "0.13.1"
                "1c78jl8lpwg5hdg589qbn3m9ls6mzqxnyrvi5llfibhb8mcvxsvy"))

(define rust-fluent-syntax-0.12.0
  (crate-source "fluent-syntax" "0.12.0"
                "1661sp6kl268n445x7jjhnbkgiaa1xcpyryq0i6iiz9zqn3x5w2l"))

(define rust-foldhash-0.2.0
  (crate-source "foldhash" "0.2.0"
                "1nvgylb099s11xpfm1kn2wcsql080nqmnhj1l25bp3r2b35j9kkp"))

(define rust-freedesktop-icons-0.4.0
  (crate-source "freedesktop-icons" "0.4.0"
                "150902dh53lc6mdagvh7k34151777v718h7pnfir54khx9j77y4m"))

(define rust-futures-0.3.33
  (crate-source "futures" "0.3.33"
                "066j5aqz8an05xh4hn5ljdnjn80z3g335v4grx4gaifr57wg3358"))

(define rust-futures-lite-2.6.1
  (crate-source "futures-lite" "2.6.1"
                "1ba4dg26sc168vf60b1a23dv1d8rcf3v3ykz2psb7q70kxh113pp"))

(define rust-futures-sink-0.3.33
  (crate-source "futures-sink" "0.3.33"
                "01z38z344hpryw84b6r0rbwcb669d8pyvl2szg10aqwx96n1hi73"))

(define rust-gbm-0.18.0
  (crate-source "gbm" "0.18.0"
                "0skyaj51xlazaa24jdkxxi2g6pnw834k3yqlf2ly999wincjx1ff"))

(define rust-gbm-sys-0.4.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gbm-sys" "0.4.0"
                "0vzp28ip4w74p05ygs4p9m7sspggn2zvcykbpyv8ypbqrhm5yfn1"))

(define rust-glam-0.33.2
  (crate-source "glam" "0.33.2"
                "0djllzkn0y5d9kgrjs3xdhmgr8vzdiqf69471nz0icv5y0ign8kz"))

(define rust-glob-0.3.3
  (crate-source "glob" "0.3.3"
                "106jpd3syfzjfj2k70mwm0v436qbx96wig98m4q8x071yrq35hhc"))

(define rust-globset-0.4.19
  (crate-source "globset" "0.4.19"
                "1k89ff27dk6x3386nsavqflpdf723c3vf2mnhi42ar24mv93fzg4"))

(define rust-hashbrown-0.16.1
  (crate-source "hashbrown" "0.16.1"
                "004i3njw38ji3bzdp9z178ba9x3k0c1pgy8x69pj7yfppv4iq7c4"))

(define rust-hashlink-0.12.1
  (crate-source "hashlink" "0.12.1"
                "0j52mgsswr1zy5mw0awzjs2vn17q7cwy6rdbgsk8zqw1pfbrs1ij"))

(define rust-hermit-abi-0.5.2
  (crate-source "hermit-abi" "0.5.2"
                "1744vaqkczpwncfy960j2hxrbjl1q01csm84jpd9dajbdr2yy3zw"))

(define rust-hex-0.4.3
  (crate-source "hex" "0.4.3"
                "0w1a4davm1lgzpamwnba907aysmlrnygbqmfis2mqjx5m552a93z"))

(define rust-http-1.4.2
  (crate-source "http" "1.4.2"
                "09b4p8fiivkg7wm0b59fyrn1jkm7px298ci7zb9igz6n647gaw39"))

(define rust-httparse-1.10.1
  (crate-source "httparse" "1.10.1"
                "11ycd554bw2dkgw0q61xsa7a4jn1wb1xbfacmf3dbwsikvkkvgvd"))

(define rust-hybrid-array-0.4.13
  (crate-source "hybrid-array" "0.4.13"
                "133c3dg885v2i2xllzq42cjg93z7zdmajz431zjys7rc2g2md0w1"))

(define rust-ignore-0.4.31
  (crate-source "ignore" "0.4.31"
                "10sgi3sggi8jqiy2f45bcxvda2sd1m4cxjlirp8a35g62617p2kz"))

(define rust-ini-core-0.2.0
  (crate-source "ini_core" "0.2.0"
                "0q9sqxz6bjdml84mlgbh4izzbgrp8l41g7595wkbafglm4qpliks"))

(define rust-intl-memoizer-0.5.3
  (crate-source "intl-memoizer" "0.5.3"
                "0gqn5wwhzacvj0z25r5r3l2pajg9c8i1ivh7g8g8dszm8pis439i"))

(define rust-intl-pluralrules-7.0.2
  (crate-source "intl_pluralrules" "7.0.2"
                "0wprd3h6h8nfj62d8xk71h178q7zfn3srxm787w4sawsqavsg3h7"))

(define rust-is-terminal-0.4.17
  (crate-source "is-terminal" "0.4.17"
                "0ilfr9n31m0k6fsm3gvfrqaa62kbzkjqpwcd9mc46klfig1w2h1n"))

(define rust-is-terminal-polyfill-1.70.2
  (crate-source "is_terminal_polyfill" "1.70.2"
                "15anlc47sbz0jfs9q8fhwf0h3vs2w4imc030shdnq54sny5i7jx6"))

(define rust-itoa-1.0.18
  (crate-source "itoa" "1.0.18"
                "10jnd1vpfkb8kj38rlkn2a6k02afvj3qmw054dfpzagrpl6achlg"))

(define rust-jiff-0.2.34
  (crate-source "jiff" "0.2.34"
                "05kfvhd4rp0a44qipkzlag547j5s3zxs46ql1pibf3mq8yax1171"))

(define rust-jiff-core-0.1.0
  (crate-source "jiff-core" "0.1.0"
                "02axx56pkh2w4bw5rp94qlvcpwzd3n2w2025fnikvrgg762aiv3z"))

(define rust-jiff-static-0.2.34
  (crate-source "jiff-static" "0.2.34"
                "1pp9w3jn2l3zkqn35j3mfgzl4xwh9ddb0z37vhagkym6nxva0g9j"))

(define rust-jobserver-0.1.35
  (crate-source "jobserver" "0.1.35"
                "1crwgbb0wjph42ni4hqryjxlv4vlr0hyk81g76id9fpa56ysq00w"))

(define rust-js-sys-0.3.103
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "js-sys" "0.3.103"
                "00lib0b6hqmw56r2hjp7xrv730qacslirbkdlhvmi39zvgy4pd2k"))

(define rust-khronos-egl-6.0.0
  (crate-source "khronos-egl" "6.0.0"
                "0xnzdx0n1bil06xmh8i1x6dbxvk7kd2m70bbm6nw1qzc43r1vbka"))

(define rust-libloading-0.8.9
  (crate-source "libloading" "0.8.9"
                "0mfwxwjwi2cf0plxcd685yxzavlslz7xirss3b9cbrzyk4hv1i6p"))

(define rust-libredox-0.1.18
  (crate-source "libredox" "0.1.18"
                "0lj6dqz0pzwm32zqss320bhjryg7vymkxa575pzhc7ig6jg2ahy9"))

(define rust-libsqlite3-sys-0.38.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libsqlite3-sys" "0.38.1"
                "1nv1g8ws2qm4j24xa5q5a9yg9qxk7p0skdkikllsq8aw8c2rmhgn"))

(define rust-linux-raw-sys-0.4.15
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "linux-raw-sys" "0.4.15"
                "1aq7r2g7786hyxhv40spzf2nhag5xbw2axxc1k8z5k1dsgdm4v6j"))

(define rust-linux-raw-sys-0.9.4
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "linux-raw-sys" "0.9.4"
                "04kyjdrq79lz9ibrf7czk6cv9d3jl597pb9738vzbsbzy1j5i56d"))

(define rust-lock-api-0.4.14
  (crate-source "lock_api" "0.4.14"
                "0rg9mhx7vdpajfxvdjmgmlyrn20ligzqvn8ifmaz7dc79gkrjhr2"))

(define rust-matchers-0.2.0
  (crate-source "matchers" "0.2.0"
                "1sasssspdj2vwcwmbq3ra18d3qniapkimfcbr47zmx6750m5llni"))

(define rust-memoffset-0.6.5
  (crate-source "memoffset" "0.6.5"
                "1kkrzll58a3ayn5zdyy9i1f1v3mx0xgl29x0chq614zazba638ss"))

(define rust-miniz-oxide-0.8.9
  (crate-source "miniz_oxide" "0.8.9"
                "05k3pdg8bjjzayq3rf0qhpirq9k37pxnasfn4arbs17phqn6m9qz"))

(define rust-mio-1.2.2
  (crate-source "mio" "1.2.2"
                "09y4b7gc42ymgssshh8sz6gs3y5r8bbigqaw2c4snh6fy5qmrmih"))

(define rust-miow-0.6.1
  (crate-source "miow" "0.6.1"
                "023g6jamln6hmspcllgrm99ri38ypbm8w945jh36579hgb9zlssk"))

(define rust-nix-0.22.3
  (crate-source "nix" "0.22.3"
                "1bsgc8vjq07a1wg9vz819bva3dvn58an4r87h80dxrfqkqanz4g4"))

(define rust-nix-0.31.3
  (crate-source "nix" "0.31.3"
                "0gbwnjfny9rq9hl5bz4ry520n9rnfknna4bg88n66f7zx3yx486g"))

(define rust-ntapi-0.4.3
  (crate-source "ntapi" "0.4.3"
                "1bl0d73avwla7laa4pkqvzvifjbs0avg65w01zxjydgx3likbcy3"))

(define rust-nu-ansi-term-0.50.3
  (crate-source "nu-ansi-term" "0.50.3"
                "1ra088d885lbd21q1bxgpqdlk1zlndblmarn948jz2a40xsbjmvr"))

(define rust-objc2-core-foundation-0.3.2
  (crate-source "objc2-core-foundation" "0.3.2"
                "0dnmg7606n4zifyjw4ff554xvjmi256cs8fpgpdmr91gckc0s61a"))

(define rust-objc2-io-kit-0.3.2
  (crate-source "objc2-io-kit" "0.3.2"
                "05dvfcf97w39daaj5qsbfc399lw9hbx3s4h9nwgxrmlpjnizpyik"))

(define rust-once-cell-polyfill-1.70.2
  (crate-source "once_cell_polyfill" "1.70.2"
                "1zmla628f0sk3fhjdjqzgxhalr2xrfna958s632z65bjsfv8ljrq"))

(define rust-option-ext-0.2.0
  (crate-source "option-ext" "0.2.0"
                "0zbf7cx8ib99frnlanpyikm1bx8qn8x602sw1n7bg6p9x94lyx04"))

(define rust-ordered-stream-0.2.0
  (crate-source "ordered-stream" "0.2.0"
                "0l0xxp697q7wiix1gnfn66xsss7fdhfivl2k7bvpjs4i3lgb18ls"))

(define rust-os-display-0.1.4
  (crate-source "os_display" "0.1.4"
                "13x07viih4f7l5cicbqw9xv378h0a096vphdclcbjvq2g4dxfpxd"))

(define rust-parking-2.2.1
  (crate-source "parking" "2.2.1"
                "1fnfgmzkfpjd69v4j9x737b1k8pnn054bvzcn5dm3pkgq595d3gk"))

(define rust-parking-lot-0.12.5
  (crate-source "parking_lot" "0.12.5"
                "06jsqh9aqmc94j2rlm8gpccilqm6bskbd67zf6ypfc0f4m9p91ck"))

(define rust-parking-lot-core-0.9.12
  (crate-source "parking_lot_core" "0.9.12"
                "1hb4rggy70fwa1w9nb0svbyflzdc69h047482v2z3sx2hmcnh896"))

(define rust-percent-encoding-2.3.2
  (crate-source "percent-encoding" "2.3.2"
                "083jv1ai930azvawz2khv7w73xh8mnylk7i578cifndjn5y64kwv"))

(define rust-phf-0.14.0
  (crate-source "phf" "0.14.0"
                "1xm2nbg5c59b5wvvv4v3sd3sknrlg2z17bkzk440p2090dw7h0q1"))

(define rust-phf-generator-0.14.0
  (crate-source "phf_generator" "0.14.0"
                "003i8qw6ghkcvs6bmxdhnq1a1kmpwbciakazjsybx8fmb44jxdmf"))

(define rust-phf-macros-0.14.0
  (crate-source "phf_macros" "0.14.0"
                "11g0wm4xric3nf9b9czpign7svk94ik0qq6s61vd496l4v5d1a2z"))

(define rust-phf-shared-0.14.0
  (crate-source "phf_shared" "0.14.0"
                "12dalcsaq83pfydhq81195aal0ld9vdx3swz6kk9ncfrw8kr1zf6"))

(define rust-piper-0.2.5
  (crate-source "piper" "0.2.5"
                "1hd3j94mw5dwc457gs9ssb2r5b9iipywndf5srqx7pj38jd4fdf8"))

(define rust-polling-3.11.0
  (crate-source "polling" "3.11.0"
                "0622qfbxi3gb0ly2c99n3xawp878fkrd1sl83hjdhisx11cly3jx"))

(define rust-portable-atomic-1.14.0
  (crate-source "portable-atomic" "1.14.0"
                "1hyfma9n2cs2ibazpfwrbv61zwg7cv86g0pr5yjkg07qgr4xa81x"))

(define rust-portable-atomic-util-0.2.7
  (crate-source "portable-atomic-util" "0.2.7"
                "0616j0fhy6y71hyxg3n86f6hng0fmsc269s3wp4gl8ww4p8hd8f2"))

(define rust-rayon-1.12.0
  (crate-source "rayon" "1.12.0"
                "0vcj63xgnk72c30vdrak7dhl53snnaqv9x2faf1d94hzg1kb2fgv"))

(define rust-rayon-core-1.13.0
  (crate-source "rayon-core" "1.13.0"
                "14dbr0sq83a6lf1rfjq5xdpk5r6zgzvmzs5j6110vlv2007qpq92"))

(define rust-redox-syscall-0.5.18
  (crate-source "redox_syscall" "0.5.18"
                "0b9n38zsxylql36vybw18if68yc9jczxmbyzdwyhb9sifmag4azd"))

(define rust-redox-users-0.4.6
  (crate-source "redox_users" "0.4.6"
                "0hya2cxx6hxmjfxzv9n8rjl5igpychav7zfi1f81pz6i4krry05s"))

(define rust-ring-0.17.14
  (crate-source "ring" "0.17.14"
                "1dw32gv19ccq4hsx3ribhpdzri1vnrlcfqb2vj41xn4l49n9ws54"))

(define rust-rsqlite-vfs-0.1.1
  (crate-source "rsqlite-vfs" "0.1.1"
                "0b0rrh8qpi0gx5whhr9w7b7yqdrwz8hwdx9x211blzwavzj9l765"))

(define rust-rusqlite-0.40.1
  (crate-source "rusqlite" "0.40.1"
                "08rkljp4mg4ng2y0g1175v7ji548bvnx2cvc8jv0jccyn4886hqi"))

(define rust-rustc-hash-2.1.3
  (crate-source "rustc-hash" "2.1.3"
                "0bbla578m87qmf3yr55q49l97gxn7z0ha1dwqlnvwwc58ad7y7kb"))

(define rust-rustix-0.38.44
  (crate-source "rustix" "0.38.44"
                "0m61v0h15lf5rrnbjhcb9306bgqrhskrqv7i1n0939dsw8dbrdgx"))

(define rust-rustix-openpty-0.2.0
  (crate-source "rustix-openpty" "0.2.0"
                "14r3bvc2rcvvpdmhjivl6bqifdcl23f8bw9ncc58faw9b5y6rq8x"))

(define rust-rustls-0.23.42
  (crate-source "rustls" "0.23.42"
                "0f619dq1izpl40glcqgfjbqzpmwg8g5iffjx4429sh4v06mzqm1w"))

(define rust-rustls-pki-types-1.15.0
  (crate-source "rustls-pki-types" "1.15.0"
                "0imhb5d0m4hinavcgqxzmqpb55zjahv19g0lxrkh167k9ai9jj3n"))

(define rust-rustls-webpki-0.103.13
  (crate-source "rustls-webpki" "0.103.13"
                "0vkm7z9pnxz5qz66p2kmyy2pwx0g4jnsbqk5xzfhs4czcjl2ki31"))

(define rust-rustversion-1.0.23
  (crate-source "rustversion" "1.0.23"
                "07z2a843fs80fawwflj9jwn49k9b0bd0dhhbvy0ar69vaxd72m6g"))

(define rust-same-file-1.0.6
  (crate-source "same-file" "1.0.6"
                "00h5j1w87dmhnvbv9l8bic3y7xxsnjmssvifw2ayvgx9mb1ivz4k"))

(define rust-scopeguard-1.2.0
  (crate-source "scopeguard" "1.2.0"
                "0jcz9sd47zlsgcnm1hdw0664krxwb5gczlif4qngj2aif8vky54l"))

(define rust-self-cell-1.3.0
  (crate-source "self_cell" "1.3.0"
                "04x883z7awzkmn5lqb67n51xynrj2pa9339jgq4j1qa94yh2rd1a"))

(define rust-serde-json-1.0.151
  (crate-source "serde_json" "1.0.151"
                "051zww7lvpw147vvwss1ng6w587qyrkzg75fvj08q2dfrmgbahf8"))

(define rust-serde-repr-0.1.21
  (crate-source "serde_repr" "0.1.21"
                "01l987ghc17h1y9cf9xbzmcs77575mbrjf4ca2h70g15vqlicfwd"))

(define rust-sha2-0.11.0
  (crate-source "sha2" "0.11.0"
                "1x15x22c5yf54ac0np5bfqnq5x0hdw4wqzpi48zwn94ma0bsfss4"))

(define rust-sharded-slab-0.1.7
  (crate-source "sharded-slab" "0.1.7"
                "1xipjr4nqsgw34k7a2cgj9zaasl2ds6jwn89886kww93d32a637l"))

(define rust-shell-escape-0.1.5
  (crate-source "shell-escape" "0.1.5"
                "0kqq83dk0r1fqj4cfzddpxrni2hpz5i1y607g366c4m9iyhngfs5"))

(define rust-signal-hook-0.4.4
  (crate-source "signal-hook" "0.4.4"
                "0gdm8kmi1mcd30gkxcwagxiqiasq0fhdlvrfsnybv3chln6c585j"))

(define rust-signal-hook-registry-1.4.8
  (crate-source "signal-hook-registry" "1.4.8"
                "06vc7pmnki6lmxar3z31gkyg9cw7py5x9g7px70gy2hil75nkny4"))

(define rust-simd-adler32-0.3.10
  (crate-source "simd-adler32" "0.3.10"
                "1sny4y2qa5mwyxx5x59ln2p02vsdh92004njlslnx98imjc9489s"))

(define rust-siphasher-1.0.3
  (crate-source "siphasher" "1.0.3"
                "0jg6l9xyzca5vy4h6gf8r6p4kk84g98fk95pzig1kq6cr4z8grcf"))

(define rust-socket2-0.6.5
  (crate-source "socket2" "0.6.5"
                "1m7diygswpvlpvrxd6ap169nxgax014jr8220nqlr3bzyb3y5lf3"))

(define rust-sqlite-wasm-rs-0.5.5
  (crate-source "sqlite-wasm-rs" "0.5.5"
                "0xax662vn9vi9zmnrwqbbmjbjylczaxkn1fhrvhxfd96m06zqgnw"))

(define rust-strsim-0.11.1
  (crate-source "strsim" "0.11.1"
                "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x"))

(define rust-subtle-2.6.1
  (crate-source "subtle" "2.6.1"
                "14ijxaymghbl1p0wql9cib5zlwiina7kall6w7g89csprkgbvhhk"))

(define rust-syn-1.0.109
  (crate-source "syn" "1.0.109"
                "0ds2if4600bd59wsv7jjgfkayfzy3hnazs394kz6zdkmna8l3dkj"))

(define rust-sysinfo-0.29.11
  (crate-source "sysinfo" "0.29.11"
                "0rp6911qqjppvvbh72j27znscrawfvplqlyrj9n0y1n24g27ywnd"))

(define rust-sysinfo-0.37.2
  (crate-source "sysinfo" "0.37.2"
                "07xizvikp5j2f6jky0j4vlaxp21djznzja1m0z70f77xmxf7sq0n"))

(define rust-tar-0.4.46
  (crate-source "tar" "0.4.46"
                "0h68bc0y1nma3h2ypj28vxc84msjydlrj8rviqwphg00lvcj2qiz"))

(define rust-terminal-size-0.4.4
  (crate-source "terminal_size" "0.4.4"
                "0x4839vhhpzacc42rqj2wjhivlhlggzz3890b0c5pmyb3j11n2i3"))

(define rust-test-log-0.2.21
  (crate-source "test-log" "0.2.21"
                "1wa0xspccq5qdgf1831zj8nk2fn5dxpsn0w3ns4mqar4hj1j374v"))

(define rust-test-log-core-0.2.21
  (crate-source "test-log-core" "0.2.21"
                "0yzj2fgz58lylslmi8r1kyr5nfhbg76v7pd8yrcjwf2d1sqghvn2"))

(define rust-test-log-macros-0.2.21
  (crate-source "test-log-macros" "0.2.21"
                "13dcgnvrgcjwvq7jmp1y9cmshk4y0zmwwsy5hakflwdvvj5d6jll"))

(define rust-thiserror-1.0.69
  (crate-source "thiserror" "1.0.69"
                "0lizjay08agcr5hs9yfzzj6axs53a2rgx070a1dsi3jpkcrzbamn"))

(define rust-thiserror-impl-1.0.69
  (crate-source "thiserror-impl" "1.0.69"
                "1h84fmn2nai41cxbhk6pqf46bxqq1b344v8yz089w1chzi76rvjg"))

(define rust-thread-local-1.1.10
  (crate-source "thread_local" "1.1.10"
                "0w20g2pfdcp8pz3gds0bzksv6mxk802szca8qlr3701jdm69rn8s"))

(define rust-tinystr-0.8.3
  (crate-source "tinystr" "0.8.3"
                "0vfr8x285w6zsqhna0a9jyhylwiafb2kc8pj2qaqaahw48236cn8"))

(define rust-tokio-1.53.1
  (crate-source "tokio" "1.53.1"
                "1v8b3b45pkpbibls75yniqbvx5dlks2708141ljni5mnf6lawb10"))

(define rust-tokio-macros-2.7.1
  (crate-source "tokio-macros" "2.7.1"
                "1fj2h3gysqzwqchyhcyyvslwdj7qjgyzlc20d6sajwqf949sya33"))

(define rust-tracing-0.1.44
  (crate-source "tracing" "0.1.44"
                "006ilqkg1lmfdh3xhg3z762izfwmxcvz0w7m4qx2qajbz9i1drv3"))

(define rust-tracing-attributes-0.1.31
  (crate-source "tracing-attributes" "0.1.31"
                "1np8d77shfvz0n7camx2bsf1qw0zg331lra0hxb4cdwnxjjwz43l"))

(define rust-tracing-core-0.1.36
  (crate-source "tracing-core" "0.1.36"
                "16mpbz6p8vd6j7sf925k9k8wzvm9vdfsjbynbmaxxyq6v7wwm5yv"))

(define rust-tracing-log-0.2.0
  (crate-source "tracing-log" "0.2.0"
                "1hs77z026k730ij1a9dhahzrl0s073gfa2hm5p0fbl0b80gmz1gf"))

(define rust-tracing-subscriber-0.3.23
  (crate-source "tracing-subscriber" "0.3.23"
                "06fkr0qhggvrs861d7f74pn3i3a10h5jsp4n70jj9ys5b675fzyb"))

(define rust-triggered-0.1.3
  (crate-source "triggered" "0.1.3"
                "0hxb10p6i5i7iy43053lfqbrssrpzrjw1j22x6cy1wqiiaydsgjr"))

(define rust-trim-in-place-0.1.7
  (crate-source "trim-in-place" "0.1.7"
                "1z04g79xkrpf3h4g3cc8wax72dn6h6v9l4m39zg8rg39qrpr4gil"))

(define rust-type-map-0.5.1
  (crate-source "type-map" "0.5.1"
                "143v32wwgpymxfy4y8s694vyq0wdi7li4s5dmms5w59nj2yxnc6b"))

(define rust-typenum-1.20.1
  (crate-source "typenum" "1.20.1"
                "086s9ly0906kw5yw41249fba97w5zfxf03pyfwdkffvcprqfixdn"))

(define rust-udisks2-0.3.1
  (crate-source "udisks2" "0.3.1"
                "0806526d814rz3bwnjgdry0acgxm8hm9yvjp4nb8rx4x3d3x06ff"))

(define rust-uds-windows-1.2.1
  (crate-source "uds_windows" "1.2.1"
                "0vidqwwfgn8wyzvbxiqil787b4wyqjia50zpdbbjqx7n8wlgpxpj"))

(define rust-unic-langid-0.9.6
  (crate-source "unic-langid" "0.9.6"
                "01bx59sqsx2jz4z7ppxq9kldcjq9dzadkmb2dr7iyc85kcnab2x2"))

(define rust-unic-langid-impl-0.9.6
  (crate-source "unic-langid-impl" "0.9.6"
                "0n66kdan4cz99n8ra18i27f7w136hmppi4wc0aa7ljsd0h4bzqfw"))

(define rust-unicode-width-0.2.2
  (crate-source "unicode-width" "0.2.2"
                "0m7jjzlcccw716dy9423xxh0clys8pfpllc5smvfxrzdf66h9b5l"))

(define rust-untrusted-0.9.0
  (crate-source "untrusted" "0.9.0"
                "1ha7ib98vkc538x0z60gfn0fc5whqdd85mb87dvisdcaifi6vjwf"))

(define rust-upower-dbus-0.3.2.87c3c35
  ;; TODO REVIEW: Define standalone package if this is a workspace.
  (origin
    (method git-fetch)
    (uri (git-reference
          (url "https://github.com/pop-os/dbus-settings-bindings.git")
          (commit "87c3c35666b926a24a1e8045fd70be2db1145e34")))
    (file-name (git-file-name "rust-upower-dbus" "0.3.2.87c3c35"))
    (sha256 (base32 "0650xbdl2gi4lf9ynw3iafi62v8z06c8j2vs9hny374hfhplh9fp"))))

(define rust-ureq-3.3.0
  (crate-source "ureq" "3.3.0"
                "1h6gmx5kbafh4vn1dbypc01m5gy9imja2n0vxd74v1nmvjf119yy"))

(define rust-ureq-proto-0.6.0
  (crate-source "ureq-proto" "0.6.0"
                "1340ga8p9qi70c0vdrwg21h1fp4ai7pvfy18z461n6xxn22bm579"))

(define rust-utf8-zero-0.8.1
  (crate-source "utf8-zero" "0.8.1"
                "0vjsmwd1k2wwlsn1phi7mrcjxn4bv8fzk24caxyaw2slr51s1h5q"))

(define rust-utf8parse-0.2.2
  (crate-source "utf8parse" "0.2.2"
                "088807qwjq46azicqwbhlmzwrbkz7l4hpw43sdkdyyk524vdxaq6"))

(define rust-uucore-0.9.0
  (crate-source "uucore" "0.9.0"
                "1hhxb83zyli08ymkhza0krm25gwd25c0ym4zb3hi3xi7ghhk96q6"))

(define rust-uucore-procs-0.9.0
  (crate-source "uucore_procs" "0.9.0"
                "0l0k430qyia56svp8r5kdwszw62h7gxllycv33vzzaz726i7scrl"))

(define rust-uuid-0.8.2
  (crate-source "uuid" "0.8.2"
                "1dy4ldcp7rnzjy56dxh7d2sgrcvn4q77y0a8r0a48946h66zjp5w"))

(define rust-uuid-1.24.0
  (crate-source "uuid" "1.24.0"
                "0faj5x0zgri8m3i8dv9qgyhiwqwdyhbl2g351cp3iin4ynk26fdz"))

(define rust-valuable-0.1.1
  (crate-source "valuable" "0.1.1"
                "0r9srp55v7g27s5bg7a2m095fzckrcdca5maih6dy9bay6fflwxs"))

(define rust-vcpkg-0.2.15
  (crate-source "vcpkg" "0.2.15"
                "09i4nf5y8lig6xgj3f7fyrvzd3nlaw4znrihw8psidvv5yk4xkdc"))

(define rust-version-check-0.9.5
  (crate-source "version_check" "0.9.5"
                "0nhhi4i5x89gm911azqbn7avs9mdacw2i3vcz3cnmz3mv4rqz4hb"))

(define rust-virtual-terminal-0.1.5
  (crate-source "virtual-terminal" "0.1.5"
                "0v4xyz0w7gdkhyjhl0rwxfy4xkcjlk16bmq5xb2c42pcqj7jr8q5"))

(define rust-vt100-0.16.2
  (crate-source "vt100" "0.16.2"
                "1nbgsgamgibyx6y4xiyk6nkz7zggzbs6s445wq4yd0zsp1gzfkq5"))

(define rust-vte-0.15.0
  (crate-source "vte" "0.15.0"
                "1g9xgnw7q7zdwgfqa6zfcfsp92wn0j0h13kzsqy0dq3c80c414m5"))

(define rust-walkdir-2.5.0
  (crate-source "walkdir" "2.5.0"
                "0jsy7a710qv8gld5957ybrnc07gavppp963gs32xk4ag8130jy99"))

(define rust-wasm-bindgen-0.2.126
  (crate-source "wasm-bindgen" "0.2.126"
                "197rma4qg1kb8l4bl7857pgszzval8s1w740g9myyjh92467q1jb"))

(define rust-wasm-bindgen-macro-0.2.126
  (crate-source "wasm-bindgen-macro" "0.2.126"
                "1cda6wl5zyiy7777cfgrix7fhpaqba55l5zpqj4zig7ng7jyaz0n"))

(define rust-wasm-bindgen-macro-support-0.2.126
  (crate-source "wasm-bindgen-macro-support" "0.2.126"
                "03iq412frl2py55skwb3ya08xha0cf6q22zr5kqlwbr675w7r6gk"))

(define rust-wasm-bindgen-shared-0.2.126
  (crate-source "wasm-bindgen-shared" "0.2.126"
                "097a3kbjls447s1lwr41l21x5crrh5vq3h6zsxccz7slrjq4q6yw"))

(define rust-webpki-roots-1.0.9
  (crate-source "webpki-roots" "1.0.9"
                "0apja04243wz3vi26pqjg4sq8cqaac66prj490sgb1crlc4rvkbx"))

(define rust-which-8.0.5
  (crate-source "which" "8.0.5"
                "0g7lkzgs7sdkc8fbv2dprrhl7wl05r3z3hkm7361p4ab2a2gaglg"))

(define rust-wild-2.2.1
  (crate-source "wild" "2.2.1"
                "1q8hnhmv3fvgx0j7bv8qig00599a15mfsdhgx3hq2ljpiky1l4x3"))

(define rust-winapi-util-0.1.11
  (crate-source "winapi-util" "0.1.11"
                "08hdl7mkll7pz8whg869h58c1r9y7in0w0pk8fm24qc77k0b39y2"))

(define rust-windows-0.61.3
  (crate-source "windows" "0.61.3"
                "14v8dln7i4ccskd8danzri22bkjkbmgzh284j3vaxhd4cykx7awv"))

(define rust-windows-collections-0.2.0
  (crate-source "windows-collections" "0.2.0"
                "1s65anr609qvsjga7w971p6iq964h87670dkfqfypnfgwnswxviv"))

(define rust-windows-core-0.61.2
  (crate-source "windows-core" "0.61.2"
                "1qsa3iw14wk4ngfl7ipcvdf9xyq456ms7cx2i9iwf406p7fx7zf0"))

(define rust-windows-future-0.2.1
  (crate-source "windows-future" "0.2.1"
                "13mdzcdn51ckpzp3frb8glnmkyjr1c30ym9wnzj9zc97hkll2spw"))

(define rust-windows-implement-0.60.2
  (crate-source "windows-implement" "0.60.2"
                "1psxhmklzcf3wjs4b8qb42qb6znvc142cb5pa74rsyxm1822wgh5"))

(define rust-windows-interface-0.59.3
  (crate-source "windows-interface" "0.59.3"
                "0n73cwrn4247d0axrk7gjp08p34x1723483jxjxjdfkh4m56qc9z"))

(define rust-windows-link-0.1.3
  (crate-source "windows-link" "0.1.3"
                "12kr1p46dbhpijr4zbwr2spfgq8i8c5x55mvvfmyl96m01cx4sjy"))

(define rust-windows-numerics-0.2.0
  (crate-source "windows-numerics" "0.2.0"
                "1cf2j8nbqf0hqqa7chnyid91wxsl2m131kn0vl3mqk3c0rlayl4i"))

(define rust-windows-result-0.3.4
  (crate-source "windows-result" "0.3.4"
                "1il60l6idrc6hqsij0cal0mgva6n3w6gq4ziban8wv6c6b9jpx2n"))

(define rust-windows-strings-0.4.2
  (crate-source "windows-strings" "0.4.2"
                "0mrv3plibkla4v5kaakc2rfksdd0b14plcmidhbkcfqc78zwkrjn"))

(define rust-windows-sys-0.48.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.48.0"
                "1aan23v5gs7gya1lc46hqn9mdh8yph3fhxmhxlw36pn6pqc28zb7"))

(define rust-windows-sys-0.52.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.52.0"
                "0gd3v4ji88490zgb6b5mq5zgbvwv7zx1ibn8v3x83rwcdbryaar8"))

(define rust-windows-sys-0.59.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.59.0"
                "0fw5672ziw8b3zpmnbp9pdv1famk74f1l9fcbc3zsrzdg56vqf0y"))

(define rust-windows-targets-0.48.5
  (crate-source "windows-targets" "0.48.5"
                "034ljxqshifs1lan89xwpcy1hp0lhdh4b5n0d2z4fwjx2piacbws"))

(define rust-windows-targets-0.52.6
  (crate-source "windows-targets" "0.52.6"
                "0wwrx625nwlfp7k93r2rra568gad1mwd888h1jwnl0vfg5r4ywlv"))

(define rust-windows-threading-0.1.0
  (crate-source "windows-threading" "0.1.0"
                "19jpn37zpjj2q7pn07dpq0ay300w65qx7wdp13wbp8qf5snn6r5n"))

(define rust-windows-aarch64-gnullvm-0.48.5
  (crate-source "windows_aarch64_gnullvm" "0.48.5"
                "1n05v7qblg1ci3i567inc7xrkmywczxrs1z3lj3rkkxw18py6f1b"))

(define rust-windows-aarch64-gnullvm-0.52.6
  (crate-source "windows_aarch64_gnullvm" "0.52.6"
                "1lrcq38cr2arvmz19v32qaggvj8bh1640mdm9c2fr877h0hn591j"))

(define rust-windows-aarch64-msvc-0.48.5
  (crate-source "windows_aarch64_msvc" "0.48.5"
                "1g5l4ry968p73g6bg6jgyvy9lb8fyhcs54067yzxpcpkf44k2dfw"))

(define rust-windows-aarch64-msvc-0.52.6
  (crate-source "windows_aarch64_msvc" "0.52.6"
                "0sfl0nysnz32yyfh773hpi49b1q700ah6y7sacmjbqjjn5xjmv09"))

(define rust-windows-i686-gnu-0.48.5
  (crate-source "windows_i686_gnu" "0.48.5"
                "0gklnglwd9ilqx7ac3cn8hbhkraqisd0n83jxzf9837nvvkiand7"))

(define rust-windows-i686-gnu-0.52.6
  (crate-source "windows_i686_gnu" "0.52.6"
                "02zspglbykh1jh9pi7gn8g1f97jh1rrccni9ivmrfbl0mgamm6wf"))

(define rust-windows-i686-gnullvm-0.52.6
  (crate-source "windows_i686_gnullvm" "0.52.6"
                "0rpdx1537mw6slcpqa0rm3qixmsb79nbhqy5fsm3q2q9ik9m5vhf"))

(define rust-windows-i686-msvc-0.48.5
  (crate-source "windows_i686_msvc" "0.48.5"
                "01m4rik437dl9rdf0ndnm2syh10hizvq0dajdkv2fjqcywrw4mcg"))

(define rust-windows-i686-msvc-0.52.6
  (crate-source "windows_i686_msvc" "0.52.6"
                "0rkcqmp4zzmfvrrrx01260q3xkpzi6fzi2x2pgdcdry50ny4h294"))

(define rust-windows-x86-64-gnu-0.48.5
  (crate-source "windows_x86_64_gnu" "0.48.5"
                "13kiqqcvz2vnyxzydjh73hwgigsdr2z1xpzx313kxll34nyhmm2k"))

(define rust-windows-x86-64-gnu-0.52.6
  (crate-source "windows_x86_64_gnu" "0.52.6"
                "0y0sifqcb56a56mvn7xjgs8g43p33mfqkd8wj1yhrgxzma05qyhl"))

(define rust-windows-x86-64-gnullvm-0.48.5
  (crate-source "windows_x86_64_gnullvm" "0.48.5"
                "1k24810wfbgz8k48c2yknqjmiigmql6kk3knmddkv8k8g1v54yqb"))

(define rust-windows-x86-64-gnullvm-0.52.6
  (crate-source "windows_x86_64_gnullvm" "0.52.6"
                "03gda7zjx1qh8k9nnlgb7m3w3s1xkysg55hkd1wjch8pqhyv5m94"))

(define rust-windows-x86-64-msvc-0.48.5
  (crate-source "windows_x86_64_msvc" "0.48.5"
                "0f4mdp895kkjh9zv8dxvn4pc10xr7839lf5pa9l0193i2pkgr57d"))

(define rust-windows-x86-64-msvc-0.52.6
  (crate-source "windows_x86_64_msvc" "0.52.6"
                "1v7rb5cibyzx8vak29pdrk8nx9hycsjs4w0jgms08qk49jl6v7sq"))

(define rust-xattr-1.6.1
  (crate-source "xattr" "1.6.1"
                "0ml1mb43gqasawillql6b344m0zgq8mz0isi11wj8vbg43a5mr1j"))

(define rust-xdg-2.5.2
  (crate-source "xdg" "2.5.2"
                "0im5nzmywxjgm2pmb48k0cc9hkalarz57f1d9d0x4lvb6cj76fr1"))

(define rust-zbus-5.18.0
  (crate-source "zbus" "5.18.0"
                "12p9swv45ja31c18a65vkd4a9rr1xbm7cyvi73kkjq39vihgn67y"))

(define rust-zbus-macros-5.18.0
  (crate-source "zbus_macros" "5.18.0"
                "068ix4mznsnwp3r63c5f0gnqxl0j9qvdyc0s5922ppwjxl5li5py"))

(define rust-zbus-names-4.3.4
  (crate-source "zbus_names" "4.3.4"
                "0kk250s3x1fxpz9fvhdr64ydbacpn8ah23hy021yhlzzlfs8igyq"))

(define rust-zerocopy-0.8.55
  (crate-source "zerocopy" "0.8.55"
                "1swncvj53zi9yr08b9ddhfrcmlrmh6ijxzxcr3p6w3qlgg6hb8dm"))

(define rust-zerocopy-derive-0.8.55
  (crate-source "zerocopy-derive" "0.8.55"
                "1sr8w9zc62lxmw7v6n89nxvqlki48b0nyfpyri6dd367f3xpds8g"))

(define rust-zerofrom-0.1.8
  (crate-source "zerofrom" "0.1.8"
                "0wjjdj7gdmd0iq91gzkxl7dlv0nhkk80l4bmdpzh3a1yh48mmh0f"))

(define rust-zeroize-1.9.0
  (crate-source "zeroize" "1.9.0"
                "0kpnij2v1ig6g2mhc0bnci0lrdfdhiq40afbc0fahajqc9jiag71"))

(define rust-zerovec-0.11.6
  (crate-source "zerovec" "0.11.6"
                "0fdjsy6b31q9i0d73sl7xjd12xadbwi45lkpfgqnmasrqg5i3ych"))

(define rust-zmij-1.0.23
  (crate-source "zmij" "1.0.23"
                "06zwri21nnrl34rwinmvbciap8yk1mrl8qfg9pff7lgspc56sri9"))

(define rust-zvariant-5.13.1
  (crate-source "zvariant" "5.13.1"
                "04a9r40d5vd4q6gaww8bynjrnk7mmam4bzvg8mm7h1x9saya1qmy"))

(define rust-zvariant-derive-5.13.1
  (crate-source "zvariant_derive" "5.13.1"
                "04iywbj0dg5v6iapb6vqiwz3mj67753kzzhbfyb0fy0qd8hhi9rq"))

(define rust-zvariant-utils-3.5.0
  (crate-source "zvariant_utils" "3.5.0"
                "1iy79yppaqsw0pjb8q7b36vivw7qsc1b4n0jg9090lmlz61r7jwh"))

;;; A plain list of origins.  Guix labels each one with its file
;;; name (rust-<crate>-<version>.tar.gz), which the build uses to tell
;;; vendored crates apart from the system library inputs.
(define mission-center-cargo-inputs
  (list
   rust-aho-corasick-1.1.4
   rust-anyhow-1.0.104
   rust-arrayvec-0.7.8
   rust-autocfg-1.5.1
   rust-beef-0.5.2
   rust-bitfield-0.19.4
   rust-bitfield-macros-0.19.4
   rust-bitflags-2.13.1
   rust-block-0.1.6
   rust-bytes-1.12.1
   rust-cairo-rs-0.22.0
   rust-cairo-sys-rs-0.22.0
   rust-cc-1.3.0
   rust-cfg-expr-0.20.8
   rust-cfg-if-1.0.4
   rust-chacha20-0.10.1
   rust-cmake-0.1.58
   rust-const-random-0.1.18
   rust-const-random-macro-0.1.16
   rust-cpufeatures-0.3.0
   rust-crunchy-0.2.4
   rust-dlv-list-0.5.2
   rust-either-1.16.0
   rust-equivalent-1.0.2
   rust-errno-0.3.14
   rust-error-code-3.3.2
   rust-fastrand-2.5.0
   rust-field-offset-0.3.6
   rust-find-msvc-tools-0.1.9
   rust-fixedbitset-0.5.7
   rust-fnv-1.0.7
   rust-foldhash-0.1.5
   rust-futures-channel-0.3.33
   rust-futures-core-0.3.33
   rust-futures-executor-0.3.33
   rust-futures-io-0.3.33
   rust-futures-macro-0.3.33
   rust-futures-task-0.3.33
   rust-futures-util-0.3.33
   rust-gdk-pixbuf-0.22.0
   rust-gdk-pixbuf-sys-0.22.0
   rust-gdk4-0.11.4
   rust-gdk4-sys-0.11.4
   rust-getrandom-0.2.17
   rust-getrandom-0.4.3
   rust-gettext-rs-0.7.7
   rust-gettext-sys-0.26.0
   rust-gio-0.22.8
   rust-gio-sys-0.22.8
   rust-glib-0.22.8
   rust-glib-macros-0.22.6
   rust-glib-sys-0.22.8
   rust-gobject-sys-0.22.6
   rust-graphene-rs-0.22.8
   rust-graphene-sys-0.22.8
   rust-gsk4-0.11.4
   rust-gsk4-sys-0.11.4
   rust-gtk4-0.11.4
   rust-gtk4-macros-0.11.4
   rust-gtk4-sys-0.11.4
   rust-hashbrown-0.14.5
   rust-hashbrown-0.15.5
   rust-hashbrown-0.17.1
   rust-heck-0.5.0
   rust-indexmap-2.14.0
   rust-itertools-0.14.0
   rust-lazy-static-1.5.0
   rust-libadwaita-0.9.2
   rust-libadwaita-sys-0.9.2
   rust-libc-0.2.187
   rust-linux-raw-sys-0.12.1
   rust-locale-config-0.3.0
   rust-log-0.4.33
   rust-logos-0.15.1
   rust-logos-0.16.1
   rust-logos-codegen-0.15.1
   rust-logos-codegen-0.16.1
   rust-logos-derive-0.15.1
   rust-logos-derive-0.16.1
   rust-malloc-buf-0.0.6
   rust-memchr-2.8.3
   rust-memoffset-0.9.1
   rust-miette-7.6.0
   rust-miette-derive-7.6.0
   rust-multimap-0.10.1
   rust-nng-c-1.11.1
   rust-nng-c-sys-1.11.1
   rust-objc-0.2.7
   rust-objc-foundation-0.1.1
   rust-objc-id-0.1.1
   rust-once-cell-1.21.4
   rust-ordered-multimap-0.7.3
   rust-pango-0.22.8
   rust-pango-sys-0.22.0
   rust-paste-1.0.15
   rust-petgraph-0.8.3
   rust-pin-project-lite-0.2.17
   rust-pkg-config-0.3.33
   rust-prettyplease-0.2.37
   rust-proc-macro-crate-3.5.0
   rust-proc-macro2-1.0.107
   rust-prost-0.14.4
   rust-prost-build-0.14.4
   rust-prost-derive-0.14.4
   rust-prost-reflect-0.16.5
   rust-prost-types-0.14.4
   rust-protox-0.9.1
   rust-protox-parse-0.9.0
   rust-quote-1.0.47
   rust-r-efi-6.0.0
   rust-rand-0.10.2
   rust-rand-core-0.10.1
   rust-regex-1.13.1
   rust-regex-automata-0.4.16
   rust-regex-syntax-0.8.11
   rust-rust-ini-0.21.3
   rust-rustc-version-0.4.1
   rust-rustix-1.1.4
   rust-semver-1.0.28
   rust-serde-1.0.229
   rust-serde-core-1.0.229
   rust-serde-derive-1.0.229
   rust-serde-spanned-1.1.1
   rust-shlex-2.0.1
   rust-slab-0.4.12
   rust-smallvec-1.15.2
   rust-strum-0.28.0
   rust-strum-macros-0.28.0
   rust-syn-2.0.119
   rust-syn-3.0.2
   rust-system-deps-7.0.8
   rust-target-lexicon-0.13.5
   rust-temp-dir-0.1.16
   rust-tempfile-3.27.0
   rust-textdistance-1.1.1
   rust-thiserror-2.0.19
   rust-thiserror-impl-2.0.19
   rust-tiny-keccak-2.0.2
   rust-toml-1.1.3+spec-1.1.0
   rust-toml-datetime-1.1.1+spec-1.1.0
   rust-toml-edit-0.25.13+spec-1.1.0
   rust-toml-parser-1.1.2+spec-1.1.0
   rust-toml-writer-1.1.2+spec-1.1.0
   rust-unicode-ident-1.0.24
   rust-unicode-width-0.1.14
   rust-version-compare-0.2.1
   rust-wasi-0.11.1+wasi-snapshot-preview1
   rust-winapi-0.3.9
   rust-winapi-i686-pc-windows-gnu-0.4.0
   rust-winapi-x86-64-pc-windows-gnu-0.4.0
   rust-windows-link-0.2.1
   rust-windows-sys-0.61.2
   rust-winnow-1.0.4
   rust-adler2-2.0.1
   rust-ahash-0.8.12
   rust-anstream-1.0.0
   rust-anstyle-1.0.14
   rust-anstyle-parse-1.0.0
   rust-anstyle-query-1.1.5
   rust-anstyle-wincon-3.0.11
   rust-ash-0.38.0+1.3.281
   rust-async-broadcast-0.7.2
   rust-async-channel-2.5.0
   rust-async-executor-1.14.0
   rust-async-io-2.6.0
   rust-async-lock-3.4.2
   rust-async-process-2.5.0
   rust-async-recursion-1.1.1
   rust-async-signal-0.2.14
   rust-async-task-4.7.1
   rust-async-trait-0.1.91
   rust-atomic-waker-1.1.2
   rust-base64-0.22.1
   rust-bitcode-0.6.9
   rust-bitcode-derive-0.6.9
   rust-bitflags-1.3.2
   rust-block-buffer-0.12.1
   rust-blocking-1.6.2
   rust-bmart-0.2.12
   rust-bmart-derive-0.1.4
   rust-bstr-1.13.0
   rust-bumpalo-3.20.3
   rust-bytemuck-1.25.2
   rust-bytemuck-derive-1.11.0
   rust-cargo-util-0.2.30
   rust-cfg-aliases-0.2.2
   rust-clap-4.6.3
   rust-clap-builder-4.6.2
   rust-clap-derive-4.6.3
   rust-clap-lex-1.1.0
   rust-colorchoice-1.0.5
   rust-colored-1.9.4
   rust-concurrent-queue-2.5.0
   rust-const-oid-0.10.2
   rust-core-foundation-0.10.1
   rust-core-foundation-sys-0.8.7
   rust-crc32fast-1.5.0
   rust-crossbeam-deque-0.8.7
   rust-crossbeam-epoch-0.9.20
   rust-crossbeam-utils-0.8.22
   rust-crypto-common-0.2.2
   rust-defmt-1.1.1
   rust-defmt-macros-1.1.1
   rust-defmt-parser-1.0.0
   rust-digest-0.11.3
   rust-dirs-5.0.1
   rust-dirs-sys-0.4.1
   rust-displaydoc-0.2.6
   rust-drm-0.14.1
   rust-drm-ffi-0.9.1
   rust-drm-fourcc-2.2.0
   rust-drm-sys-0.8.1
   rust-endi-1.1.1
   rust-enumflags2-0.7.12
   rust-enumflags2-derive-0.7.12
   rust-env-filter-2.0.0
   rust-env-logger-0.11.11
   rust-event-listener-5.4.1
   rust-event-listener-strategy-0.5.4
   rust-fallible-iterator-0.3.0
   rust-fallible-streaming-iterator-0.1.9
   rust-filetime-0.2.29
   rust-flate2-1.1.9
   rust-fluent-0.17.0
   rust-fluent-bundle-0.16.0
   rust-fluent-langneg-0.13.1
   rust-fluent-syntax-0.12.0
   rust-foldhash-0.2.0
   rust-freedesktop-icons-0.4.0
   rust-futures-0.3.33
   rust-futures-lite-2.6.1
   rust-futures-sink-0.3.33
   rust-gbm-0.18.0
   rust-gbm-sys-0.4.0
   rust-glam-0.33.2
   rust-glob-0.3.3
   rust-globset-0.4.19
   rust-hashbrown-0.16.1
   rust-hashlink-0.12.1
   rust-hermit-abi-0.5.2
   rust-hex-0.4.3
   rust-http-1.4.2
   rust-httparse-1.10.1
   rust-hybrid-array-0.4.13
   rust-ignore-0.4.31
   rust-ini-core-0.2.0
   rust-intl-memoizer-0.5.3
   rust-intl-pluralrules-7.0.2
   rust-is-terminal-0.4.17
   rust-is-terminal-polyfill-1.70.2
   rust-itoa-1.0.18
   rust-jiff-0.2.34
   rust-jiff-core-0.1.0
   rust-jiff-static-0.2.34
   rust-jobserver-0.1.35
   rust-js-sys-0.3.103
   rust-khronos-egl-6.0.0
   rust-libloading-0.8.9
   rust-libredox-0.1.18
   rust-libsqlite3-sys-0.38.1
   rust-linux-raw-sys-0.4.15
   rust-linux-raw-sys-0.9.4
   rust-lock-api-0.4.14
   rust-matchers-0.2.0
   rust-memoffset-0.6.5
   rust-miniz-oxide-0.8.9
   rust-mio-1.2.2
   rust-miow-0.6.1
   rust-nix-0.22.3
   rust-nix-0.31.3
   rust-ntapi-0.4.3
   rust-nu-ansi-term-0.50.3
   rust-objc2-core-foundation-0.3.2
   rust-objc2-io-kit-0.3.2
   rust-once-cell-polyfill-1.70.2
   rust-option-ext-0.2.0
   rust-ordered-stream-0.2.0
   rust-os-display-0.1.4
   rust-parking-2.2.1
   rust-parking-lot-0.12.5
   rust-parking-lot-core-0.9.12
   rust-percent-encoding-2.3.2
   rust-phf-0.14.0
   rust-phf-generator-0.14.0
   rust-phf-macros-0.14.0
   rust-phf-shared-0.14.0
   rust-piper-0.2.5
   rust-polling-3.11.0
   rust-portable-atomic-1.14.0
   rust-portable-atomic-util-0.2.7
   rust-rayon-1.12.0
   rust-rayon-core-1.13.0
   rust-redox-syscall-0.5.18
   rust-redox-users-0.4.6
   rust-ring-0.17.14
   rust-rsqlite-vfs-0.1.1
   rust-rusqlite-0.40.1
   rust-rustc-hash-2.1.3
   rust-rustix-0.38.44
   rust-rustix-openpty-0.2.0
   rust-rustls-0.23.42
   rust-rustls-pki-types-1.15.0
   rust-rustls-webpki-0.103.13
   rust-rustversion-1.0.23
   rust-same-file-1.0.6
   rust-scopeguard-1.2.0
   rust-self-cell-1.3.0
   rust-serde-json-1.0.151
   rust-serde-repr-0.1.21
   rust-sha2-0.11.0
   rust-sharded-slab-0.1.7
   rust-shell-escape-0.1.5
   rust-signal-hook-0.4.4
   rust-signal-hook-registry-1.4.8
   rust-simd-adler32-0.3.10
   rust-siphasher-1.0.3
   rust-socket2-0.6.5
   rust-sqlite-wasm-rs-0.5.5
   rust-strsim-0.11.1
   rust-subtle-2.6.1
   rust-syn-1.0.109
   rust-sysinfo-0.29.11
   rust-sysinfo-0.37.2
   rust-tar-0.4.46
   rust-terminal-size-0.4.4
   rust-test-log-0.2.21
   rust-test-log-core-0.2.21
   rust-test-log-macros-0.2.21
   rust-thiserror-1.0.69
   rust-thiserror-impl-1.0.69
   rust-thread-local-1.1.10
   rust-tinystr-0.8.3
   rust-tokio-1.53.1
   rust-tokio-macros-2.7.1
   rust-tracing-0.1.44
   rust-tracing-attributes-0.1.31
   rust-tracing-core-0.1.36
   rust-tracing-log-0.2.0
   rust-tracing-subscriber-0.3.23
   rust-triggered-0.1.3
   rust-trim-in-place-0.1.7
   rust-type-map-0.5.1
   rust-typenum-1.20.1
   rust-udisks2-0.3.1
   rust-uds-windows-1.2.1
   rust-unic-langid-0.9.6
   rust-unic-langid-impl-0.9.6
   rust-unicode-width-0.2.2
   rust-untrusted-0.9.0
   rust-upower-dbus-0.3.2.87c3c35
   rust-ureq-3.3.0
   rust-ureq-proto-0.6.0
   rust-utf8-zero-0.8.1
   rust-utf8parse-0.2.2
   rust-uucore-0.9.0
   rust-uucore-procs-0.9.0
   rust-uuid-0.8.2
   rust-uuid-1.24.0
   rust-valuable-0.1.1
   rust-vcpkg-0.2.15
   rust-version-check-0.9.5
   rust-virtual-terminal-0.1.5
   rust-vt100-0.16.2
   rust-vte-0.15.0
   rust-walkdir-2.5.0
   rust-wasm-bindgen-0.2.126
   rust-wasm-bindgen-macro-0.2.126
   rust-wasm-bindgen-macro-support-0.2.126
   rust-wasm-bindgen-shared-0.2.126
   rust-webpki-roots-1.0.9
   rust-which-8.0.5
   rust-wild-2.2.1
   rust-winapi-util-0.1.11
   rust-windows-0.61.3
   rust-windows-collections-0.2.0
   rust-windows-core-0.61.2
   rust-windows-future-0.2.1
   rust-windows-implement-0.60.2
   rust-windows-interface-0.59.3
   rust-windows-link-0.1.3
   rust-windows-numerics-0.2.0
   rust-windows-result-0.3.4
   rust-windows-strings-0.4.2
   rust-windows-sys-0.48.0
   rust-windows-sys-0.52.0
   rust-windows-sys-0.59.0
   rust-windows-targets-0.48.5
   rust-windows-targets-0.52.6
   rust-windows-threading-0.1.0
   rust-windows-aarch64-gnullvm-0.48.5
   rust-windows-aarch64-gnullvm-0.52.6
   rust-windows-aarch64-msvc-0.48.5
   rust-windows-aarch64-msvc-0.52.6
   rust-windows-i686-gnu-0.48.5
   rust-windows-i686-gnu-0.52.6
   rust-windows-i686-gnullvm-0.52.6
   rust-windows-i686-msvc-0.48.5
   rust-windows-i686-msvc-0.52.6
   rust-windows-x86-64-gnu-0.48.5
   rust-windows-x86-64-gnu-0.52.6
   rust-windows-x86-64-gnullvm-0.48.5
   rust-windows-x86-64-gnullvm-0.52.6
   rust-windows-x86-64-msvc-0.48.5
   rust-windows-x86-64-msvc-0.52.6
   rust-xattr-1.6.1
   rust-xdg-2.5.2
   rust-zbus-5.18.0
   rust-zbus-macros-5.18.0
   rust-zbus-names-4.3.4
   rust-zerocopy-0.8.55
   rust-zerocopy-derive-0.8.55
   rust-zerofrom-0.1.8
   rust-zeroize-1.9.0
   rust-zerovec-0.11.6
   rust-zmij-1.0.23
   rust-zvariant-5.13.1
   rust-zvariant-derive-5.13.1
   rust-zvariant-utils-3.5.0
   ))
