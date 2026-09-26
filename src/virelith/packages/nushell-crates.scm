;;; Rust crate sources for Nushell.
;;;
;;; Generated with `guix import crate --lockfile=<Cargo.lock> nu' for
;;; Nushell 0.115.1 (tag 0.115.1, commit
;;; 798c55d19505fd52f205d7eb32a571b9d06ec9e6).  The lockfile resolves
;;; to 991 registry crates; all of them are vendored offline from this
;;; module.  Do not edit by hand.

(define-module (virelith packages nushell-crates)
  #:use-module (guix build-system cargo)  ; crate-source
  #:export (nushell-cargo-inputs))

(define rust-addr2line-0.25.1
  (crate-source
   "addr2line"
   "0.25.1"
   "0jwb96gv17vdr29hbzi0ha5q6jkpgjyn7rjlg5nis65k41rk0p8v"))

(define rust-adler2-2.0.1
  (crate-source
   "adler2"
   "2.0.1"
   "1ymy18s9hs7ya1pjc9864l30wk8p2qfqdi7mhhcc5nfakxbij09j"))

(define rust-adler32-1.2.0
  (crate-source
   "adler32"
   "1.2.0"
   "0d7jq7jsjyhsgbhnfq5fvrlh9j0i9g1fqrl2735ibv5f75yjgqda"))

(define rust-aegis-password-generator-0.1.1
  (crate-source
   "aegis-password-generator"
   "0.1.1"
   "1y1s0j3gci6nd2ws6jyybkmzhy99jw8d7n11ba77589c2alb2l4h"))

(define rust-ahash-0.8.12
  (crate-source
   "ahash"
   "0.8.12"
   "0xbsp9rlm5ki017c0w6ay8kjwinwm8knjncci95mii30rmwz25as"))

(define rust-aho-corasick-1.1.4
  (crate-source
   "aho-corasick"
   "1.1.4"
   "00a32wb2h07im3skkikc495jvncf62jl6s96vwc7bhi70h9imlyx"))

(define rust-alloc-no-stdlib-2.0.4
  (crate-source
   "alloc-no-stdlib"
   "2.0.4"
   "1cy6r2sfv5y5cigv86vms7n5nlwhx1rbyxwcraqnmm1rxiib2yyc"))

(define rust-alloc-stdlib-0.2.2
  (crate-source
   "alloc-stdlib"
   "0.2.2"
   "1kkfbld20ab4165p29v172h8g0wvq8i06z8vnng14whw0isq5ywl"))

(define rust-alloca-0.4.0
  (crate-source
   "alloca"
   "0.4.0"
   "1x6p4387rz6j7h342kp3b7bgvqzyl9mibf959pkfk9xflrgd19z5"))

(define rust-allocator-api2-0.2.21
  (crate-source
   "allocator-api2"
   "0.2.21"
   "08zrzs022xwndihvzdn78yqarv2b9696y67i6h78nla3ww87jgb8"))

(define rust-alphanumeric-sort-1.5.5
  (crate-source
   "alphanumeric-sort"
   "1.5.5"
   "1cgcdra6iqbhdxzmsjv3l212172xak15s8j1bvbv9s8nmkzgskvp"))

(define rust-android-system-properties-0.1.5
  (crate-source
   "android_system_properties"
   "0.1.5"
   "04b3wrz12837j7mdczqd95b732gw5q7q66cv4yn4646lvccp57l1"))

(define rust-annotate-snippets-0.12.16
  (crate-source
   "annotate-snippets"
   "0.12.16"
   "1w8kdyj2fh4n666wvd1krj2zcyjls9vlqrmpslx1yr5w0lcaa4gj"))

(define rust-ansi-str-0.9.0
  (crate-source
   "ansi-str"
   "0.9.0"
   "03c9j3870slj40lkdkrpav2p4kig2f1g6x42n8267x397d2y2386"))

(define rust-ansitok-0.3.0
  (crate-source
   "ansitok"
   "0.3.0"
   "1vjrlvmwrq5v72rcmfqhdyspvabcz5mx531am7q6071gikmara60"))

(define rust-anstream-0.6.21
  (crate-source
   "anstream"
   "0.6.21"
   "0jjgixms4qjj58dzr846h2s29p8w7ynwr9b9x6246m1pwy0v5ma3"))

(define rust-anstyle-1.0.13
  (crate-source
   "anstyle"
   "1.0.13"
   "0y2ynjqajpny6q0amvfzzgw0gfw3l47z85km4gvx87vg02lcr4ji"))

(define rust-anstyle-parse-0.2.7
  (crate-source
   "anstyle-parse"
   "0.2.7"
   "1hhmkkfr95d462b3zf6yl2vfzdqfy5726ya572wwg8ha9y148xjf"))

(define rust-anstyle-query-1.1.5
  (crate-source
   "anstyle-query"
   "1.1.5"
   "1p6shfpnbghs6jsa0vnqd8bb8gd7pjd0jr7w0j8jikakzmr8zi20"))

(define rust-anstyle-wincon-3.0.11
  (crate-source
   "anstyle-wincon"
   "3.0.11"
   "0zblannm70sk3xny337mz7c6d8q8i24vhbqi42ld8v7q1wjnl7i9"))

(define rust-anyhow-1.0.102
  (crate-source
   "anyhow"
   "1.0.102"
   "0b447dra1v12z474c6z4jmicdmc5yxz5bakympdnij44ckw2s83z"))

(define rust-approx-0.5.1
  (crate-source
   "approx"
   "0.5.1"
   "1ilpv3dgd58rasslss0labarq7jawxmivk17wsh8wmkdm3q15cfa"))

(define rust-ar-archive-writer-0.5.1
  (crate-source
   "ar_archive_writer"
   "0.5.1"
   "02rlgsw6k2dh3dk616qyrsl939fwznns1cvf9x0jghmrcfxkpfby"))

(define rust-arboard-3.6.1
  (crate-source
   "arboard"
   "3.6.1"
   "1byx6q5iipxkb0pyjp80k7c4akp4n5m7nsmqdbz4n7s9ak0a2j03"))

(define rust-arc-swap-1.9.2
  (crate-source
   "arc-swap"
   "1.9.2"
   "02w1n3kiz02ml6is3biqia4bgxcf7dml2m9mrd2v3w5f9nzc0jf0"))

(define rust-argminmax-0.6.3
  (crate-source
   "argminmax"
   "0.6.3"
   "0rcy6nq86wqwfbqpxzpdq8lpmx76c66ifd7fg7nd5j0slh83vwbh"))

(define rust-array-init-cursor-0.2.1
  (crate-source
   "array-init-cursor"
   "0.2.1"
   "1hqzgcw4930bp8gw2qy10nfyw7c3kwgwaf5yd2klw7ad487zwlgd"))

(define rust-arraydeque-0.5.1
  (crate-source
   "arraydeque"
   "0.5.1"
   "0dn2xdfg3rkiqsh8a6achnmvf5nf11xk33xgjzpksliab4yjx43x"))

(define rust-arrayref-0.3.9
  (crate-source
   "arrayref"
   "0.3.9"
   "1jzyp0nvp10dmahaq9a2rnxqdd5wxgbvp8xaibps3zai8c9fi8kn"))

(define rust-arrayvec-0.7.6
  (crate-source
   "arrayvec"
   "0.7.6"
   "0l1fz4ccgv6pm609rif37sl5nv5k6lbzi7kkppgzqzh1vwix20kw"))

(define rust-assert-json-diff-2.0.2
  (crate-source
   "assert-json-diff"
   "2.0.2"
   "04mg3w0rh3schpla51l18362hsirl23q93aisws2irrj32wg5r27"))

(define rust-assert-cmd-2.2.1
  (crate-source
   "assert_cmd"
   "2.2.1"
   "1gbkcsy8gdkcjmq4047ys7bqs9jr4nkq0hai35jpqvspzb9y3fir"))

(define rust-async-channel-2.5.0
  (crate-source
   "async-channel"
   "2.5.0"
   "1ljq24ig8lgs2555myrrjighycpx2mbjgrm3q7lpa6rdsmnxjklj"))

(define rust-async-stream-0.3.6
  (crate-source
   "async-stream"
   "0.3.6"
   "0xl4zqncrdmw2g6241wgr11dxdg4h7byy6bz3l6si03qyfk72nhb"))

(define rust-async-stream-impl-0.3.6
  (crate-source
   "async-stream-impl"
   "0.3.6"
   "0kaplfb5axsvf1gfs2gk6c4zx6zcsns0yf3ssk7iwni7bphlvhn7"))

(define rust-async-trait-0.1.89
  (crate-source
   "async-trait"
   "0.1.89"
   "1fsxxmz3rzx1prn1h3rs7kyjhkap60i7xvi0ldapkvbb14nssdch"))

(define rust-atoi-simd-0.17.0
  (crate-source
   "atoi_simd"
   "0.17.0"
   "13km4al2g0k21v79i3s3ic04s6ygj7mmx15r4ysjhb2w41y7rlca"))

(define rust-atoi-simd-0.18.1
  (crate-source
   "atoi_simd"
   "0.18.1"
   "0i1a8lmnan3645f941i8j3k2w0m5fy50x0zv62d5b3hji9qb7kgk"))

(define rust-atomic-0.6.1
  (crate-source
   "atomic"
   "0.6.1"
   "0h43ljcgbl6vk62hs6yk7zg7qn3myzvpw8k7isb9nzhkbdvvz758"))

(define rust-atomic-waker-1.1.2
  (crate-source
   "atomic-waker"
   "1.1.2"
   "1h5av1lw56m0jf0fd3bchxq8a30xv0b4wv8s4zkp4s0i7mfvs18m"))

(define rust-autocfg-1.5.0
  (crate-source
   "autocfg"
   "1.5.0"
   "1s77f98id9l4af4alklmzq46f21c980v13z2r1pcxx6bqgw0d1n0"))

(define rust-avro-schema-0.3.0
  (crate-source
   "avro-schema"
   "0.3.0"
   "1gbvciwvi2isa6qanbzi4lbqzzgvhdlzjyzlsa29dflsndaiha5m"))

(define rust-aws-config-1.10.0
  (crate-source
   "aws-config"
   "1.10.0"
   "1a37kmwz6w4vclip9b563306p8b2as7833hg1bjk7b4x8nm1h53h"))

(define rust-aws-credential-types-1.3.0
  (crate-source
   "aws-credential-types"
   "1.3.0"
   "0vjmpdhqyw293gqh0iwkkrlvnw3mynjncdmy8ksmfy7mvbzn8fg9"))

(define rust-aws-lc-rs-1.16.2
  (crate-source
   "aws-lc-rs"
   "1.16.2"
   "1z6i8qs0xjnzvslxnkhvywzzwfkafb1s4nrpg3f2k1nii4i92m50"))

(define rust-aws-lc-sys-0.39.0
  (crate-source
   "aws-lc-sys"
   "0.39.0"
   "02jga4605vwqcxzd4k3ikd01x27k4gqwd8hh2rs7qm2w9hmfb9qz"))

(define rust-aws-runtime-1.9.0
  (crate-source
   "aws-runtime"
   "1.9.0"
   "0xjd68i5gpv9jpdfnffl15p8nrn9gj5wdmn644ak7pycyd1hmdd6"))

(define rust-aws-sdk-sso-1.104.0
  (crate-source
   "aws-sdk-sso"
   "1.104.0"
   "08lwyn8smw3p49d003xakpqd50a4pn9qvqwjaf2390i7dk8icd5m"))

(define rust-aws-sdk-ssooidc-1.106.0
  (crate-source
   "aws-sdk-ssooidc"
   "1.106.0"
   "127ip6chz2bndhz3xc0ghc7rad5a8z3rddmisn2h5v856dn716yc"))

(define rust-aws-sdk-sts-1.109.0
  (crate-source
   "aws-sdk-sts"
   "1.109.0"
   "1gfv2wplpyxiz0p355xm9wisacnzz91pcsp72zqiggjvzb6i9lij"))

(define rust-aws-sigv4-1.5.1
  (crate-source
   "aws-sigv4"
   "1.5.1"
   "17rh0x503bv7hkx9dyzyj1awbxvgpavidc7acgpww4bmmls24g3j"))

(define rust-aws-smithy-async-1.3.0
  (crate-source
   "aws-smithy-async"
   "1.3.0"
   "05mkpsracm2pz4dgl015aigx7zbiiangzf9489rr2j5mndzl0bph"))

(define rust-aws-smithy-http-0.64.0
  (crate-source
   "aws-smithy-http"
   "0.64.0"
   "0v9h42cixaqdcxdwph7rc3zwvlqmqdnrqh3ghpsszhv7vnd3v11p"))

(define rust-aws-smithy-http-client-1.2.0
  (crate-source
   "aws-smithy-http-client"
   "1.2.0"
   "13l31gjrf8qjjchbx8hq6pld3s3k91y48kbccs6v8shavapj6pb3"))

(define rust-aws-smithy-json-0.63.0
  (crate-source
   "aws-smithy-json"
   "0.63.0"
   "1vyrq7yxp2111sxhd3ssap0k7yrnz8agmz0rk5r36jyv3895miix"))

(define rust-aws-smithy-observability-0.3.0
  (crate-source
   "aws-smithy-observability"
   "0.3.0"
   "037d69kd1mjygc2n0l07bhngk1vf59v4f4hnpy0safcmhs6371lf"))

(define rust-aws-smithy-query-0.62.0
  (crate-source
   "aws-smithy-query"
   "0.62.0"
   "0qmg1a0nk4m6s88mb0qqli2aws54fvcicynpy9nl7dra473lc8si"))

(define rust-aws-smithy-runtime-1.12.0
  (crate-source
   "aws-smithy-runtime"
   "1.12.0"
   "0ib0xsr1a63q5r88m2c8ihw1q4ypfas287l5ihrich26z2glmady"))

(define rust-aws-smithy-runtime-api-1.13.0
  (crate-source
   "aws-smithy-runtime-api"
   "1.13.0"
   "1w0j8v5kyxsidw6rn6p6fy7lpv4d42lga982ay2fm58adsz1xv92"))

(define rust-aws-smithy-runtime-api-macros-1.1.0
  (crate-source
   "aws-smithy-runtime-api-macros"
   "1.1.0"
   "1cvpvhkx0qccvacm1kmkll79qzz4fynjldyic2dsf76zglisl7i2"))

(define rust-aws-smithy-schema-0.2.0
  (crate-source
   "aws-smithy-schema"
   "0.2.0"
   "047r0ghia48ghfwniz1w3sgglig01wxn6hsf48rac9riwnjf0mkx"))

(define rust-aws-smithy-types-1.6.1
  (crate-source
   "aws-smithy-types"
   "1.6.1"
   "1n37q6l5cxwnnsgdqyyznvjl2c8hw3dzwdsvcxaygf9lzcz6ip6n"))

(define rust-aws-smithy-xml-0.62.0
  (crate-source
   "aws-smithy-xml"
   "0.62.0"
   "1n5p64dzvam7bwlmaf3khhx6wipvyn1d1rz6vnxcpqpyf8fgg16f"))

(define rust-aws-types-1.5.0
  (crate-source
   "aws-types"
   "1.5.0"
   "150z7s48jvyic1nkbcyb6d7aa67i7hax8cryvj1cfa7kd5acvhgf"))

(define rust-backtrace-0.3.76
  (crate-source
   "backtrace"
   "0.3.76"
   "1mibx75x4jf6wz7qjifynld3hpw3vq6sy3d3c9y5s88sg59ihlxv"))

(define rust-backtrace-ext-0.2.1
  (crate-source
   "backtrace-ext"
   "0.2.1"
   "0l4xacjnx4jrn9k14xbs2swks018mviq03sp7c1gn62apviywysk"))

(define rust-base64-0.22.1
  (crate-source
   "base64"
   "0.22.1"
   "1imqzgh7bxcikp5vx3shqvw9j09g9ly0xr0jma0q66i52r7jbcvj"))

(define rust-base64-0.23.0
  (crate-source
   "base64"
   "0.23.0"
   "1a9x0g0gsi1iqh5c7mxdvnr340w8rn5bi4xjwp2q7p9w5kgmammj"))

(define rust-base64-simd-0.8.0
  (crate-source
   "base64-simd"
   "0.8.0"
   "15cihnjqpxy0h7llpk816czyp5z613yrvsivw9i8f5vkivkvp6ik"))

(define rust-base64ct-1.8.3
  (crate-source
   "base64ct"
   "1.8.3"
   "01nyyyx84bhwrcc168hn47d8gvz2pzpv3y3lmck7mq4hw5vh3x9a"))

(define rust-better-default-1.0.5
  (crate-source
   "better_default"
   "1.0.5"
   "0fdv4cns968j7xvjjb6mnmkqj2b7jpjimjvwr517d6p4vi0516kv"))

(define rust-bigdecimal-0.4.10
  (crate-source
   "bigdecimal"
   "0.4.10"
   "159nc0bs6bbzxrpfxbnn83ccyzq8bc2ia40zd22ssfjvavqnfs2d"))

(define rust-bincode-1.3.3
  (crate-source
   "bincode"
   "1.3.3"
   "1bfw3mnwzx5g1465kiqllp5n4r10qrqy88kdlp3jfwnq2ya5xx5i"))

(define rust-bincode-2.0.1
  (crate-source
   "bincode"
   "2.0.1"
   "0h5pxp3dqkigjwy926a03sl69n9wv7aq4142a20kw9lhn3bzbsin"))

(define rust-bincode-derive-2.0.1
  (crate-source
   "bincode_derive"
   "2.0.1"
   "029wmh26hq3hhs1gq629y0frn2pkl7ld061rk23fji8g8jd715dz"))

(define rust-bindgen-0.72.1
  (crate-source
   "bindgen"
   "0.72.1"
   "15bq73y3wd3x3vxh3z3g72hy08zs8rxg1f0i1xsrrd6g16spcdwr"))

(define rust-bit-set-0.8.0
  (crate-source
   "bit-set"
   "0.8.0"
   "18riaa10s6n59n39vix0cr7l2dgwdhcpbcm97x1xbyfp1q47x008"))

(define rust-bit-vec-0.8.0
  (crate-source
   "bit-vec"
   "0.8.0"
   "1xxa1s2cj291r7k1whbxq840jxvmdsq9xgh7bvrxl46m80fllxjy"))

(define rust-bitflags-1.3.2
  (crate-source
   "bitflags"
   "1.3.2"
   "12ki6w8gn1ldq7yz9y680llwk5gmrhrzszaa17g1sbrw2r2qvwxy"))

(define rust-bitflags-2.11.0
  (crate-source
   "bitflags"
   "2.11.0"
   "1bwjibwry5nfwsfm9kjg2dqx5n5nja9xymwbfl6svnn8jsz6ff44"))

(define rust-blake3-1.8.3
  (crate-source
   "blake3"
   "1.8.3"
   "0b9ay320z90xs5hyk48l1v3208yyvdy3gs3nnlb7xyxkaxyyys14"))

(define rust-block-buffer-0.10.4
  (crate-source
   "block-buffer"
   "0.10.4"
   "0w9sa2ypmrsqqvc20nhwr75wbb5cjr4kkyhpjm1z1lv2kdicfy1h"))

(define rust-block-buffer-0.12.1
  (crate-source
   "block-buffer"
   "0.12.1"
   "1ak0cvmxz3yifqmzv6aba9606brsz7d5g3piv5xdcvjsx7dwgxnj"))

(define rust-block2-0.6.2
  (crate-source
   "block2"
   "0.6.2"
   "1xcfllzx6c3jc554nmb5qy6xmlkl6l6j5ib4wd11800n0n3rvsyd"))

(define rust-borsh-1.6.1
  (crate-source
   "borsh"
   "1.6.1"
   "0nhqivq6rp7318hcns1rf25gpsdd7wvwhbxpzblpspasjpwf7lfg"))

(define rust-boxcar-0.2.14
  (crate-source
   "boxcar"
   "0.2.14"
   "0vksx6zjnkqwxsm2bp21vhmc35dqlmhjgzr69cdxm10awkm4pxin"))

(define rust-bracoxide-0.1.8
  (crate-source
   "bracoxide"
   "0.1.8"
   "1kfxy80kr0nnsxq5q5g9qmc2aksnlcbp7c67n0flm4wccrqmpsys"))

(define rust-brotli-8.0.2
  (crate-source
   "brotli"
   "8.0.2"
   "0q25r00z3gm5wzvv4vfxvlx5zjb8i4jwyznrvdcp7abs7ihbkn2b"))

(define rust-brotli-decompressor-5.0.0
  (crate-source
   "brotli-decompressor"
   "5.0.0"
   "00yyswj1rj20ma4wr4wcci4r9ywlgvxa87nqsv5rik5y588vhjw7"))

(define rust-bstr-1.13.0
  (crate-source
   "bstr"
   "1.13.0"
   "0c6mzdwk0ydxdpfmcgax8sji9bpagvi11lcsap0y3whqsyac0z8z"))

(define rust-buf-trait-0.4.1
  (crate-source
   "buf-trait"
   "0.4.1"
   "1d0pxqvynln4p58n7ajl95fk0x772xvgxjpsqgb77h78f33szsi1"))

(define rust-bumpalo-3.20.2
  (crate-source
   "bumpalo"
   "3.20.2"
   "1jrgxlff76k9glam0akhwpil2fr1w32gbjdf5hpipc7ld2c7h82x"))

(define rust-bytecount-0.6.9
  (crate-source
   "bytecount"
   "0.6.9"
   "0pinq0n8zza8qr2lyc3yf17k963129kdbf0bwnmvdk1bpvh14n0p"))

(define rust-bytemuck-1.25.0
  (crate-source
   "bytemuck"
   "1.25.0"
   "1v1z32igg9zq49phb3fra0ax5r2inf3aw473vldnm886sx5vdvy8"))

(define rust-bytemuck-derive-1.10.2
  (crate-source
   "bytemuck_derive"
   "1.10.2"
   "1zvmjmw1sdmx9znzm4dpbb2yvz9vyim8w6gp4z256l46qqdvvazr"))

(define rust-byteorder-1.5.0
  (crate-source
   "byteorder"
   "1.5.0"
   "0jzncxyf404mwqdbspihyzpkndfgda450l0893pz5xj685cg5l0z"))

(define rust-byteorder-lite-0.1.0
  (crate-source
   "byteorder-lite"
   "0.1.0"
   "15alafmz4b9az56z6x7glcbcb6a8bfgyd109qc3bvx07zx4fj7wg"))

(define rust-bytes-1.12.0
  (crate-source
   "bytes"
   "1.12.0"
   "14xmxm8imyvw675bsgyadmzm9k63js1sdqh7099p0hlj2p9zbqwa"))

(define rust-bytes-utils-0.1.4
  (crate-source
   "bytes-utils"
   "0.1.4"
   "0dcd0lxfpj367j9nwm7izj4mkib3slg61rg4wqmpw0kvfnlf7bvx"))

(define rust-bytesize-2.7.0
  (crate-source
   "bytesize"
   "2.7.0"
   "12ziwl3a97hq5x4xsv51lv1r8mr8s5ims1yjmw7rhzifaa62hm3k"))

(define rust-byteyarn-0.5.1
  (crate-source
   "byteyarn"
   "0.5.1"
   "0yygyhncfij3skkb3824wr1xn1f47p0y09c5kyjmx8b8ck952gmr"))

(define rust-calamine-0.36.0
  (crate-source
   "calamine"
   "0.36.0"
   "0ngz3d5bzinlkx2y5n0w5v7psam53xrzk9zv7ws5c3h68d7hhxb9"))

(define rust-castaway-0.2.4
  (crate-source
   "castaway"
   "0.2.4"
   "0nn5his5f8q20nkyg1nwb40xc19a08yaj4y76a8q2y3mdsmm3ify"))

(define rust-cc-1.2.56
  (crate-source
   "cc"
   "1.2.56"
   "1chvh9g2izhqad7vzy4cc7xpdljdvqpsr6x6hv1hmyqv3mlkbgxf"))

(define rust-cesu8-1.1.0
  (crate-source
   "cesu8"
   "1.1.0"
   "0g6q58wa7khxrxcxgnqyi9s1z2cjywwwd3hzr5c55wskhx6s0hvd"))

(define rust-cexpr-0.6.0
  (crate-source
   "cexpr"
   "0.6.0"
   "0rl77bwhs5p979ih4r0202cn5jrfsrbgrksp40lkfz5vk1x3ib3g"))

(define rust-cfg-if-1.0.4
  (crate-source
   "cfg-if"
   "1.0.4"
   "008q28ajc546z5p2hcwdnckmg0hia7rnx52fni04bwqkzyrghc4k"))

(define rust-cfg-aliases-0.2.1
  (crate-source
   "cfg_aliases"
   "0.2.1"
   "092pxdc1dbgjb6qvh83gk56rkic2n2ybm4yvy76cgynmzi3zwfk1"))

(define rust-chacha20-0.10.0
  (crate-source
   "chacha20"
   "0.10.0"
   "00bn2rn8l68qvlq93mhq7b4ns4zy9qbjsyjbb9kljgl4hqr9i3bg"))

(define rust-chardetng-1.0.0
  (crate-source
   "chardetng"
   "1.0.0"
   "0lwbp36klw475vw6c3jqy98frgs1kb2crkm5sgjlw1mm8i599phk"))

(define rust-charset-0.1.5
  (crate-source
   "charset"
   "0.1.5"
   "0zkwcw525qwcqsdf74l9d2r6m69yxfxb4kgywp3q9fklgjq2gygi"))

(define rust-chrono-0.4.44
  (crate-source
   "chrono"
   "0.4.44"
   "1c64mk9a235271j5g3v4zrzqqmd43vp9vki7vqfllpqf5rd0fwy6"))

(define rust-chrono-humanize-0.2.3
  (crate-source
   "chrono-humanize"
   "0.2.3"
   "0fq25fcdqd7s39dx81hq123210q4lpcbjdz82jl2fy6jnkk2g5kr"))

(define rust-chrono-tz-0.10.4
  (crate-source
   "chrono-tz"
   "0.10.4"
   "1hr6rmdvqwgk748g2f69mnk97fzhdkfzaczvdn0wz4pdjy2rl4x6"))

(define rust-chumsky-0.12.0
  (crate-source
   "chumsky"
   "0.12.0"
   "19kmxh8mr9g3abkvjp9mqhd8hsf0hx78f75k67g0ffz8kifa192b"))

(define rust-clang-sys-1.8.1
  (crate-source
   "clang-sys"
   "1.8.1"
   "1x1r9yqss76z8xwpdanw313ss6fniwc1r7dzb5ycjn0ph53kj0hb"))

(define rust-clap-4.5.60
  (crate-source
   "clap"
   "4.5.60"
   "02h3nzznssjgp815nnbzk0r62y2iw03kdli75c233kirld6z75r7"))

(define rust-clap-builder-4.5.60
  (crate-source
   "clap_builder"
   "4.5.60"
   "0xk8mdizvmmn6w5ij5cwhy5pbgyac4w9pfvl6nqmjl7a5hql38i4"))

(define rust-clap-derive-4.5.55
  (crate-source
   "clap_derive"
   "4.5.55"
   "1r949xis3jmhzh387smd70vc8a3b9734ck3g5ahg59a63bd969x9"))

(define rust-clap-lex-1.0.0
  (crate-source
   "clap_lex"
   "1.0.0"
   "0c8888qi1l9sayqlv666h8s0yxn2qc6jr88v1zagk43mpjjjx0is"))

(define rust-clipboard-win-5.4.1
  (crate-source
   "clipboard-win"
   "5.4.1"
   "1m44gqy11rq1ww7jls86ppif98v6kv2wkwk8p17is86zsdq3gq5x"))

(define rust-cmake-0.1.57
  (crate-source
   "cmake"
   "0.1.57"
   "0zgg10qgykig4nxyf7whrqfg7fkk0xfxhiavikmrndvbrm23qi3m"))

(define rust-cmov-0.5.4
  (crate-source
   "cmov"
   "0.5.4"
   "0yh22sqdvcdrfbhvnja4kaq5dyklpb4s70w5r6rplfdw4jna17hc"))

(define rust-codepage-0.1.2
  (crate-source
   "codepage"
   "0.1.2"
   "1d0qr4wqc4yrab7halsa3r6akb2i2bk2cqr04vl8m0n23c38vxj8"))

(define rust-colorchoice-1.0.4
  (crate-source
   "colorchoice"
   "1.0.4"
   "0x8ymkz1xr77rcj1cfanhf416pc4v681gmkc9dzb3jqja7f62nxh"))

(define rust-colorz-1.1.4
  (crate-source
   "colorz"
   "1.1.4"
   "0yq6wvrajh73b9hwjr03brc2znhr1x1nym6bd5ry68c8g72kgsvc"))

(define rust-combine-4.6.7
  (crate-source
   "combine"
   "4.6.7"
   "1z8rh8wp59gf8k23ar010phgs0wgf5i8cx4fg01gwcnzfn5k0nms"))

(define rust-comfy-table-7.2.2
  (crate-source
   "comfy-table"
   "7.2.2"
   "0ixdw77rly84i5z1mxyw6v8lp1isaawnmgxv5d64n88zrxp5v34m"))

(define rust-compact-str-0.9.0
  (crate-source
   "compact_str"
   "0.9.0"
   "0ykhh2scg32lmzxak107pmby6fmnz7qbhsi9i8g9iknfl4ji7nrz"))

(define rust-concurrent-queue-2.5.0
  (crate-source
   "concurrent-queue"
   "2.5.0"
   "0wrr3mzq2ijdkxwndhf79k952cp4zkz35ray8hvsxl96xrx1k82c"))

(define rust-console-0.16.2
  (crate-source
   "console"
   "0.16.2"
   "1i5y6h3myz38jl9p3gglx5vh9c69kxxajsv3jx0pw8i6i555mr03"))

(define rust-const-oid-0.10.2
  (crate-source
   "const-oid"
   "0.10.2"
   "0p7m286mp8aai4sa72g7ji6qm0d4ns8wg4i4b2hj9p9615zm3vx6"))

(define rust-const-random-0.1.18
  (crate-source
   "const-random"
   "0.1.18"
   "0n8kqz3y82ks8znvz1mxn3a9hadca3amzf33gmi6dc3lzs103q47"))

(define rust-const-random-macro-0.1.16
  (crate-source
   "const-random-macro"
   "0.1.16"
   "03iram4ijjjq9j5a7hbnmdngj8935wbsd0f5bm8yw2hblbr3kn7r"))

(define rust-const-format-0.2.35
  (crate-source
   "const_format"
   "0.2.35"
   "1b9h03z3k76ail1ldqxcqmsc4raa7dwgwwqwrjf6wmism5lp9akz"))

(define rust-const-format-proc-macros-0.2.34
  (crate-source
   "const_format_proc_macros"
   "0.2.34"
   "0i3pxxcl4xvwq4mlfg3csb4j0n6v0mhj07p6yk0vlvdirznc4mqx"))

(define rust-constant-time-eq-0.4.2
  (crate-source
   "constant_time_eq"
   "0.4.2"
   "16zamq60dq80k3rqlzh9j9cpjhishmh924lnwbplgrnmkkvfylix"))

(define rust-convert-case-0.4.0
  (crate-source
   "convert_case"
   "0.4.0"
   "03jaf1wrsyqzcaah9jf8l1iznvdw5mlsca2qghhzr9w27sddaib2"))

(define rust-convert-case-0.10.0
  (crate-source
   "convert_case"
   "0.10.0"
   "1fff1x78mp2c233g68my0ag0zrmjdbym8bfyahjbfy4cxza5hd33"))

(define rust-cookie-0.18.1
  (crate-source
   "cookie"
   "0.18.1"
   "0iy749flficrlvgr3hjmf3igr738lk81n5akzf4ym4cs6cxg7pjd"))

(define rust-cookie-store-0.22.1
  (crate-source
   "cookie_store"
   "0.22.1"
   "01jjqwlg3v76b627ar6mm8bgshjv51kag16swg5cc3k1rw1w3chm"))

(define rust-core-foundation-0.10.1
  (crate-source
   "core-foundation"
   "0.10.1"
   "1xjns6dqf36rni2x9f47b65grxwdm20kwdg9lhmzdrrkwadcv9mj"))

(define rust-core-foundation-sys-0.8.7
  (crate-source
   "core-foundation-sys"
   "0.8.7"
   "12w8j73lazxmr1z0h98hf3z623kl8ms7g07jch7n4p8f9nwlhdkp"))

(define rust-cpufeatures-0.2.17
  (crate-source
   "cpufeatures"
   "0.2.17"
   "10023dnnaghhdl70xcds12fsx2b966sxbxjq5sxs49mvxqw5ivar"))

(define rust-cpufeatures-0.3.0
  (crate-source
   "cpufeatures"
   "0.3.0"
   "00fjhygsqmh4kbxxlb99mcsbspxcai6hjydv4c46pwb67wwl2alb"))

(define rust-crc-2.1.0
  (crate-source
   "crc"
   "2.1.0"
   "08qfahmly0n5j27g1vkqx9s6mxhm8k4dsp61ykskazyabdlrmz29"))

(define rust-crc-catalog-1.1.1
  (crate-source
   "crc-catalog"
   "1.1.1"
   "00qlxgzg15fnyx6nwviibz94rjw803l2avi2k3shjfx0dnsyvbnc"))

(define rust-crc32fast-1.5.0
  (crate-source
   "crc32fast"
   "1.5.0"
   "04d51liy8rbssra92p0qnwjw8i9rm9c4m3bwy19wjamz1k4w30cl"))

(define rust-crossbeam-channel-0.5.16
  (crate-source
   "crossbeam-channel"
   "0.5.16"
   "17k72dh5qqkh0xvqzr27wny7gl1l7fgzlvh2xxx71jmfgz1n6lyq"))

(define rust-crossbeam-deque-0.8.7
  (crate-source
   "crossbeam-deque"
   "0.8.7"
   "1sqcxia1mmz2fw8ba1v72jjrvbkvg7c6sz9l3sl07sv1gggf10ai"))

(define rust-crossbeam-epoch-0.9.20
  (crate-source
   "crossbeam-epoch"
   "0.9.20"
   "0gzg0v8in20iajikalg5i5qgpp0m26r426f0fs8nwk953w218s9d"))

(define rust-crossbeam-queue-0.3.13
  (crate-source
   "crossbeam-queue"
   "0.3.13"
   "09ksdjzqk1iadmsfnz46f1qvy6bbqri91hnvyklqpn097gxi6gc0"))

(define rust-crossbeam-utils-0.8.22
  (crate-source
   "crossbeam-utils"
   "0.8.22"
   "05vwf7pmjq8c8f3fp5qqdm0z3cnk4p62wi8spf0jms5yjnh3v031"))

(define rust-crossterm-0.29.0
  (crate-source
   "crossterm"
   "0.29.0"
   "0yzqxxd90k7d2ac26xq1awsznsaq0qika2nv1ik3p0vzqvjg5ffq"))

(define rust-crossterm-winapi-0.9.1
  (crate-source
   "crossterm_winapi"
   "0.9.1"
   "0axbfb2ykbwbpf1hmxwpawwfs8wvmkcka5m561l7yp36ldi7rpdc"))

(define rust-crunchy-0.2.4
  (crate-source
   "crunchy"
   "0.2.4"
   "1mbp5navim2qr3x48lyvadqblcxc1dm0lqr0swrkkwy2qblvw3s6"))

(define rust-crypto-common-0.1.7
  (crate-source
   "crypto-common"
   "0.1.7"
   "02nn2rhfy7kvdkdjl457q2z0mklcvj9h662xrq6dzhfialh2kj3q"))

(define rust-crypto-common-0.2.2
  (crate-source
   "crypto-common"
   "0.2.2"
   "0lql5wjlrjkd3r0w32rwbgqfmgg84ms3h65ldnlckmkc3nb4qvnf"))

(define rust-cssparser-0.37.0
  (crate-source
   "cssparser"
   "0.37.0"
   "165s1d8n9i181ni50fzss99gyiigfmzmwyadn217ivfm06pdm74c"))

(define rust-cssparser-macros-0.7.0
  (crate-source
   "cssparser-macros"
   "0.7.0"
   "1gsdnj7fz0wclg0cfz4nbwj659ly94321aj58bzsh474ysfsk8hh"))

(define rust-csv-1.4.0
  (crate-source
   "csv"
   "1.4.0"
   "0f7r2ip0rbi7k377c3xmsh9xd69sillffhpfmbgnvz3yrxl9vkaj"))

(define rust-csv-core-0.1.13
  (crate-source
   "csv-core"
   "0.1.13"
   "10lppd3fdb1i5npgx9xqjs5mjmy2qbdi8n16i48lg03ak4k3qjkh"))

(define rust-ctrlc-3.5.1
  (crate-source
   "ctrlc"
   "3.5.1"
   "146p40m5mj6w4nncj3wpsh0dlm0r0rjyblifp8sk1xxgqj4nlwvk"))

(define rust-ctutils-0.4.2
  (crate-source
   "ctutils"
   "0.4.2"
   "17m2s9jv7i780k26cq2fcyslg0pakv9plwdrmygdwha1hfiiambx"))

(define rust-curl-0.4.49
  (crate-source
   "curl"
   "0.4.49"
   "1g7dcrh4mwkn2q0iiga7vc8i68pd5jdby5aparpa6yxqs1nkpz3r"))

(define rust-curl-sys-0.4.85+curl-8.18.0
  (crate-source
   "curl-sys"
   "0.4.85+curl-8.18.0"
   "1nrzryl8hw1br69bagr774wrv2w8yim9x8zasgv0bk2y5caadvy0"))

(define rust-darling-0.21.3
  (crate-source
   "darling"
   "0.21.3"
   "1h281ah78pz05450r71h3gwm2n24hy8yngbz58g426l4j1q37pww"))

(define rust-darling-0.23.0
  (crate-source
   "darling"
   "0.23.0"
   "179fj6p6ajw4dnkrik51wjhifxwy02x5zhligyymcb905zd17bi5"))

(define rust-darling-core-0.21.3
  (crate-source
   "darling_core"
   "0.21.3"
   "193ya45qgac0a4siwghk0bl8im8h89p3cald7kw8ag3yrmg1jiqj"))

(define rust-darling-core-0.23.0
  (crate-source
   "darling_core"
   "0.23.0"
   "1c033vrks38vpw8kwgd5w088dsr511kfz55n9db56prkgh7sarcq"))

(define rust-darling-macro-0.21.3
  (crate-source
   "darling_macro"
   "0.21.3"
   "10ac85n4lnx3rmf5rw8lijl2c0sbl6ghcpgfmzh0s26ihbghi0yk"))

(define rust-darling-macro-0.23.0
  (crate-source
   "darling_macro"
   "0.23.0"
   "13fvzji9xyp304mgq720z5l0xgm54qj68jibwscagkynggn88fdc"))

(define rust-data-encoding-2.11.0
  (crate-source
   "data-encoding"
   "2.11.0"
   "1j00wfmk4dzn4bnib07qlhylmd6a3kizwjz8mp00iix3vlamzbm4"))

(define rust-debug-unsafe-0.1.4
  (crate-source
   "debug_unsafe"
   "0.1.4"
   "18k7m2a874i5dm1wqj2d77snjgi0qnkzly0hw8f2s5zs093jrvby"))

(define rust-der-0.8.0
  (crate-source
   "der"
   "0.8.0"
   "06s1pqid080n2fg446akx01vjiq1pafrxrb481q9kiid1dk8kzbi"))

(define rust-deranged-0.5.8
  (crate-source
   "deranged"
   "0.5.8"
   "0711df3w16vx80k55ivkwzwswziinj4dz05xci3rvmn15g615n3w"))

(define rust-derive-more-0.99.20
  (crate-source
   "derive_more"
   "0.99.20"
   "0zvz94kbc5d4r817wni1l7xk8f289nhf73vqk677p5rxlij4pnvf"))

(define rust-derive-more-2.1.1
  (crate-source
   "derive_more"
   "2.1.1"
   "0d5i10l4aff744jw7v4n8g6cv15rjk5mp0f1z522pc2nj7jfjlfp"))

(define rust-derive-more-impl-2.1.1
  (crate-source
   "derive_more-impl"
   "2.1.1"
   "1jwdp836vymp35d7mfvvalplkdgk2683nv3zjlx65n1194k9g6kr"))

(define rust-derive-setters-0.1.9
  (crate-source
   "derive_setters"
   "0.1.9"
   "1fgqkpaazyfsqgbz4k4jimcbimzvqyrq82qjhbh4mh833zxgdrmp"))

(define rust-devicons-0.6.13
  (crate-source
   "devicons"
   "0.6.13"
   "1dsl0daj6k9xybnnd763pnh4sh100g6hwmqpy54bl62lxf42yyvp"))

(define rust-diff-0.1.13
  (crate-source
   "diff"
   "0.1.13"
   "1j0nzjxci2zqx63hdcihkp0a4dkdmzxd7my4m7zk6cjyfy34j9an"))

(define rust-difflib-0.4.0
  (crate-source
   "difflib"
   "0.4.0"
   "1s7byq4d7jgf2hcp2lcqxi2piqwl8xqlharfbi8kf90n8csy7131"))

(define rust-digest-0.10.7
  (crate-source
   "digest"
   "0.10.7"
   "14p2n6ih29x81akj097lvz7wi9b6b9hvls0lwrv7b6xwyy0s5ncy"))

(define rust-digest-0.11.3
  (crate-source
   "digest"
   "0.11.3"
   "1hnmhd4rkybr11292w42pz9ppzx1h49glrhqg107k4s1b2xnvpgi"))

(define rust-dirs-5.0.1
  (crate-source
   "dirs"
   "5.0.1"
   "0992xk5vx75b2x91nw9ssb51mpl8x73j9rxmpi96cryn0ffmmi24"))

(define rust-dirs-6.0.0
  (crate-source
   "dirs"
   "6.0.0"
   "0knfikii29761g22pwfrb8d0nqpbgw77sni9h2224haisyaams63"))

(define rust-dirs-sys-0.4.1
  (crate-source
   "dirs-sys"
   "0.4.1"
   "071jy0pvaad9lsa6mzawxrh7cmr7hsmsdxwzm7jzldfkrfjha3sj"))

(define rust-dirs-sys-0.5.0
  (crate-source
   "dirs-sys"
   "0.5.0"
   "1aqzpgq6ampza6v012gm2dppx9k35cdycbj54808ksbys9k366p0"))

(define rust-dispatch2-0.3.1
  (crate-source
   "dispatch2"
   "0.3.1"
   "0f5xmnbzpaz1g80m27kd804p75nswh0ikb6wvqh4ba3x9rz3c3hy"))

(define rust-displaydoc-0.2.5
  (crate-source
   "displaydoc"
   "0.2.5"
   "1q0alair462j21iiqwrr21iabkfnb13d6x5w95lkdg21q2xrqdlp"))

(define rust-dlv-list-0.5.2
  (crate-source
   "dlv-list"
   "0.5.2"
   "0pqvrinxzdz7bpy4a3p450h8krns3bd0mc3w0qqvm03l2kskj824"))

(define rust-dns-lookup-3.0.1
  (crate-source
   "dns-lookup"
   "3.0.1"
   "07f4lvzsf0p80qh2haiq01fvpi0rk1lf783bnsxzb8i1xr606fbf"))

(define rust-doc-comment-0.3.4
  (crate-source
   "doc-comment"
   "0.3.4"
   "1j8jbrw8335hciwn3h2idkfc3kmx3pfn0sxcwjw1m8lmn6w5a2bq"))

(define rust-doctest-file-1.0.0
  (crate-source
   "doctest-file"
   "1.0.0"
   "0qkmnrsx2kszm58wxyry63bs35msj9chdb6jlh54a8cdwaiizj5a"))

(define rust-document-features-0.2.12
  (crate-source
   "document-features"
   "0.2.12"
   "0qcgpialq3zgvjmsvar9n6v10rfbv6mk6ajl46dd4pj5hn3aif6l"))

(define rust-downcast-rs-1.2.1
  (crate-source
   "downcast-rs"
   "1.2.1"
   "1lmrq383d1yszp7mg5i7i56b17x2lnn3kb91jwsq0zykvg2jbcvm"))

(define rust-doxygen-rs-0.4.2
  (crate-source
   "doxygen-rs"
   "0.4.2"
   "1n872n45ivhj3pqfwhbi7cvx00rn76a72x368ricykfkh33nwns1"))

(define rust-dtoa-1.0.11
  (crate-source
   "dtoa"
   "1.0.11"
   "1405jvczpxf1zd3nsvw02r50hr2k6argq6jkgdf04prd9s1g8g2c"))

(define rust-dtoa-short-0.3.5
  (crate-source
   "dtoa-short"
   "0.3.5"
   "11rwnkgql5jilsmwxpx6hjzkgyrbdmx1d71s0jyrjqm5nski25fd"))

(define rust-dtparse-2.0.1
  (crate-source
   "dtparse"
   "2.0.1"
   "1mqz4164mc4xyq73c22wf900v8cn4sy63nalrkr5mlr614y41yr3"))

(define rust-dunce-1.0.5
  (crate-source
   "dunce"
   "1.0.5"
   "04y8wwv3vvcqaqmqzssi6k0ii9gs6fpz96j5w9nky2ccsl23axwj"))

(define rust-dyn-clone-1.0.20
  (crate-source
   "dyn-clone"
   "1.0.20"
   "0m956cxcg8v2n8kmz6xs5zl13k2fak3zkapzfzzp7pxih6hix26h"))

(define rust-edit-0.1.5
  (crate-source
   "edit"
   "0.1.5"
   "02dan6bg9pcj42ny48g8fq9f76w30c826n4gihy1d1s7fq78cr7k"))

(define rust-edtui-0.11.2
  (crate-source
   "edtui"
   "0.11.2"
   "1y6pqwapv7av6icdxk96xrydyf6388nwbj8kxikvff53k31cz36a"))

(define rust-edtui-jagged-0.1.13
  (crate-source
   "edtui-jagged"
   "0.1.13"
   "1mixwqgr2hyyvwgfpzxabd7f6nnl4wg37dlifhpsagcbdcnqp0f6"))

(define rust-ego-tree-0.11.0
  (crate-source
   "ego-tree"
   "0.11.0"
   "1qwqhi80xy418zs72ix3rgsymdkz0gk1ligjv5wil5agisiwakdh"))

(define rust-either-1.15.0
  (crate-source
   "either"
   "1.15.0"
   "069p1fknsmzn9llaizh77kip0pqmcwpdsykv2x30xpjyija5gis8"))

(define rust-eml-parser-0.1.5
  (crate-source
   "eml-parser"
   "0.1.5"
   "0vgbjv2s8k5ar3l4yxqwda626bnyz0gw1x9pcdq4gymv7cr6smzp"))

(define rust-encode-unicode-1.0.0
  (crate-source
   "encode_unicode"
   "1.0.0"
   "1h5j7j7byi289by63s3w4a8b3g6l5ccdrws7a67nn07vdxj77ail"))

(define rust-encoding-rs-0.8.35
  (crate-source
   "encoding_rs"
   "0.8.35"
   "1wv64xdrr9v37rqqdjsyb8l8wzlcbab80ryxhrszvnj59wy0y0vm"))

(define rust-encoding-rs-io-0.1.7
  (crate-source
   "encoding_rs_io"
   "0.1.7"
   "10ra4l688cdadd8h1lsbahld1zbywnnqv68366mbhamn3xjwbhqw"))

(define rust-enum-dispatch-0.3.13
  (crate-source
   "enum_dispatch"
   "0.3.13"
   "1kby2jz173ggg7wk41vjsskmkdyx7749ll8lhqhv6mb5qqmww65a"))

(define rust-env-filter-1.0.0
  (crate-source
   "env_filter"
   "1.0.0"
   "13rhwy5arjn626a0z3hvvkpf9w9pnll14c35vscyqx3jwp43q73s"))

(define rust-env-logger-0.11.9
  (crate-source
   "env_logger"
   "0.11.9"
   "13913sqpnhv741z5ixmcy5j3nnml53gmsllnhajjkx2ili7fxnmj"))

(define rust-equivalent-1.0.2
  (crate-source
   "equivalent"
   "1.0.2"
   "03swzqznragy8n0x31lqc78g2af054jwivp7lkrbrc0khz74lyl7"))

(define rust-erased-serde-0.4.10
  (crate-source
   "erased-serde"
   "0.4.10"
   "1v1dy16ff8mck2rfqdmwdxl14phlvr8rq0i7yqzxka6ngnhdibfj"))

(define rust-errno-0.3.14
  (crate-source
   "errno"
   "0.3.14"
   "1szgccmh8vgryqyadg8xd58mnwwicf39zmin3bsn63df2wbbgjir"))

(define rust-error-code-3.3.2
  (crate-source
   "error-code"
   "3.3.2"
   "0nacxm9xr3s1rwd6fabk3qm89fyglahmbi4m512y0hr8ym6dz8ny"))

(define rust-etcetera-0.10.0
  (crate-source
   "etcetera"
   "0.10.0"
   "1rka6bskn93pdhx32xaagr147q95z5bnz7ym5xr85jw00wyv3ir6"))

(define rust-ethnum-1.5.3
  (crate-source
   "ethnum"
   "1.5.3"
   "0pw35s7spvgkn3bvmyv9pgyhkhqplzvdsrp8dzdc87jibwzlqh20"))

(define rust-event-listener-5.4.1
  (crate-source
   "event-listener"
   "5.4.1"
   "1asnp3agbr8shcl001yd935m167ammyi8hnvl0q1ycajryn6cfz1"))

(define rust-event-listener-strategy-0.5.4
  (crate-source
   "event-listener-strategy"
   "0.5.4"
   "14rv18av8s7n8yixg38bxp5vg2qs394rl1w052by5npzmbgz7scb"))

(define rust-fallible-iterator-0.3.0
  (crate-source
   "fallible-iterator"
   "0.3.0"
   "0ja6l56yka5vn4y4pk6hn88z0bpny7a8k1919aqjzp0j1yhy9k1a"))

(define rust-fallible-streaming-iterator-0.1.9
  (crate-source
   "fallible-streaming-iterator"
   "0.1.9"
   "0nj6j26p71bjy8h42x6jahx1hn0ng6mc2miwpgwnp8vnwqf4jq3k"))

(define rust-fancy-regex-0.19.0
  (crate-source
   "fancy-regex"
   "0.19.0"
   "1rl0sln9b1ji1q425364aqfvyc5l837z3s2fma889vzjvlxyfva7"))

(define rust-fast-float2-0.2.3
  (crate-source
   "fast-float2"
   "0.2.3"
   "0mbadcgq221clfpihsfiahizfsgfwk8n3dbgi1fd48vlbi65dszq"))

(define rust-fastrand-2.3.0
  (crate-source
   "fastrand"
   "2.3.0"
   "1ghiahsw1jd68df895cy5h3gzwk30hndidn3b682zmshpgmrx41p"))

(define rust-fax-0.2.6
  (crate-source
   "fax"
   "0.2.6"
   "1ax0jmvsszxd03hj6ga1kyl7gaqcfw0akg2wf0q6gk9pizaffpgh"))

(define rust-fax-derive-0.2.0
  (crate-source
   "fax_derive"
   "0.2.0"
   "0zap434zz4xvi5rnysmwzzivig593b4ng15vwzwl7js2nw7s3b50"))

(define rust-fd-lock-4.0.4
  (crate-source
   "fd-lock"
   "4.0.4"
   "0y5a22zaqns06slndm64gjdx983i6b4l4ks895rxznnn4bv2zs8c"))

(define rust-fdeflate-0.3.7
  (crate-source
   "fdeflate"
   "0.3.7"
   "130ga18vyxbb5idbgi07njymdaavvk6j08yh1dfarm294ssm6s0y"))

(define rust-fff-grep-0.10.3
  (crate-source
   "fff-grep"
   "0.10.3"
   "0fjrwcfk5gip0bqaf2rfjs6k7jh73wnjj2kgqkr60jrrd4n5zn4f"))

(define rust-fff-notify-debouncer-full-0.9.4
  (crate-source
   "fff-notify-debouncer-full"
   "0.9.4"
   "0cc7iclq1kh3jz3lms7ax0y3213gdwwvz2rmb76l0a4aggmfp919"))

(define rust-fff-query-parser-0.10.3
  (crate-source
   "fff-query-parser"
   "0.10.3"
   "0k01gg68h3c1gqvmnfz4vbxh1q5asx70hqzav7sf5wpkm1xr4ia8"))

(define rust-fff-search-0.10.3
  (crate-source
   "fff-search"
   "0.10.3"
   "08vvb7r5wzqcsik7ipni45accad5p960d7c7p1zyiagybzf6rlyd"))

(define rust-file-id-0.2.3
  (crate-source
   "file-id"
   "0.2.3"
   "1s96rjij7gdbs4j70k1xjfqfr1zi1wbxkpaff4a89ibdgdinmz71"))

(define rust-filedescriptor-0.8.3
  (crate-source
   "filedescriptor"
   "0.8.3"
   "0bb8qqa9h9sj2mzf09yqxn260qkcqvmhmyrmdjvyxcn94knmh1z4"))

(define rust-filesize-0.2.0
  (crate-source
   "filesize"
   "0.2.0"
   "0hvx4dfnara3a2dnhb9ci5bmm1m8s44h9l61s5djwkjx87i43mqj"))

(define rust-filetime-0.2.29
  (crate-source
   "filetime"
   "0.2.29"
   "0napyyfccb26r7fyh9hg7ixrh4vph9h7y7k4iv1j19phqwrpla2w"))

(define rust-find-msvc-tools-0.1.9
  (crate-source
   "find-msvc-tools"
   "0.1.9"
   "10nmi0qdskq6l7zwxw5g56xny7hb624iki1c39d907qmfh3vrbjv"))

(define rust-fixedbitset-0.5.7
  (crate-source
   "fixedbitset"
   "0.5.7"
   "16fd3v9d2cms2vddf9xhlm56sz4j0zgrk3d2h6v1l7hx760lwrqx"))

(define rust-flate2-1.1.9
  (crate-source
   "flate2"
   "1.1.9"
   "0g2pb7cxnzcbzrj8bw4v6gpqqp21aycmf6d84rzb6j748qkvlgw4"))

(define rust-float-cmp-0.10.0
  (crate-source
   "float-cmp"
   "0.10.0"
   "1n760i3nxd2x0zc7fkxkg3vhvdyfbvzngna006cl9s9jacaz775h"))

(define rust-fluent-0.17.0
  (crate-source
   "fluent"
   "0.17.0"
   "0xq4cxw4mkdh1k9i5w850sky0m41la8sm6nbpw76n3f5lbascdw1"))

(define rust-fluent-bundle-0.16.0
  (crate-source
   "fluent-bundle"
   "0.16.0"
   "1x1v8bmym6x9pl87f82lbzwlc84kdn0lgcwi73ki2mwgj6w3q801"))

(define rust-fluent-langneg-0.13.1
  (crate-source
   "fluent-langneg"
   "0.13.1"
   "1c78jl8lpwg5hdg589qbn3m9ls6mzqxnyrvi5llfibhb8mcvxsvy"))

(define rust-fluent-syntax-0.12.0
  (crate-source
   "fluent-syntax"
   "0.12.0"
   "1661sp6kl268n445x7jjhnbkgiaa1xcpyryq0i6iiz9zqn3x5w2l"))

(define rust-fluent-uri-0.1.4
  (crate-source
   "fluent-uri"
   "0.1.4"
   "03ah2qajw5l1zbc81kh1n8g7n24mfxbg6vqyv9ixipg1vglh9iqp"))

(define rust-fnv-1.0.7
  (crate-source
   "fnv"
   "1.0.7"
   "1hc2mcqha06aibcaza94vbi81j6pr9a1bbxrxjfhc91zin8yr7iz"))

(define rust-foldhash-0.1.5
  (crate-source
   "foldhash"
   "0.1.5"
   "1wisr1xlc2bj7hk4rgkcjkz3j2x4dhd1h9lwk7mj8p71qpdgbi6r"))

(define rust-foldhash-0.2.0
  (crate-source
   "foldhash"
   "0.2.0"
   "1nvgylb099s11xpfm1kn2wcsql080nqmnhj1l25bp3r2b35j9kkp"))

(define rust-foreign-types-0.3.2
  (crate-source
   "foreign-types"
   "0.3.2"
   "1cgk0vyd7r45cj769jym4a6s7vwshvd0z4bqrb92q1fwibmkkwzn"))

(define rust-foreign-types-shared-0.1.1
  (crate-source
   "foreign-types-shared"
   "0.1.1"
   "0jxgzd04ra4imjv8jgkmdq59kj8fsz6w4zxsbmlai34h26225c00"))

(define rust-form-urlencoded-1.2.2
  (crate-source
   "form_urlencoded"
   "1.2.2"
   "1kqzb2qn608rxl3dws04zahcklpplkd5r1vpabwga5l50d2v4k6b"))

(define rust-fs4-0.13.1
  (crate-source
   "fs4"
   "0.13.1"
   "1m0y2kmwzifkrivw7gjav0km5s9agaiv324yrq424rgpi15y6h46"))

(define rust-fs-extra-1.3.0
  (crate-source
   "fs_extra"
   "1.3.0"
   "075i25z70j2mz9r7i9p9r521y8xdj81q7skslyb7zhqnnw33fw22"))

(define rust-fsevent-sys-4.1.0
  (crate-source
   "fsevent-sys"
   "4.1.0"
   "1liz67v8b0gcs8r31vxkvm2jzgl9p14i78yfqx81c8sdv817mvkn"))

(define rust-futf-0.1.5
  (crate-source
   "futf"
   "0.1.5"
   "0hvqk2r7v4fnc34hvc3vkri89gn52d5m9ihygmwn75l1hhp0whnz"))

(define rust-futures-0.3.32
  (crate-source
   "futures"
   "0.3.32"
   "0b9q86r5ar18v5xjiyqn7sb8sa32xv98qqnfz779gl7ns7lpw54b"))

(define rust-futures-channel-0.3.32
  (crate-source
   "futures-channel"
   "0.3.32"
   "07fcyzrmbmh7fh4ainilf1s7gnwvnk07phdq77jkb9fpa2ffifq7"))

(define rust-futures-core-0.3.32
  (crate-source
   "futures-core"
   "0.3.32"
   "07bbvwjbm5g2i330nyr1kcvjapkmdqzl4r6mqv75ivvjaa0m0d3y"))

(define rust-futures-executor-0.3.32
  (crate-source
   "futures-executor"
   "0.3.32"
   "17aplz3ns74qn7a04qg7qlgsdx5iwwwkd4jvdfra6hl3h4w9rwms"))

(define rust-futures-io-0.3.32
  (crate-source
   "futures-io"
   "0.3.32"
   "063pf5m6vfmyxj74447x8kx9q8zj6m9daamj4hvf49yrg9fs7jyf"))

(define rust-futures-macro-0.3.32
  (crate-source
   "futures-macro"
   "0.3.32"
   "0ys4b1lk7s0bsj29pv42bxsaavalch35rprp64s964p40c1bfdg8"))

(define rust-futures-sink-0.3.32
  (crate-source
   "futures-sink"
   "0.3.32"
   "14q8ml7hn5a6gyy9ri236j28kh0svqmrk4gcg0wh26rkazhm95y3"))

(define rust-futures-task-0.3.32
  (crate-source
   "futures-task"
   "0.3.32"
   "14s3vqf8llz3kjza33vn4ixg6kwxp61xrysn716h0cwwsnri2xq3"))

(define rust-futures-util-0.3.32
  (crate-source
   "futures-util"
   "0.3.32"
   "1mn60lw5kh32hz9isinjlpw34zx708fk5q1x0m40n6g6jq9a971q"))

(define rust-gatekeeper-3.0.0
  (crate-source
   "gatekeeper"
   "3.0.0"
   "0p3kvqh6m9gz7ibmlmvf83nccd095g65h56xih5xa246y1azlg1v"))

(define rust-generic-array-0.14.7
  (crate-source
   "generic-array"
   "0.14.7"
   "16lyyrzrljfq424c3n8kfwkqihlimmsg5nhshbbp48np3yjrqr45"))

(define rust-gethostname-1.1.0
  (crate-source
   "gethostname"
   "1.1.0"
   "1n6bj9gh503ggjblfjcai96gmxynxsrykaynljlrfdra34q95m0v"))

(define rust-getrandom-0.2.17
  (crate-source
   "getrandom"
   "0.2.17"
   "1l2ac6jfj9xhpjjgmcx6s1x89bbnw9x6j9258yy6xjkzpq0bqapz"))

(define rust-getrandom-0.3.4
  (crate-source
   "getrandom"
   "0.3.4"
   "1zbpvpicry9lrbjmkd4msgj3ihff1q92i334chk7pzf46xffz7c9"))

(define rust-getrandom-0.4.2
  (crate-source
   "getrandom"
   "0.4.2"
   "0mb5833hf9pvn9dhvxjgfg5dx0m77g8wavvjdpvpnkp9fil1xr8d"))

(define rust-gimli-0.32.3
  (crate-source
   "gimli"
   "0.32.3"
   "1iqk5xznimn5bfa8jy4h7pa1dv3c624hzgd2dkz8mpgkiswvjag6"))

(define rust-git2-0.21.0
  (crate-source
   "git2"
   "0.21.0"
   "0bmqga9vlyx5sdlr0i28z0362s89xv9i4qcv20vvx9j54y9vzpfx"))

(define rust-gjson-0.8.1
  (crate-source
   "gjson"
   "0.8.1"
   "1dlp19c42f3qlzckxqwvc6svhfc3hdpg7x95cl5d6k9rfv0kql23"))

(define rust-glidesort-0.1.2
  (crate-source
   "glidesort"
   "0.1.2"
   "1q79y8qgpf75y8sx51qb1858h5q48vj63hbg305kwkb4xgk05qgj"))

(define rust-glob-0.3.3
  (crate-source
   "glob"
   "0.3.3"
   "106jpd3syfzjfj2k70mwm0v436qbx96wig98m4q8x071yrq35hhc"))

(define rust-glob-match-0.2.1
  (crate-source
   "glob-match"
   "0.2.1"
   "178bjn684dd50px9n8lwa72fn94566d9wmcp86m9h8a17d8ck1cr"))

(define rust-globset-0.4.19
  (crate-source
   "globset"
   "0.4.19"
   "1k89ff27dk6x3386nsavqflpdf723c3vf2mnhi42ar24mv93fzg4"))

(define rust-goblin-0.7.1
  (crate-source
   "goblin"
   "0.7.1"
   "0d11fk9bdxzf228xpr8v6d6a01dib00khjg5bldk9kf2d51inz7j"))

(define rust-granit-parser-1.0.0
  (crate-source
   "granit-parser"
   "1.0.0"
   "1n115mwlxjc9zib52xvim046p4vra8jm4ndlnqj6xf126nq8h0y6"))

(define rust-h2-0.4.18
  (crate-source
   "h2"
   "0.4.18"
   "0a52hs8cakvg7xi3pxqi83vganyaasxn545ya8v74f8j3250x743"))

(define rust-half-2.7.1
  (crate-source
   "half"
   "2.7.1"
   "0jyq42xfa6sghc397mx84av7fayd4xfxr4jahsqv90lmjr5xi8kf"))

(define rust-halfbrown-0.4.0
  (crate-source
   "halfbrown"
   "0.4.0"
   "02fs358fs50ii6yqhkx4mwz9rfqzlh4pk13b334192mdxprd4zhc"))

(define rust-hash32-0.3.1
  (crate-source
   "hash32"
   "0.3.1"
   "01h68z8qi5gl9lnr17nz10lay8wjiidyjdyd60kqx8ibj090pmj7"))

(define rust-hashbrown-0.12.3
  (crate-source
   "hashbrown"
   "0.12.3"
   "1268ka4750pyg2pbgsr43f0289l5zah4arir2k4igx5a8c6fg7la"))

(define rust-hashbrown-0.14.5
  (crate-source
   "hashbrown"
   "0.14.5"
   "1wa1vy1xs3mp11bn3z9dv0jricgr6a2j0zkf1g19yz3vw4il89z5"))

(define rust-hashbrown-0.15.5
  (crate-source
   "hashbrown"
   "0.15.5"
   "189qaczmjxnikm9db748xyhiw04kpmhm9xj9k9hg0sgx7pjwyacj"))

(define rust-hashbrown-0.16.1
  (crate-source
   "hashbrown"
   "0.16.1"
   "004i3njw38ji3bzdp9z178ba9x3k0c1pgy8x69pj7yfppv4iq7c4"))

(define rust-hashbrown-0.17.0
  (crate-source
   "hashbrown"
   "0.17.0"
   "0l8gvcz80lvinb7x22h53cqbi2y1fm603y2jhhh9qwygvkb7sijg"))

(define rust-hashlink-0.12.0
  (crate-source
   "hashlink"
   "0.12.0"
   "0fssgkd0bzyk7fm8fi88iciag84xpfv7hisbxabfxbfp9qk1y255"))

(define rust-heapless-0.9.2
  (crate-source
   "heapless"
   "0.9.2"
   "1vc9rp0swh5msr964c9vrcxl8v8qf15qqxmim69b5ckxfmglbwia"))

(define rust-heck-0.5.0
  (crate-source
   "heck"
   "0.5.0"
   "1sjmpsdl8czyh9ywl3qcsfsq9a307dg4ni2vnlwgnzzqhc4y0113"))

(define rust-heed-0.22.1
  (crate-source
   "heed"
   "0.22.1"
   "00h23c51jmv72wlh8q5yfrkmnx9b52ys2n5pr0asq7fgiicxd0md"))

(define rust-heed-traits-0.20.0
  (crate-source
   "heed-traits"
   "0.20.0"
   "1zvlxz1jf7zwzklr2accgvggrs4n6s81mihsbb75fk20il230cgb"))

(define rust-heed-types-0.21.0
  (crate-source
   "heed-types"
   "0.21.0"
   "0pd505f6fwhn76kpc70rsx052f0zr3f3c2hj1n2gn1vfyjymbhhk"))

(define rust-hermit-abi-0.5.2
  (crate-source
   "hermit-abi"
   "0.5.2"
   "1744vaqkczpwncfy960j2hxrbjl1q01csm84jpd9dajbdr2yy3zw"))

(define rust-hex-0.4.3
  (crate-source
   "hex"
   "0.4.3"
   "0w1a4davm1lgzpamwnba907aysmlrnygbqmfis2mqjx5m552a93z"))

(define rust-hmac-0.13.0
  (crate-source
   "hmac"
   "0.13.0"
   "0gw6avmix6ah63lf70dapxhml4dlcakl9f2lnm6b0hdf6abvq0v3"))

(define rust-home-0.5.12
  (crate-source
   "home"
   "0.5.12"
   "13bjyzgx6q9srnfvl43dvmhn93qc8mh5w7cylk2g13sj3i3pyqnc"))

(define rust-html5ever-0.27.0
  (crate-source
   "html5ever"
   "0.27.0"
   "1m24sbpk572f5qhhkj4kkxvsd64rn968s0vxwvqlds76w2pp2dy1"))

(define rust-html5ever-0.39.0
  (crate-source
   "html5ever"
   "0.39.0"
   "1f5pphabfbywvvf6xy86cc31803182zlp546kshwkk7s0wc7d8a6"))

(define rust-http-0.2.12
  (crate-source
   "http"
   "0.2.12"
   "1w81s4bcbmcj9bjp7mllm8jlz6b31wzvirz8bgpzbqkpwmbvn730"))

(define rust-http-1.5.0
  (crate-source
   "http"
   "1.5.0"
   "1q4wpz5hb4cf37g3jrdyffrpa6ngidmd9wrfph92fddzprl3b3ci"))

(define rust-http-body-0.4.6
  (crate-source
   "http-body"
   "0.4.6"
   "1lmyjfk6bqk6k9gkn1dxq770sb78pqbqshga241hr5p995bb5skw"))

(define rust-http-body-1.0.1
  (crate-source
   "http-body"
   "1.0.1"
   "111ir5k2b9ihz5nr9cz7cwm7fnydca7dx4hc7vr16scfzghxrzhy"))

(define rust-http-body-util-0.1.3
  (crate-source
   "http-body-util"
   "0.1.3"
   "0jm6jv4gxsnlsi1kzdyffjrj8cfr3zninnxpw73mvkxy4qzdj8dh"))

(define rust-httparse-1.10.1
  (crate-source
   "httparse"
   "1.10.1"
   "11ycd554bw2dkgw0q61xsa7a4jn1wb1xbfacmf3dbwsikvkkvgvd"))

(define rust-httpdate-1.0.3
  (crate-source
   "httpdate"
   "1.0.3"
   "1aa9rd2sac0zhjqh24c9xvir96g188zldkx0hr6dnnlx5904cfyz"))

(define rust-human-date-parser-0.3.1
  (crate-source
   "human-date-parser"
   "0.3.1"
   "03hiqw8yxsi6ps0fzmykqghc08pszsjfjap57ccckcp4dp2q6vs0"))

(define rust-humantime-2.4.0
  (crate-source
   "humantime"
   "2.4.0"
   "059w9i1g0gmfg30axhqh10fvqpym4frsz9iggqlm673h0xkx5k8m"))

(define rust-hybrid-array-0.4.13
  (crate-source
   "hybrid-array"
   "0.4.13"
   "133c3dg885v2i2xllzq42cjg93z7zdmajz431zjys7rc2g2md0w1"))

(define rust-hyper-1.8.1
  (crate-source
   "hyper"
   "1.8.1"
   "04cxr8j5y86bhxxlyqb8xkxjskpajk7cxwfzzk4v3my3a3rd9cia"))

(define rust-hyper-rustls-0.27.7
  (crate-source
   "hyper-rustls"
   "0.27.7"
   "0n6g8998szbzhnvcs1b7ibn745grxiqmlpg53xz206v826v3xjg3"))

(define rust-hyper-tls-0.6.0
  (crate-source
   "hyper-tls"
   "0.6.0"
   "1q36x2yps6hhvxq5r7mc8ph9zz6xlb573gx0x3yskb0fi736y83h"))

(define rust-hyper-util-0.1.20
  (crate-source
   "hyper-util"
   "0.1.20"
   "186zdc58hmm663csmjvrzgkr6jdh93sfmi3q2pxi57gcaqjpqm4n"))

(define rust-iana-time-zone-0.1.65
  (crate-source
   "iana-time-zone"
   "0.1.65"
   "0w64khw5p8s4nzwcf36bwnsmqzf61vpwk9ca1920x82bk6nwj6z3"))

(define rust-iana-time-zone-haiku-0.1.2
  (crate-source
   "iana-time-zone-haiku"
   "0.1.2"
   "17r6jmj31chn7xs9698r122mapq85mfnv98bb4pg6spm0si2f67k"))

(define rust-ical-0.11.0
  (crate-source
   "ical"
   "0.11.0"
   "1xkrs9a48qzbzf6mbrnsvj9i51h2z44l7h7236d75dx88dssnz4v"))

(define rust-icu-collections-2.1.1
  (crate-source
   "icu_collections"
   "2.1.1"
   "0hsblchsdl64q21qwrs4hvc2672jrf466zivbj1bwyv606bn8ssc"))

(define rust-icu-locale-core-2.1.1
  (crate-source
   "icu_locale_core"
   "2.1.1"
   "1djvdc2f5ylmp1ymzv4gcnmq1s4hqfim9nxlcm173lsd01hpifpd"))

(define rust-icu-normalizer-2.1.1
  (crate-source
   "icu_normalizer"
   "2.1.1"
   "16dmn5596la2qm0r3vih0bzjfi0vx9a20yqjha6r1y3vnql8hv2z"))

(define rust-icu-normalizer-data-2.1.1
  (crate-source
   "icu_normalizer_data"
   "2.1.1"
   "02jnzizg6q75m41l6c13xc7nkc5q8yr1b728dcgfhpzw076wrvbs"))

(define rust-icu-properties-2.1.2
  (crate-source
   "icu_properties"
   "2.1.2"
   "1v3lbmhhi7i6jgw51ikjb1p50qh5rb67grlkdnkc63l7zq1gq2q2"))

(define rust-icu-properties-data-2.1.2
  (crate-source
   "icu_properties_data"
   "2.1.2"
   "1bvpkh939rgzrjfdb7hz47v4wijngk0snmcgrnpwc9fpz162jv31"))

(define rust-icu-provider-2.1.1
  (crate-source
   "icu_provider"
   "2.1.1"
   "0576b7dizgyhpfa74kacv86y4g1p7v5ffd6c56kf1q82rvq2r5l5"))

(define rust-id-arena-2.3.0
  (crate-source
   "id-arena"
   "2.3.0"
   "0m6rs0jcaj4mg33gkv98d71w3hridghp5c4yr928hplpkgbnfc1x"))

(define rust-ident-case-1.0.1
  (crate-source
   "ident_case"
   "1.0.1"
   "0fac21q6pwns8gh1hz3nbq15j8fi441ncl6w4vlnd1cmc55kiq5r"))

(define rust-idna-1.1.0
  (crate-source
   "idna"
   "1.1.0"
   "1pp4n7hppm480zcx411dsv9wfibai00wbpgnjj4qj0xa7kr7a21v"))

(define rust-idna-adapter-1.2.1
  (crate-source
   "idna_adapter"
   "1.2.1"
   "0i0339pxig6mv786nkqcxnwqa87v4m94b2653f6k3aj0jmhfkjis"))

(define rust-ignore-0.4.29
  (crate-source
   "ignore"
   "0.4.29"
   "0hm7bfm1c4gzhiwigkd3srm7xm1fcxy3pynnvmcqw4vsajha7zyl"))

(define rust-image-0.25.10
  (crate-source
   "image"
   "0.25.10"
   "0131b9fsd5grxf3lchfs2ci0rg8ga2mh1ygai7k2zh1k8cwq1aw5"))

(define rust-indexmap-1.9.3
  (crate-source
   "indexmap"
   "1.9.3"
   "16dxmy7yvk51wvnih3a3im6fp5lmx0wx76i03n06wyak6cwhw1xx"))

(define rust-indexmap-2.14.0
  (crate-source
   "indexmap"
   "2.14.0"
   "1na9z6f0d5pkjr1lgsni470v98gv2r7c41j8w48skr089x2yjrnl"))

(define rust-indicatif-0.18.4
  (crate-source
   "indicatif"
   "0.18.4"
   "1sz9p1a7i0z666psqzjdpi8xa11icmnpfd4q4dyxm4ihh0ihyir5"))

(define rust-indoc-2.0.7
  (crate-source
   "indoc"
   "2.0.7"
   "01np60qdq6lvgh8ww2caajn9j4dibx9n58rvzf7cya1jz69mrkvr"))

(define rust-inotify-0.11.1
  (crate-source
   "inotify"
   "0.11.1"
   "16fiffnqhfdwzgrv3wcnaih0a9xbx1a44nma1yn5idr83apkwnxx"))

(define rust-inotify-sys-0.1.5
  (crate-source
   "inotify-sys"
   "0.1.5"
   "1syhjgvkram88my04kv03s0zwa66mdwa5v7ddja3pzwvx2sh4p70"))

(define rust-instability-0.3.11
  (crate-source
   "instability"
   "0.3.11"
   "07f1apjp00nzkwmzfzlfm6p4klddf0g2scgdhqnds66dqq2p4yrm"))

(define rust-interprocess-2.4.2
  (crate-source
   "interprocess"
   "2.4.2"
   "0nsr54v0i2ac0cfnccf5ks8vcdhxj7nw3rcgdaq7mjq06is274q6"))

(define rust-intl-memoizer-0.5.3
  (crate-source
   "intl-memoizer"
   "0.5.3"
   "0gqn5wwhzacvj0z25r5r3l2pajg9c8i1ivh7g8g8dszm8pis439i"))

(define rust-intl-pluralrules-7.0.2
  (crate-source
   "intl_pluralrules"
   "7.0.2"
   "0wprd3h6h8nfj62d8xk71h178q7zfn3srxm787w4sawsqavsg3h7"))

(define rust-inventory-0.3.22
  (crate-source
   "inventory"
   "0.3.22"
   "09vjkq51bsm08f7i1p0x2h0dsxg03b8crc6sfb5q4w3yr12y16h0"))

(define rust-ipnet-2.12.0
  (crate-source
   "ipnet"
   "2.12.0"
   "1qpq2y0asyv0jppw7zww9y96fpnpinwap8a0phhqqgyy3znnz3yr"))

(define rust-iri-string-0.7.10
  (crate-source
   "iri-string"
   "0.7.10"
   "06kk3a5jz576p7vrpf7zz9jv3lrgcyp7pczcblcxdnryg3q3h4y9"))

(define rust-is-docker-0.2.0
  (crate-source
   "is-docker"
   "0.2.0"
   "1cyibrv6817cqcpf391m327ss40xlbik8wxcv5h9pj9byhksx2wj"))

(define rust-is-wsl-0.4.0
  (crate-source
   "is-wsl"
   "0.4.0"
   "19bs5pq221d4bknnwiqqkqrnsx2in0fsk8fylxm1747iim4hjdhp"))

(define rust-is-ci-1.2.0
  (crate-source
   "is_ci"
   "1.2.0"
   "0ifwvxmrsj4r29agfzr71bjq6y1bihkx38fbzafq5vl0jn1wjmbn"))

(define rust-is-debug-1.1.0
  (crate-source
   "is_debug"
   "1.1.0"
   "01yl28nv69wsqiyyhfbgx52yskpjyw5z4xq137c33ja3wb96dqhz"))

(define rust-is-executable-1.0.5
  (crate-source
   "is_executable"
   "1.0.5"
   "1i78ss45h94nwabbn6ki64a91djlli8zdwwbh56jj9kvhssbiaxs"))

(define rust-is-terminal-polyfill-1.70.2
  (crate-source
   "is_terminal_polyfill"
   "1.70.2"
   "15anlc47sbz0jfs9q8fhwf0h3vs2w4imc030shdnq54sny5i7jx6"))

(define rust-itertools-0.13.0
  (crate-source
   "itertools"
   "0.13.0"
   "11hiy3qzl643zcigknclh446qb9zlg4dpdzfkjaa9q9fqpgyfgj1"))

(define rust-itertools-0.14.0
  (crate-source
   "itertools"
   "0.14.0"
   "118j6l1vs2mx65dqhwyssbrxpawa90886m3mzafdvyip41w2q69b"))

(define rust-itertools-0.15.0
  (crate-source
   "itertools"
   "0.15.0"
   "1p412hriqm4kxn7x1539vz2p5c5s1v2m36m4kis2ai4dyn9syjwb"))

(define rust-itoa-1.0.17
  (crate-source
   "itoa"
   "1.0.17"
   "1lh93xydrdn1g9x547bd05g0d3hra7pd1k4jfd2z1pl1h5hwdv4j"))

(define rust-jiff-0.2.23
  (crate-source
   "jiff"
   "0.2.23"
   "0nc37n7jvgrzxdkcgc2hsfdf70lfagigjalh4igjrm5njvf4cd8s"))

(define rust-jiff-static-0.2.23
  (crate-source
   "jiff-static"
   "0.2.23"
   "192ss3cnixvg79cpa76clwkhn4mmz10vnwsbf7yjw8i484s8p31a"))

(define rust-jiff-tzdb-0.1.6
  (crate-source
   "jiff-tzdb"
   "0.1.6"
   "0xihzlnnyk0xnrzpq4xcyjdcmy8xc3ychzb9ayjkh4vgha2fy069"))

(define rust-jiff-tzdb-platform-0.1.3
  (crate-source
   "jiff-tzdb-platform"
   "0.1.3"
   "1s1ja692wyhbv7f60mc0x90h7kn1pv65xkqi2y4imarbmilmlnl7"))

(define rust-jni-0.21.1
  (crate-source
   "jni"
   "0.21.1"
   "15wczfkr2r45slsljby12ymf2hij8wi5b104ghck9byjnwmsm1qs"))

(define rust-jni-sys-0.3.0
  (crate-source
   "jni-sys"
   "0.3.0"
   "0c01zb9ygvwg9wdx2fii2d39myzprnpqqhy7yizxvjqp5p04pbwf"))

(define rust-jobserver-0.1.34
  (crate-source
   "jobserver"
   "0.1.34"
   "0cwx0fllqzdycqn4d6nb277qx5qwnmjdxdl0lxkkwssx77j3vyws"))

(define rust-js-sys-0.3.91
  (crate-source
   "js-sys"
   "0.3.91"
   "171rzgq33wc1nxkgnvhlqqwwnrifs13mg3jjpjj5nf1z0yvib5xl"))

(define rust-jsonpath-lib-polars-vendor-0.0.1
  (crate-source
   "jsonpath_lib_polars_vendor"
   "0.0.1"
   "0z8b92zhm1mrmb6fv95v2g5kqs6vmg5fl4zp3x3zf8knjia97ggl"))

(define rust-kasuari-0.4.11
  (crate-source
   "kasuari"
   "0.4.11"
   "0nqa4gkq9jgznnqs8yxzv200lysiny4m152zgn68abk6a08hrscg"))

(define rust-kdl-4.7.1
  (crate-source
   "kdl"
   "4.7.1"
   "05wimwqd2fh4a35fmx3k4lm3b973mv1chrld11hyfvwjqnb2wgp0"))

(define rust-kdl-6.7.1
  (crate-source
   "kdl"
   "6.7.1"
   "0w6nbv951063fj72yxyv6wcgzpzypqbmsr8j8kh6zmxcna0xyb88"))

(define rust-kitest-0.6.0
  (crate-source
   "kitest"
   "0.6.0"
   "1b6jks78gd0xbgf2pra52snxm0461w6l1l4fzz78h0fvb1zgf8iv"))

(define rust-kqueue-1.1.1
  (crate-source
   "kqueue"
   "1.1.1"
   "0sjrsnza8zxr1zfpv6sa0zapd54kx9wlijrz9apqvs6wsw303hza"))

(define rust-kqueue-sys-1.0.4
  (crate-source
   "kqueue-sys"
   "1.0.4"
   "12w3wi90y4kwis4k9g6fp0kqjdmc6l00j16g8mgbhac7vbzjb5pd"))

(define rust-lazy-static-1.5.0
  (crate-source
   "lazy_static"
   "1.5.0"
   "1zk6dqqni0193xg6iijh7i3i44sryglwgvx20spdvwk3r6sbrlmv"))

(define rust-lean-string-0.7.0
  (crate-source
   "lean_string"
   "0.7.0"
   "1rpr1mkmkiinaavgaj12hvnbw7k4v5wsjpj9hvw42lhbf9r9v2fq"))

(define rust-leb128fmt-0.1.0
  (crate-source
   "leb128fmt"
   "0.1.0"
   "1chxm1484a0bly6anh6bd7a99sn355ymlagnwj3yajafnpldkv89"))

(define rust-lexopt-0.3.2
  (crate-source
   "lexopt"
   "0.3.2"
   "04yl0nx4gyxy9h1b2n117zakznw8yjhwn81zcg9bjagvkiychgl0"))

(define rust-libc-0.2.186
  (crate-source
   "libc"
   "0.2.186"
   "0rnyhzjyqq9x56skkllbjzzzwym3r61lq3l4hqj64v71gw0r3av8"))

(define rust-libflate-1.4.0
  (crate-source
   "libflate"
   "1.4.0"
   "063xw2z477h3vh7j32y0f54a6nbndd7yf7rr5wpsvfw5nrqsxx2z"))

(define rust-libflate-lz77-1.2.0
  (crate-source
   "libflate_lz77"
   "1.2.0"
   "1gxc75fb2sk0xgrh3qxvxcx1l93yhmyxn9241r251wl5zj5klbd5"))

(define rust-libgit2-sys-0.18.7+1.9.6
  (crate-source
   "libgit2-sys"
   "0.18.7+1.9.6"
   "12ad5zmffzbivn57d47lg2kgjprqsz0kq8i4lsqzlkwz9cg3kir3"))

(define rust-libloading-0.8.9
  (crate-source
   "libloading"
   "0.8.9"
   "0mfwxwjwi2cf0plxcd685yxzavlslz7xirss3b9cbrzyk4hv1i6p"))

(define rust-libm-0.2.16
  (crate-source
   "libm"
   "0.2.16"
   "10brh0a3qjmbzkr5mf5xqi887nhs5y9layvnki89ykz9xb1wxlmn"))

(define rust-libproc-0.14.11
  (crate-source
   "libproc"
   "0.14.11"
   "0mq7k52kc1m43sbnragb3ybynkq03hjr8apxbwfk1icbickxfjm5"))

(define rust-libredox-0.1.14
  (crate-source
   "libredox"
   "0.1.14"
   "02p3pxlqf54znf1jhiyyjs0i4caf8ckrd5l8ygs4i6ba3nfy6i0p"))

(define rust-libsqlite3-sys-0.38.1
  (crate-source
   "libsqlite3-sys"
   "0.38.1"
   "1nv1g8ws2qm4j24xa5q5a9yg9qxk7p0skdkikllsq8aw8c2rmhgn"))

(define rust-libz-sys-1.1.25
  (crate-source
   "libz-sys"
   "1.1.25"
   "1hdg7nqfjaygcqidyknldsva4i4zvirbgqc7j06c72m6w8llqbym"))

(define rust-line-clipping-0.3.5
  (crate-source
   "line-clipping"
   "0.3.5"
   "0jlakbyjc5sh4j2lx2glyjar3wqq9mqifkdzbhvhkgyxk17f8kaz"))

(define rust-linked-hash-map-0.5.6
  (crate-source
   "linked-hash-map"
   "0.5.6"
   "03vpgw7x507g524nx5i1jf5dl8k3kv0fzg8v3ip6qqwbpkqww5q7"))

(define rust-linkme-0.3.36
  (crate-source
   "linkme"
   "0.3.36"
   "1ks1mrhf4nc7vy9scfncsiqkv3vw7sn7jib8rbn8vyvkcga74cp8"))

(define rust-linkme-impl-0.3.36
  (crate-source
   "linkme-impl"
   "0.3.36"
   "0js4vz4223vdd1wm6imiwvqjxyy7wpgnwdxlcbz0hz9w80h9xm9j"))

(define rust-linux-raw-sys-0.4.15
  (crate-source
   "linux-raw-sys"
   "0.4.15"
   "1aq7r2g7786hyxhv40spzf2nhag5xbw2axxc1k8z5k1dsgdm4v6j"))

(define rust-linux-raw-sys-0.12.1
  (crate-source
   "linux-raw-sys"
   "0.12.1"
   "0lwasljrqxjjfk9l2j8lyib1babh2qjlnhylqzl01nihw14nk9ij"))

(define rust-litemap-0.8.1
  (crate-source
   "litemap"
   "0.8.1"
   "0xsy8pfp9s802rsj1bq2ys2kbk1g36w5dr3gkfip7gphb5x60wv3"))

(define rust-litrs-1.0.0
  (crate-source
   "litrs"
   "1.0.0"
   "14p0kzzkavnngvybl88nvfwv031cc2qx4vaxpfwsiifm8grdglqi"))

(define rust-lmdb-master-sys-0.2.6
  (crate-source
   "lmdb-master-sys"
   "0.2.6"
   "12wgjzqm94by3yzp7fz7il0b5sa1nfa4jqgzzymipgbk5v99psxa"))

(define rust-lock-api-0.4.14
  (crate-source
   "lock_api"
   "0.4.14"
   "0rg9mhx7vdpajfxvdjmgmlyrn20ligzqvn8ifmaz7dc79gkrjhr2"))

(define rust-log-0.4.29
  (crate-source
   "log"
   "0.4.29"
   "15q8j9c8g5zpkcw0hnd6cf2z7fxqnvsjh3rw5mv5q10r83i34l2y"))

(define rust-lru-0.16.3
  (crate-source
   "lru"
   "0.16.3"
   "14z5yxcp3f63lgw8yxr486g9yz7cfqbmkadfwgw36vy0jbslgp51"))

(define rust-lru-0.18.0
  (crate-source
   "lru"
   "0.18.0"
   "1fagimn8n3ivc3diad3jf323lbx86x1cyffjky31dklgjq2hd1la"))

(define rust-lru-slab-0.1.2
  (crate-source
   "lru-slab"
   "0.1.2"
   "0m2139k466qj3bnpk66bwivgcx3z88qkxvlzk70vd65jq373jaqi"))

(define rust-lscolors-0.21.0
  (crate-source
   "lscolors"
   "0.21.0"
   "0a89sspsr2g5q2mhfw5v6q1dq7qk87h049kr4hnyn9hlzdnjc3nn"))

(define rust-lsp-server-0.10.0
  (crate-source
   "lsp-server"
   "0.10.0"
   "0mknzz022b8w7flxh05yypicgbqc8mwn32gjxqkf8wg5y8qmmqiy"))

(define rust-lsp-textdocument-0.5.0
  (crate-source
   "lsp-textdocument"
   "0.5.0"
   "12ir8fp2h3xfjw9bnlj3417zj03sfmzprkphp9y76hgid2jjp9rd"))

(define rust-lsp-types-0.97.0
  (crate-source
   "lsp-types"
   "0.97.0"
   "0wb0yr2cdhlndjkcfyabr17ib0nvqa4v3zl5qm3aq13wl583adak"))

(define rust-lz4-1.28.1
  (crate-source
   "lz4"
   "1.28.1"
   "1x2svvs3gkn3krv61nd7ms4vmikibsnfl31mk0z480qdhqz542x2"))

(define rust-lz4-sys-1.11.1+lz4-1.10.0
  (crate-source
   "lz4-sys"
   "1.11.1+lz4-1.10.0"
   "1rhqnhwq05fmlc2q39ipsq0vpi0xf6w6p22j6q5x637dqvbc1n3b"))

(define rust-mac-0.1.1
  (crate-source
   "mac"
   "0.1.1"
   "194vc7vrshqff72rl56f9xgb0cazyl4jda7qsv31m5l6xx7hq7n4"))

(define rust-mach2-0.6.0
  (crate-source
   "mach2"
   "0.6.0"
   "0asmmmvsvf9ipn2jszazhhlrqv8qgcglwdh0n3r470pna70hirns"))

(define rust-markdown-1.0.0
  (crate-source
   "markdown"
   "1.0.0"
   "1sqxbclkxw615kcwglcisda1dcw8cfaa30z7sa16lhfwrbrbijm5"))

(define rust-markup5ever-0.12.1
  (crate-source
   "markup5ever"
   "0.12.1"
   "0idy4vjihg2dw73j2vkb5kdghvga3bwnw0qx8jwci4m6xfxkmkhn"))

(define rust-markup5ever-0.39.0
  (crate-source
   "markup5ever"
   "0.39.0"
   "1pjpjwzlsv03ljpprq3swamfj8ipv6kl2nvfdzjlww2zxj3xj8ki"))

(define rust-markup5ever-rcdom-0.3.0
  (crate-source
   "markup5ever_rcdom"
   "0.3.0"
   "065yb6zn9sfn7kqk5wwc48czsls5z3hzgrddk58fxgq16ymj3apd"))

(define rust-matchers-0.2.0
  (crate-source
   "matchers"
   "0.2.0"
   "1sasssspdj2vwcwmbq3ra18d3qniapkimfcbr47zmx6750m5llni"))

(define rust-matrixmultiply-0.3.10
  (crate-source
   "matrixmultiply"
   "0.3.10"
   "020sqwg3cvprfasbszqbnis9zx6c3w9vlkfidyimgblzdq0y6vd0"))

(define rust-md-5-0.10.6
  (crate-source
   "md-5"
   "0.10.6"
   "1kvq5rnpm4fzwmyv5nmnxygdhhb2369888a06gdc9pxyrzh7x7nq"))

(define rust-md-5-0.11.0
  (crate-source
   "md-5"
   "0.11.0"
   "166yqj8b11pawpys7knnn77cr618cby2iywpp0dq4dh3b4gl9dk9"))

(define rust-mediatype-0.21.0
  (crate-source
   "mediatype"
   "0.21.0"
   "19y4g4di0aafvdnr7gx2308774a6g19k8qr614prdn8rps3s23qj"))

(define rust-memchr-2.8.3
  (crate-source
   "memchr"
   "2.8.3"
   "161xa63ipfanf8v3nb82xd5hqgydv55nzw59wyngqbz6alfaz2yg"))

(define rust-memmap2-0.9.10
  (crate-source
   "memmap2"
   "0.9.10"
   "1qz0n4ch68pz2mp07sdwnk27imdjjqy6aqir3hp9j4g0iw19hh3i"))

(define rust-memoffset-0.7.1
  (crate-source
   "memoffset"
   "0.7.1"
   "1x2zv8hv9c9bvgmhsjvr9bymqwyxvgbca12cm8xkhpyy5k1r7s2x"))

(define rust-miette-5.10.0
  (crate-source
   "miette"
   "5.10.0"
   "0vl5qvl3bgha6nnkdl7kiha6v4ypd6d51wyc4q1bvdpamr75ifsr"))

(define rust-miette-7.6.0
  (crate-source
   "miette"
   "7.6.0"
   "1dwjnnpcff4jzpf5ns1m19di2p0n5j31zmjv5dskrih7i3nfz62z"))

(define rust-miette-derive-5.10.0
  (crate-source
   "miette-derive"
   "5.10.0"
   "0p33msrngkxlp5ajm8nijamii9vcwwpy8gfh4m53qnmrc0avrrs9"))

(define rust-miette-derive-7.6.0
  (crate-source
   "miette-derive"
   "7.6.0"
   "12w13a67n2cc37nzidvv0v0vrvf4rsflzxz6slhbn3cm9rqjjnyv"))

(define rust-mime-0.3.17
  (crate-source
   "mime"
   "0.3.17"
   "16hkibgvb9klh0w0jk5crr5xv90l3wlf77ggymzjmvl1818vnxv8"))

(define rust-mime-guess-2.0.5
  (crate-source
   "mime_guess"
   "2.0.5"
   "03jmg3yx6j39mg0kayf7w4a886dl3j15y8zs119zw01ccy74zi7p"))

(define rust-minimal-lexical-0.2.1
  (crate-source
   "minimal-lexical"
   "0.2.1"
   "16ppc5g84aijpri4jzv14rvcnslvlpphbszc7zzp6vfkddf4qdb8"))

(define rust-miniz-oxide-0.8.9
  (crate-source
   "miniz_oxide"
   "0.8.9"
   "05k3pdg8bjjzayq3rf0qhpirq9k37pxnasfn4arbs17phqn6m9qz"))

(define rust-mio-1.2.0
  (crate-source
   "mio"
   "1.2.0"
   "1hanrh4fwsfkdqdaqfidz48zz1wdix23zwn3r2x78am0garfbdsh"))

(define rust-mockito-1.7.2
  (crate-source
   "mockito"
   "1.7.2"
   "1h4jpghvhgcyybqbvhxkzjpq4sjl49n4q9vbqk7ikarcf4c0d0lh"))

(define rust-moxcms-0.8.1
  (crate-source
   "moxcms"
   "0.8.1"
   "0jz4fd5f7pdn1rngqc96lxriqjkym1lswdhdbjr037s8p9ac31dv"))

(define rust-mq-markdown-0.8.1
  (crate-source
   "mq-markdown"
   "0.8.1"
   "1ih0fl7ls1xpm8fnr5gjpxii13z4lbnzqsqmick4rs7ylmnnymcq"))

(define rust-multipart-rs-0.2.2
  (crate-source
   "multipart-rs"
   "0.2.2"
   "0hj4h201144hcn1q7j3sb2r98c70kqacsw2npc36j6jshq7q56fz"))

(define rust-native-tls-0.2.18
  (crate-source
   "native-tls"
   "0.2.18"
   "1wmv0g5p6jwyyslyw88w5fv9kc9qvjd1hi2d4sfl4qm19vhh0ma6"))

(define rust-ndarray-0.17.2
  (crate-source
   "ndarray"
   "0.17.2"
   "0bbmybr5x36yln5y09s6ijndlca59fr3p0khj1p4lsvs9a0q002j"))

(define rust-neo-frizbee-0.11.0
  (crate-source
   "neo_frizbee"
   "0.11.0"
   "10jqbmrqpg8nlxsklfnaa665sb0624hhfcbpb2ivw9nsm0h62bvs"))

(define rust-new-debug-unreachable-1.0.6
  (crate-source
   "new_debug_unreachable"
   "1.0.6"
   "11phpf1mjxq6khk91yzcbd3ympm78m3ivl7xg6lg2c0lf66fy3k5"))

(define rust-nix-0.26.4
  (crate-source
   "nix"
   "0.26.4"
   "06xgl4ybb8pvjrbmc3xggbgk3kbs1j0c4c0nzdfrmpbgrkrym2sr"))

(define rust-nix-0.30.1
  (crate-source
   "nix"
   "0.30.1"
   "1dixahq9hk191g0c2ydc0h1ppxj0xw536y6rl63vlnp06lx3ylkl"))

(define rust-nix-0.31.3
  (crate-source
   "nix"
   "0.31.3"
   "0gbwnjfny9rq9hl5bz4ry520n9rnfknna4bg88n66f7zx3yx486g"))

(define rust-nohash-hasher-0.2.0
  (crate-source
   "nohash-hasher"
   "0.2.0"
   "0lf4p6k01w4wm7zn4grnihzj8s7zd5qczjmzng7wviwxawih5x9b"))

(define rust-nom-7.1.3
  (crate-source
   "nom"
   "7.1.3"
   "0jha9901wxam390jcf5pfa0qqfrgh8li787jx2ip0yk5b8y9hwyj"))

(define rust-nom-8.0.0
  (crate-source
   "nom"
   "8.0.0"
   "01cl5xng9d0gxf26h39m0l8lprgpa00fcc75ps1yzgbib1vn35yz"))

(define rust-notify-8.2.0
  (crate-source
   "notify"
   "8.2.0"
   "1hrb83451vm5cpjw83nz5skgwjg5ara28zq8nxsqbzsif690fgad"))

(define rust-notify-9.0.0-rc.4
  (crate-source
   "notify"
   "9.0.0-rc.4"
   "03i4c6l2116slkl757v0gysacpa9cwz6jy20r0afz0fp9lfpfjxl"))

(define rust-notify-debouncer-full-0.7.0
  (crate-source
   "notify-debouncer-full"
   "0.7.0"
   "00mkvfh0z2hi8ql8fa4k6zh6vlhjk43xc14d4cr9kg7ykhbljay0"))

(define rust-notify-types-2.1.0
  (crate-source
   "notify-types"
   "2.1.0"
   "0yj710mxd4lsaz4hq7601mh6xb02awb8hg4z6lvh76ik1vpczf22"))

(define rust-now-0.1.3
  (crate-source
   "now"
   "0.1.3"
   "1l135786rb43rjfhwfdj7hi3b5zxxyl9gwf15yjz18cp8f3yk2bd"))

(define rust-ntapi-0.4.3
  (crate-source
   "ntapi"
   "0.4.3"
   "1bl0d73avwla7laa4pkqvzvifjbs0avg65w01zxjydgx3likbcy3"))

(define rust-nu-ansi-term-0.50.3
  (crate-source
   "nu-ansi-term"
   "0.50.3"
   "1ra088d885lbd21q1bxgpqdlk1zlndblmarn948jz2a40xsbjmvr"))

(define rust-nucleo-matcher-0.3.1
  (crate-source
   "nucleo-matcher"
   "0.3.1"
   "11dc5kfin1n561qdcg0x9aflvw876a8vldmqjhs5l6ixfcwgacxz"))

(define rust-num-0.4.3
  (crate-source
   "num"
   "0.4.3"
   "08yb2fc1psig7pkzaplm495yp7c30m4pykpkwmi5bxrgid705g9m"))

(define rust-num-bigint-0.4.8
  (crate-source
   "num-bigint"
   "0.4.8"
   "0ry3xjal8f5xhdinani268ci13h14mf7j4w0y1gflfzhw3knk7n8"))

(define rust-num-complex-0.4.6
  (crate-source
   "num-complex"
   "0.4.6"
   "15cla16mnw12xzf5g041nxbjjm9m85hdgadd5dl5d0b30w9qmy3k"))

(define rust-num-conv-0.2.0
  (crate-source
   "num-conv"
   "0.2.0"
   "0l4hj7lp8zbb9am4j3p7vlcv47y9bbazinvnxx9zjhiwkibyr5yg"))

(define rust-num-derive-0.4.2
  (crate-source
   "num-derive"
   "0.4.2"
   "00p2am9ma8jgd2v6xpsz621wc7wbn1yqi71g15gc3h67m7qmafgd"))

(define rust-num-format-0.4.4
  (crate-source
   "num-format"
   "0.4.4"
   "1hvjmib117jspyixfr76f900mhz5zfn71dnyqg9iywb339vxjlm6"))

(define rust-num-integer-0.1.46
  (crate-source
   "num-integer"
   "0.1.46"
   "13w5g54a9184cqlbsq80rnxw4jj4s0d8wv75jsq5r2lms8gncsbr"))

(define rust-num-iter-0.1.45
  (crate-source
   "num-iter"
   "0.1.45"
   "1gzm7vc5g9qsjjl3bqk9rz1h6raxhygbrcpbfl04swlh0i506a8l"))

(define rust-num-rational-0.4.2
  (crate-source
   "num-rational"
   "0.4.2"
   "093qndy02817vpgcqjnj139im3jl7vkq4h68kykdqqh577d18ggq"))

(define rust-num-traits-0.2.19
  (crate-source
   "num-traits"
   "0.2.19"
   "0h984rhdkkqd4ny9cif7y2azl3xdfb7768hb9irhpsch4q3gq787"))

(define rust-num-cpus-1.17.0
  (crate-source
   "num_cpus"
   "1.17.0"
   "0fxjazlng4z8cgbmsvbzv411wrg7x3hyxdq8nxixgzjswyylppwi"))

(define rust-num-threads-0.1.7
  (crate-source
   "num_threads"
   "0.1.7"
   "1ngajbmhrgyhzrlc4d5ga9ych1vrfcvfsiqz6zv0h2dpr2wrhwsw"))

(define rust-objc2-0.6.4
  (crate-source
   "objc2"
   "0.6.4"
   "17x8qpl512frscfqbmgjr20kg3y4r0xdqxphja17dz5f0znsh4is"))

(define rust-objc2-app-kit-0.3.2
  (crate-source
   "objc2-app-kit"
   "0.3.2"
   "132ijwni8lsi8phq7wnmialkxp46zx998fns3zq5np0ya1mr77nl"))

(define rust-objc2-core-foundation-0.3.2
  (crate-source
   "objc2-core-foundation"
   "0.3.2"
   "0dnmg7606n4zifyjw4ff554xvjmi256cs8fpgpdmr91gckc0s61a"))

(define rust-objc2-core-graphics-0.3.2
  (crate-source
   "objc2-core-graphics"
   "0.3.2"
   "01x8413pxq0m5rwidlaczni8v5cz9dc3xqzq8l9zlpl9cv8cj8p0"))

(define rust-objc2-core-services-0.3.2
  (crate-source
   "objc2-core-services"
   "0.3.2"
   "02vaw24fbddp4767999rdg5gfw60xi8ygbljabzj9fjcjfnh0csq"))

(define rust-objc2-encode-4.1.0
  (crate-source
   "objc2-encode"
   "4.1.0"
   "0cqckp4cpf68mxyc2zgnazj8klv0z395nsgbafa61cjgsyyan9gg"))

(define rust-objc2-foundation-0.3.2
  (crate-source
   "objc2-foundation"
   "0.3.2"
   "0wijkxzzvw2xkzssds3fj8279cbykz2rz9agxf6qh7y2agpsvq73"))

(define rust-objc2-io-kit-0.3.2
  (crate-source
   "objc2-io-kit"
   "0.3.2"
   "05dvfcf97w39daaj5qsbfc399lw9hbx3s4h9nwgxrmlpjnizpyik"))

(define rust-objc2-io-surface-0.3.2
  (crate-source
   "objc2-io-surface"
   "0.3.2"
   "07fqx4fmwydf2arrc4xs4awv7zyzzxh60fyqdfmrpm9n148qh1qq"))

(define rust-objc2-open-directory-0.3.2
  (crate-source
   "objc2-open-directory"
   "0.3.2"
   "0vb77yig142s54vrhlcq98ykv8qm82x2n1yzzqfj1xgd4z9bx0mv"))

(define rust-object-0.37.3
  (crate-source
   "object"
   "0.37.3"
   "1zikiy9xhk6lfx1dn2gn2pxbnfpmlkn0byd7ib1n720x0cgj0xpz"))

(define rust-object-store-0.13.2
  (crate-source
   "object_store"
   "0.13.2"
   "0jcajnvha22jrla3i9as7n9mrra0m864p00mxvi10g0d234wnak2"))

(define rust-oem-cp-2.1.2
  (crate-source
   "oem_cp"
   "2.1.2"
   "07qf033qjx4n696076rzsgvqnmw3d4i9hbs66vn4lj4z6k9mjycc"))

(define rust-omnipath-0.1.6
  (crate-source
   "omnipath"
   "0.1.6"
   "0xd5a4xwsfmhzk59v6wz65f59rk16d7gvkg90w1qhb0jg08b7bc0"))

(define rust-once-cell-1.21.3
  (crate-source
   "once_cell"
   "1.21.3"
   "0b9x77lb9f1j6nqgf5aka4s2qj0nly176bpbrv6f9iakk5ff3xa2"))

(define rust-once-cell-polyfill-1.70.2
  (crate-source
   "once_cell_polyfill"
   "1.70.2"
   "1zmla628f0sk3fhjdjqzgxhalr2xrfna958s632z65bjsfv8ljrq"))

(define rust-open-5.4.0
  (crate-source
   "open"
   "5.4.0"
   "1m8ya7x1yf8lm9j8acwv6nf4vp8fc9c5dx7yfa52pmcmwxcx1cx0"))

(define rust-openssl-0.10.80
  (crate-source
   "openssl"
   "0.10.80"
   "0ryrcbdd7hq0ydvassn4cr02agii1l54yd6sali7chkci2ma4px4"))

(define rust-openssl-macros-0.1.1
  (crate-source
   "openssl-macros"
   "0.1.1"
   "173xxvfc63rr5ybwqwylsir0vq6xsj4kxiv4hmg4c3vscdmncj59"))

(define rust-openssl-probe-0.1.6
  (crate-source
   "openssl-probe"
   "0.1.6"
   "0bl52x55laalqb707k009h8kfawliwp992rlsvkzy49n47p2fpnh"))

(define rust-openssl-probe-0.2.1
  (crate-source
   "openssl-probe"
   "0.2.1"
   "1gpwpb7smfhkscwvbri8xzbab39wcnby1jgz1s49vf1aqgsdx1vw"))

(define rust-openssl-src-300.5.5+3.5.5
  (crate-source
   "openssl-src"
   "300.5.5+3.5.5"
   "02gpasd6j7iv0pw8jxzvqpn993njy1jsgl2gjfkrfdg06gaqf5rz"))

(define rust-openssl-sys-0.9.116
  (crate-source
   "openssl-sys"
   "0.9.116"
   "1i0qcgsimh8qkfgrglmzz2kq3jk2d5575rz5jvqabka0f7f252pj"))

(define rust-option-ext-0.2.0
  (crate-source
   "option-ext"
   "0.2.0"
   "0zbf7cx8ib99frnlanpyikm1bx8qn8x602sw1n7bg6p9x94lyx04"))

(define rust-ordered-multimap-0.7.3
  (crate-source
   "ordered-multimap"
   "0.7.3"
   "0ygg08g2h381r3zbclba4zx4amm25zd2hsqqmlxljc00mvf3q829"))

(define rust-os-display-0.1.4
  (crate-source
   "os_display"
   "0.1.4"
   "13x07viih4f7l5cicbqw9xv378h0a096vphdclcbjvq2g4dxfpxd"))

(define rust-os-pipe-1.2.3
  (crate-source
   "os_pipe"
   "1.2.3"
   "0rqrvm7fdp790b4ks3kcdzsgkz2528xrn3vxc9l4nf1inj2ax3vx"))

(define rust-outref-0.5.2
  (crate-source
   "outref"
   "0.5.2"
   "03pzw9aj4qskqhh0fkagy2mkgfwgj5a1m67ajlba5hw80h68100s"))

(define rust-owo-colors-4.3.0
  (crate-source
   "owo-colors"
   "4.3.0"
   "0kgrf4r9vcczhw5r30nkcl6abm99l0ay8dr2fxl0ymvbkcxq04fj"))

(define rust-page-size-0.6.0
  (crate-source
   "page_size"
   "0.6.0"
   "1nj0rrwpvagagssljbm29ww1iyrrg15p1q4sk70r2cfi9qcv5m9h"))

(define rust-papergrid-0.18.0
  (crate-source
   "papergrid"
   "0.18.0"
   "0ghmk4qgj4r2wdxfxk9vjylmzphms7q2w9ibpj8ldlvlh9k4x66h"))

(define rust-parking-2.2.1
  (crate-source
   "parking"
   "2.2.1"
   "1fnfgmzkfpjd69v4j9x737b1k8pnn054bvzcn5dm3pkgq595d3gk"))

(define rust-parking-lot-0.12.5
  (crate-source
   "parking_lot"
   "0.12.5"
   "06jsqh9aqmc94j2rlm8gpccilqm6bskbd67zf6ypfc0f4m9p91ck"))

(define rust-parking-lot-core-0.9.12
  (crate-source
   "parking_lot_core"
   "0.9.12"
   "1hb4rggy70fwa1w9nb0svbyflzdc69h047482v2z3sx2hmcnh896"))

(define rust-parse-datetime-0.15.0
  (crate-source
   "parse_datetime"
   "0.15.0"
   "0ls3p03n8ppm7nbhfrg1mxjha5nadgklsaqfzk8gwlin43nw0pgi"))

(define rust-pastey-0.2.3
  (crate-source
   "pastey"
   "0.2.3"
   "1d1mk45ma9w54ppws8x096q96qhqirxmj9j3hchj7fmi1087zrif"))

(define rust-pathdiff-0.2.3
  (crate-source
   "pathdiff"
   "0.2.3"
   "1lrqp4ip05df8dzldq6gb2c1sq2gs54gly8lcnv3rhav1qhwx56z"))

(define rust-pem-rfc7468-1.0.0
  (crate-source
   "pem-rfc7468"
   "1.0.0"
   "1nck8ig71axy21lsick2f9vcw7329mlx2hs88d382wz7w0im8c56"))

(define rust-percent-encoding-2.3.2
  (crate-source
   "percent-encoding"
   "2.3.2"
   "083jv1ai930azvawz2khv7w73xh8mnylk7i578cifndjn5y64kwv"))

(define rust-peresil-0.3.0
  (crate-source
   "peresil"
   "0.3.0"
   "0mwyw03yqp0yqdjf4a89vn86szxaksmxvgzv1j2nw69fsmp8hn7n"))

(define rust-pest-2.8.6
  (crate-source
   "pest"
   "2.8.6"
   "0qm6kpqsbn2p6vkd7v4j3g7wsjby2ip6di1h6kx7vlq921h8r170"))

(define rust-pest-consume-1.1.3
  (crate-source
   "pest_consume"
   "1.1.3"
   "0sskbz2hlqdvrjrp0nxww5diaggsccp2ziql5qaff62xs4178i3r"))

(define rust-pest-consume-macros-1.1.0
  (crate-source
   "pest_consume_macros"
   "1.1.0"
   "0a9zg5zishafz0hhmp2byfd04h22naka0sy1q5739jwrm2kk11lx"))

(define rust-pest-derive-2.8.6
  (crate-source
   "pest_derive"
   "2.8.6"
   "0xzysvcyfs0pkn2801rg811y83jx2rvpqnjxs47c3ri1xbqqdx0i"))

(define rust-pest-generator-2.8.6
  (crate-source
   "pest_generator"
   "2.8.6"
   "0kzrcik2ww0qh84jlv8xqc0zmzgl3xy41vf1cfli1chkgdjc8h40"))

(define rust-pest-meta-2.8.6
  (crate-source
   "pest_meta"
   "2.8.6"
   "08126skq2lxysinp6v917niszhnnh6d6a9kg2i0a28b0sdlmr0c9"))

(define rust-petgraph-0.8.3
  (crate-source
   "petgraph"
   "0.8.3"
   "0mblnaqbx1y20h5y7pz6y11hk9jjk6k87lsmn7jxaq3hm67ba0c7"))

(define rust-phf-0.11.3
  (crate-source
   "phf"
   "0.11.3"
   "0y6hxp1d48rx2434wgi5g8j1pr8s5jja29ha2b65435fh057imhz"))

(define rust-phf-0.12.1
  (crate-source
   "phf"
   "0.12.1"
   "1dz85g1wshfca83mrq3va9rm9n8qcdjlpv1i3908y5zc9j4p6cli"))

(define rust-phf-0.13.1
  (crate-source
   "phf"
   "0.13.1"
   "1pzswx5gdglgjgp4azyzwyr4gh031r0kcnpqq6jblga72z3jsmn1"))

(define rust-phf-codegen-0.11.3
  (crate-source
   "phf_codegen"
   "0.11.3"
   "0si1n6zr93kzjs3wah04ikw8z6npsr39jw4dam8yi9czg2609y5f"))

(define rust-phf-codegen-0.13.1
  (crate-source
   "phf_codegen"
   "0.13.1"
   "1qfnsl2hiny0yg4lwn888xla5iwccszgxnx8dhbwl6s2h2fpzaj9"))

(define rust-phf-generator-0.11.3
  (crate-source
   "phf_generator"
   "0.11.3"
   "0gc4np7s91ynrgw73s2i7iakhb4lzdv1gcyx7yhlc0n214a2701w"))

(define rust-phf-generator-0.13.1
  (crate-source
   "phf_generator"
   "0.13.1"
   "0dwpp11l41dy9mag4phkyyvhpf66lwbp79q3ik44wmhyfqxcwnhk"))

(define rust-phf-macros-0.11.3
  (crate-source
   "phf_macros"
   "0.11.3"
   "05kjfbyb439344rhmlzzw0f9bwk9fp95mmw56zs7yfn1552c0jpq"))

(define rust-phf-macros-0.13.1
  (crate-source
   "phf_macros"
   "0.13.1"
   "1vv9h8pr7xh18sigpvq1hxc8q9nmjmv6gdpqsp65krxiahmh6bw1"))

(define rust-phf-shared-0.11.3
  (crate-source
   "phf_shared"
   "0.11.3"
   "1rallyvh28jqd9i916gk5gk2igdmzlgvv5q0l3xbf3m6y8pbrsk7"))

(define rust-phf-shared-0.12.1
  (crate-source
   "phf_shared"
   "0.12.1"
   "10cr16wpmbjxd7w6k98sxw9yw3zxnzscybl9jzyq3digi045a006"))

(define rust-phf-shared-0.13.1
  (crate-source
   "phf_shared"
   "0.13.1"
   "0rpjchnswm0x5l4mz9xqfpw0j4w68sjvyqrdrv13h7lqqmmyyzz5"))

(define rust-pin-project-lite-0.2.17
  (crate-source
   "pin-project-lite"
   "0.2.17"
   "1kfmwvs271si96zay4mm8887v5khw0c27jc9srw1a75ykvgj54x8"))

(define rust-pin-utils-0.1.0
  (crate-source
   "pin-utils"
   "0.1.0"
   "117ir7vslsl2z1a7qzhws4pd01cg2d3338c47swjyvqv2n60v1wb"))

(define rust-pkg-config-0.3.32
  (crate-source
   "pkg-config"
   "0.3.32"
   "0k4h3gnzs94sjb2ix6jyksacs52cf1fanpwsmlhjnwrdnp8dppby"))

(define rust-plain-0.2.3
  (crate-source
   "plain"
   "0.2.3"
   "19n1xbxb4wa7w891268bzf6cbwq4qvdb86bik1z129qb0xnnnndl"))

(define rust-planus-1.1.1
  (crate-source
   "planus"
   "1.1.1"
   "0wdgc8py2c7c77x4m72q37m7csxpkzigcf08d4fvwaki9cyqxbrx"))

(define rust-platform-info-2.0.5
  (crate-source
   "platform-info"
   "2.0.5"
   "06j5v6hg914lbdr732jfx5syx703l5qwy1qk6dm4zjyqznrswfbm"))

(define rust-plist-1.10.0
  (crate-source
   "plist"
   "1.10.0"
   "11bz122270sdjaldw2pq77sc0hfj2a3zbh4s3521wpfxlrfxd8bx"))

(define rust-png-0.18.1
  (crate-source
   "png"
   "0.18.1"
   "0qca282xp8a6d7mikxrwji3f52mjn4vnqxz2v9iz5adj665rnxk0"))

(define rust-polars-0.54.4
  (crate-source
   "polars"
   "0.54.4"
   "1ppgrpwykb3ar1wjcr16wl0kyz2vj1qkzc9k4083dhbf8lig3wc2"))

(define rust-polars-arrow-0.54.4
  (crate-source
   "polars-arrow"
   "0.54.4"
   "1ny2zdwx827s7nihdpnnw5p32p9sl1pqxlc4l6s1nin6bhnqkm47"))

(define rust-polars-arrow-format-0.2.1
  (crate-source
   "polars-arrow-format"
   "0.2.1"
   "0xb61vqiidf05s5ib36dwq70wx6f2c0fph9lgwb1xrj4ww7aqmm5"))

(define rust-polars-async-0.54.4
  (crate-source
   "polars-async"
   "0.54.4"
   "1xfmwin3j3c4k0zya555nwlszh2wk0v78d181d86yj4hc61pzs4i"))

(define rust-polars-buffer-0.54.4
  (crate-source
   "polars-buffer"
   "0.54.4"
   "0gbq30rb8vnbmipajwilggjdlbyaadakfbhssw6sqi656fpyx0g4"))

(define rust-polars-compute-0.54.4
  (crate-source
   "polars-compute"
   "0.54.4"
   "0726cflmllaccb5y5kc618sahvr5yc532njc76n8gs4y59j42pf5"))

(define rust-polars-config-0.54.4
  (crate-source
   "polars-config"
   "0.54.4"
   "0cw0qd3lj2fz1ld5ddyn4qjk5ln3bkxj6m5npirsq3mh849qdbv5"))

(define rust-polars-core-0.54.4
  (crate-source
   "polars-core"
   "0.54.4"
   "1706j58zjvx1apmp1wd7pa2z2k20bvm3b7cgwyx58q1h8vy28n9y"))

(define rust-polars-dtype-0.54.4
  (crate-source
   "polars-dtype"
   "0.54.4"
   "09wv9qqribmd80m9vy7pl0kp9a7kyqvf79y8j2z6dslrpd8afrbv"))

(define rust-polars-error-0.54.4
  (crate-source
   "polars-error"
   "0.54.4"
   "06nn8zf97wi5gcx2dnzvi2b6wxnyw1zqfxzibx75p6vb83ipb6p4"))

(define rust-polars-expr-0.54.4
  (crate-source
   "polars-expr"
   "0.54.4"
   "0182mp44dn1bi8xi4s80yqf08mqazaplnifk2fgi1vyrx0vxs7z2"))

(define rust-polars-io-0.54.4
  (crate-source
   "polars-io"
   "0.54.4"
   "0y50bbkb9ramww970024vaha7zmnr5vlvzp7rirqvzk59b2a2qv3"))

(define rust-polars-json-0.54.4
  (crate-source
   "polars-json"
   "0.54.4"
   "0z4qk5ssfb71mxdfcgrwcm1khmapdj265hx4i7hzf3ipf38nrjhx"))

(define rust-polars-lazy-0.54.4
  (crate-source
   "polars-lazy"
   "0.54.4"
   "0pmxx01yk1midcmqngbws6qbv5xgg61c2abn6cwdcdra4f89b7c0"))

(define rust-polars-mem-engine-0.54.4
  (crate-source
   "polars-mem-engine"
   "0.54.4"
   "0f5s0h4kcgagadd6f24g1g9br7irl1ghcaz8xv46nl1c2rynnp7m"))

(define rust-polars-ooc-0.54.4
  (crate-source
   "polars-ooc"
   "0.54.4"
   "0qs1g6dhy46p1w3awp48jh7w3jwrvy99rv4p19v7p0w6nfhfxcvq"))

(define rust-polars-ops-0.54.4
  (crate-source
   "polars-ops"
   "0.54.4"
   "0rfpg8yph94y1xaiyyqq3wv7kbpbyfnsa8iszzj5mb0ply86856b"))

(define rust-polars-parquet-0.54.4
  (crate-source
   "polars-parquet"
   "0.54.4"
   "1dyq43gi3iq4d8vnsykc50awxn7izyglbm2xkjxhrh0346x7jszx"))

(define rust-polars-parquet-format-0.1.0
  (crate-source
   "polars-parquet-format"
   "0.1.0"
   "1qcw67m8mzc7xndvkmc0n5d5c2zipsrjxy6rjizcbnz8rwyj89f0"))

(define rust-polars-plan-0.54.4
  (crate-source
   "polars-plan"
   "0.54.4"
   "0i6kykpfrcpfn7ln0nzbilrg727x0ggv1ix8c83v3b8m0liwqp1g"))

(define rust-polars-row-0.54.4
  (crate-source
   "polars-row"
   "0.54.4"
   "1lki8yyqkv7ddv5c51pkbkfwzgb7nk9yq6f92270f9008ma34kix"))

(define rust-polars-schema-0.54.4
  (crate-source
   "polars-schema"
   "0.54.4"
   "0bza9silx1ypp1lp8nqhsdj66sssc2fcvknds1pmf0hxjpl0v2kg"))

(define rust-polars-sql-0.54.4
  (crate-source
   "polars-sql"
   "0.54.4"
   "18pg0vzqj0zm9n6qwxakmrrk2mx1ffvp3c369dvi5sr794bad0mj"))

(define rust-polars-stream-0.54.4
  (crate-source
   "polars-stream"
   "0.54.4"
   "0jkkakc6szvzzcsih1ixmjf0m3bjzgr0wnjrg62qk68pw97gza6g"))

(define rust-polars-time-0.54.4
  (crate-source
   "polars-time"
   "0.54.4"
   "1pxgmb6f8572gg2sahn9nv4gnsvfghvh9rkvj5a2l8f4fkh3y1p1"))

(define rust-polars-utils-0.54.4
  (crate-source
   "polars-utils"
   "0.54.4"
   "1h2ah1ak852pw35326rwl37zghf1xh08c6gia8nrk5wgmaa0l2sr"))

(define rust-pori-0.0.0
  (crate-source
   "pori"
   "0.0.0"
   "01p9g4fn3kasnmwj8i4plzk6nnnk7ak2qsfcv9b9y4zcilrkv9m4"))

(define rust-portable-atomic-1.13.1
  (crate-source
   "portable-atomic"
   "1.13.1"
   "0j8vlar3n5acyigq8q6f4wjx3k3s5yz0rlpqrv76j73gi5qr8fn3"))

(define rust-portable-atomic-util-0.2.5
  (crate-source
   "portable-atomic-util"
   "0.2.5"
   "1xcm0ia8756k6hdgafx4g3lx3fw0hvz2zqswq7c2sy58gxnvk7bs"))

(define rust-potential-utf-0.1.4
  (crate-source
   "potential_utf"
   "0.1.4"
   "0xxg0pkfpq299wvwln409z4fk80rbv55phh3f1jhjajy5x1ljfdp"))

(define rust-powerfmt-0.2.0
  (crate-source
   "powerfmt"
   "0.2.0"
   "14ckj2xdpkhv3h6l5sdmb9f1d57z8hbfpdldjc2vl5givq2y77j3"))

(define rust-ppv-lite86-0.2.21
  (crate-source
   "ppv-lite86"
   "0.2.21"
   "1abxx6qz5qnd43br1dd9b2savpihzjza8gb4fbzdql1gxp2f7sl5"))

(define rust-precomputed-hash-0.1.1
  (crate-source
   "precomputed-hash"
   "0.1.1"
   "075k9bfy39jhs53cb2fpb9klfakx2glxnf28zdw08ws6lgpq6lwj"))

(define rust-predicates-3.1.4
  (crate-source
   "predicates"
   "3.1.4"
   "1ziwwshyl5d7yf9anyb8ldamqrx0kv1w3mhdnzkpx8i85y9z5a5d"))

(define rust-predicates-core-1.0.10
  (crate-source
   "predicates-core"
   "1.0.10"
   "0i6ia05imr1fsppc1z2lg0g2kpalz7crmlx0n4ql0sqnyd38glya"))

(define rust-predicates-tree-1.0.13
  (crate-source
   "predicates-tree"
   "1.0.13"
   "1wp2farzvl4aarpa3sdq59bd1rk0zzqrszj6n0fi7j1rgf21ppnh"))

(define rust-pretty-assertions-1.4.1
  (crate-source
   "pretty_assertions"
   "1.4.1"
   "0v8iq35ca4rw3rza5is3wjxwsf88303ivys07anc5yviybi31q9s"))

(define rust-prettyplease-0.2.37
  (crate-source
   "prettyplease"
   "0.2.37"
   "0azn11i1kh0byabhsgab6kqs74zyrg69xkirzgqyhz6xmjnsi727"))

(define rust-print-positions-0.6.1
  (crate-source
   "print-positions"
   "0.6.1"
   "026jzdf63b37bb9ix3mpczln2pqylsiwkkxhikj05x9y1r3r7x8x"))

(define rust-proc-macro-error-attr2-2.0.0
  (crate-source
   "proc-macro-error-attr2"
   "2.0.0"
   "1ifzi763l7swl258d8ar4wbpxj4c9c2im7zy89avm6xv6vgl5pln"))

(define rust-proc-macro-error2-2.0.1
  (crate-source
   "proc-macro-error2"
   "2.0.1"
   "00lq21vgh7mvyx51nwxwf822w2fpww1x0z8z0q47p8705g2hbv0i"))

(define rust-proc-macro2-1.0.106
  (crate-source
   "proc-macro2"
   "1.0.106"
   "0d09nczyaj67x4ihqr5p7gxbkz38gxhk4asc0k8q23g9n85hzl4g"))

(define rust-procfs-0.18.0
  (crate-source
   "procfs"
   "0.18.0"
   "1xw25dx4cfc2z745w0dz4vhv24z7dprcxyk0km1n2s2dlmh56j15"))

(define rust-procfs-core-0.18.0
  (crate-source
   "procfs-core"
   "0.18.0"
   "01g4lil280nacsd196xpfmvz5bp949dd2r9nas5zf8mgnvvinh76"))

(define rust-psm-0.1.30
  (crate-source
   "psm"
   "0.1.30"
   "1n0q1n5zx73gfl7zbc73n873lj6wz2dq3mxjy1s4sqyzcxj7cliq"))

(define rust-pure-rust-locales-0.8.2
  (crate-source
   "pure-rust-locales"
   "0.8.2"
   "03cak4k53a8iiz9ra0ydz2dfmx578qgwi23d1jlswhbm5nnpb5l6"))

(define rust-pwd-1.4.0
  (crate-source
   "pwd"
   "1.4.0"
   "18p4j95sqqcxn3fbm6gbi7klxp8n40xmcjqy9vz1ww5rg461rivj"))

(define rust-pxfm-0.1.28
  (crate-source
   "pxfm"
   "0.1.28"
   "17bbi6r9jiz9rmlj9zwjcf3qrivr33l8vwjmj9y812ysagkl385m"))

(define rust-quick-error-1.2.3
  (crate-source
   "quick-error"
   "1.2.3"
   "1q6za3v78hsspisc197bg3g7rpc989qycy8ypr8ap8igv10ikl51"))

(define rust-quick-error-2.0.1
  (crate-source
   "quick-error"
   "2.0.1"
   "18z6r2rcjvvf8cn92xjhm2qc3jpd1ljvcbf12zv0k9p565gmb4x9"))

(define rust-quick-xml-0.39.4
  (crate-source
   "quick-xml"
   "0.39.4"
   "0plfhnna58ad2hlym3q02zrmmh7xdpikzs7hll4x6w7nwba8vk6d"))

(define rust-quick-xml-0.41.0
  (crate-source
   "quick-xml"
   "0.41.0"
   "1h9y8zry34r3mxfd5vqfj50vvvzvri4kzbx5d657jkqjalg4aq76"))

(define rust-quickcheck-1.1.0
  (crate-source
   "quickcheck"
   "1.1.0"
   "02zpl1i6xkfr2kw09j3h2ig0z4n63xxx4z4a2sm6l3yv6prqkicm"))

(define rust-quickcheck-macros-1.2.0
  (crate-source
   "quickcheck_macros"
   "1.2.0"
   "192vdkh1z3kk6srbyadqavagfcyrhbd49n8x2y5lqrnxjf28p8m9"))

(define rust-quinn-0.11.9
  (crate-source
   "quinn"
   "0.11.9"
   "086gzj666dr3slmlynkvxlndy28hahgl361d6bf93hk3i6ahmqmr"))

(define rust-quinn-proto-0.11.15
  (crate-source
   "quinn-proto"
   "0.11.15"
   "0gknq1m2b9g3fsndka2gn7f2k45vb0zdssrh1qpkql7cbdf97jsg"))

(define rust-quinn-udp-0.5.14
  (crate-source
   "quinn-udp"
   "0.5.14"
   "1gacawr17a2zkyri0r3m0lc9spzmxbq1by3ilyb8v2mdvjhcdpmd"))

(define rust-quote-1.0.45
  (crate-source
   "quote"
   "1.0.45"
   "095rb5rg7pbnwdp6v8w5jw93wndwyijgci1b5lw8j1h5cscn3wj1"))

(define rust-quoted-printable-0.5.1
  (crate-source
   "quoted_printable"
   "0.5.1"
   "0wvwq6w6rdsx1yxzr7ckspff0qk0q9252dzmxrd4c0kv97c9n334"))

(define rust-r-efi-5.3.0
  (crate-source
   "r-efi"
   "5.3.0"
   "03sbfm3g7myvzyylff6qaxk4z6fy76yv860yy66jiswc2m6b7kb9"))

(define rust-r-efi-6.0.0
  (crate-source
   "r-efi"
   "6.0.0"
   "1gyrl2k5fyzj9k7kchg2n296z5881lg7070msabid09asp3wkp7q"))

(define rust-rand-0.8.5
  (crate-source
   "rand"
   "0.8.5"
   "013l6931nn7gkc23jz5mm3qdhf93jjf0fg64nz2lp4i51qd8vbrl"))

(define rust-rand-0.9.2
  (crate-source
   "rand"
   "0.9.2"
   "1lah73ainvrgl7brcxx0pwhpnqa3sm3qaj672034jz8i0q7pgckd"))

(define rust-rand-0.10.1
  (crate-source
   "rand"
   "0.10.1"
   "01r22vdpw6z69jzy6khnyr0ljq9im337h4j0mkyz26lnqyyfis6j"))

(define rust-rand-chacha-0.3.1
  (crate-source
   "rand_chacha"
   "0.3.1"
   "123x2adin558xbhvqb8w4f6syjsdkmqff8cxwhmjacpsl1ihmhg6"))

(define rust-rand-chacha-0.9.0
  (crate-source
   "rand_chacha"
   "0.9.0"
   "1jr5ygix7r60pz0s1cv3ms1f6pd1i9pcdmnxzzhjc3zn3mgjn0nk"))

(define rust-rand-chacha-0.10.0
  (crate-source
   "rand_chacha"
   "0.10.0"
   "1nxf7lj1r2nn5rwq2cigdj4lazh45npv3q7l3p255vaxwbrzfsiy"))

(define rust-rand-core-0.6.4
  (crate-source
   "rand_core"
   "0.6.4"
   "0b4j2v4cb5krak1pv6kakv4sz6xcwbrmy2zckc32hsigbrwy82zc"))

(define rust-rand-core-0.9.5
  (crate-source
   "rand_core"
   "0.9.5"
   "0g6qc5r3f0hdmz9b11nripyp9qqrzb0xqk9piip8w8qlvqkcibvn"))

(define rust-rand-core-0.10.0
  (crate-source
   "rand_core"
   "0.10.0"
   "1flazfw1q1hbvadwzmaliplz0xnnjijdnbmzxnzdqplhfzb0z38c"))

(define rust-rand-distr-0.5.1
  (crate-source
   "rand_distr"
   "0.5.1"
   "0qvlzxq4a2rvrf3wq0xq1bfw8iy9zqm6jlmbywqzld6g1paib1ka"))

(define rust-ratatui-0.30.0
  (crate-source
   "ratatui"
   "0.30.0"
   "1g36h96fnr8ay7bmwplxsfa5xzsp0pdaxny8s5a68i54igxngkni"))

(define rust-ratatui-core-0.1.0
  (crate-source
   "ratatui-core"
   "0.1.0"
   "14y2pv5njy7kpzjsfn20a8vmjbhnfq5vgbgppxrszjljkahdxy2y"))

(define rust-ratatui-crossterm-0.1.0
  (crate-source
   "ratatui-crossterm"
   "0.1.0"
   "1cslvh75a29gdmz84s5sjaqd61k4s0fkjsjwn8gi4k1bcngrnz2p"))

(define rust-ratatui-macros-0.7.0
  (crate-source
   "ratatui-macros"
   "0.7.0"
   "1x1nr4wyyhchms9chj10b3wk7ribfvmd14xps2wlngp82cm39wd7"))

(define rust-ratatui-widgets-0.3.0
  (crate-source
   "ratatui-widgets"
   "0.3.0"
   "1nqjcrskazvfgjkmmsifliqrvap8bw6850rlap109rnl7h1gmnyp"))

(define rust-raw-cpuid-11.6.0
  (crate-source
   "raw-cpuid"
   "11.6.0"
   "11j1lmrjqqnc43bxkrz0xai1g9piw3z9aap53qsj8cnpb7fd1329"))

(define rust-rawpointer-0.2.1
  (crate-source
   "rawpointer"
   "0.2.1"
   "1qy1qvj17yh957vhffnq6agq0brvylw27xgks171qrah75wmg8v0"))

(define rust-rayon-1.12.0
  (crate-source
   "rayon"
   "1.12.0"
   "0vcj63xgnk72c30vdrak7dhl53snnaqv9x2faf1d94hzg1kb2fgv"))

(define rust-rayon-core-1.13.0
  (crate-source
   "rayon-core"
   "1.13.0"
   "14dbr0sq83a6lf1rfjq5xdpk5r6zgzvmzs5j6110vlv2007qpq92"))

(define rust-recursive-0.1.1
  (crate-source
   "recursive"
   "0.1.1"
   "0gmlaih5kyqc1pkbk0klqr9m65c4bvz6j0mwn68z8q5pxcys91h7"))

(define rust-recursive-proc-macro-impl-0.1.1
  (crate-source
   "recursive-proc-macro-impl"
   "0.1.1"
   "12z3wy2wa4l2dpfdb5vhaaiy78l130x5w9fflb0py1ql0sz9y03n"))

(define rust-recvmsg-1.0.0
  (crate-source
   "recvmsg"
   "1.0.0"
   "0xa173gbg1cx8q7wyzi6c4kmcsz5rka68r4jb6kg14icskax9vfk"))

(define rust-redox-syscall-0.5.18
  (crate-source
   "redox_syscall"
   "0.5.18"
   "0b9n38zsxylql36vybw18if68yc9jczxmbyzdwyhb9sifmag4azd"))

(define rust-redox-users-0.4.6
  (crate-source
   "redox_users"
   "0.4.6"
   "0hya2cxx6hxmjfxzv9n8rjl5igpychav7zfi1f81pz6i4krry05s"))

(define rust-redox-users-0.5.2
  (crate-source
   "redox_users"
   "0.5.2"
   "1b17q7gf7w8b1vvl53bxna24xl983yn7bd00gfbii74bcg30irm4"))

(define rust-reedline-0.51.0
  (crate-source
   "reedline"
   "0.51.0"
   "03al8s7i890cgwrnhmf2n1skj2d7fp1n942zgrrvqb1ixpwsq46h"))

(define rust-ref-cast-1.0.25
  (crate-source
   "ref-cast"
   "1.0.25"
   "0zdzc34qjva9xxgs889z5iz787g81hznk12zbk4g2xkgwq530m7k"))

(define rust-ref-cast-impl-1.0.25
  (crate-source
   "ref-cast-impl"
   "1.0.25"
   "1nkhn1fklmn342z5c4mzfzlxddv3x8yhxwwk02cj06djvh36065p"))

(define rust-regex-1.13.1
  (crate-source
   "regex"
   "1.13.1"
   "1391a0a4100ik8cp7l577p3ip3haqq03rd9c5vdr7vcfdixj687h"))

(define rust-regex-automata-0.3.9
  (crate-source
   "regex-automata"
   "0.3.9"
   "1agg6ymbgjydj3q31ay6dbzgp3i5cnrnygpylczqj623xs93xcjr"))

(define rust-regex-automata-0.4.16
  (crate-source
   "regex-automata"
   "0.4.16"
   "1b8ihxq99g3hr8mr37bvhib4bfn8rlmpmp0wjg2q1j50plvdpkwg"))

(define rust-regex-lite-0.1.9
  (crate-source
   "regex-lite"
   "0.1.9"
   "0wzr31ysmiy9sw48i36raqbm1iyk2xnq0lp4zbs6fzi47p3k9f6a"))

(define rust-regex-syntax-0.7.5
  (crate-source
   "regex-syntax"
   "0.7.5"
   "1nhjmqdlakfi4yb8lh7vbbh71dsy90jjvrjvvnrih6larldgpdfv"))

(define rust-regex-syntax-0.8.11
  (crate-source
   "regex-syntax"
   "0.8.11"
   "1m25h5q2wp976fb9gc3dsc9l99svcvd5cri8lncb51c46ydgzxnn"))

(define rust-relative-path-1.9.3
  (crate-source
   "relative-path"
   "1.9.3"
   "1limlh8fzwi21g0473fqzd6fln9iqkwvzp3816bxi31pkilz6fds"))

(define rust-reqwest-0.12.28
  (crate-source
   "reqwest"
   "0.12.28"
   "0iqidijghgqbzl3bjg5hb4zmigwa4r612bgi0yiq0c90b6jkrpgd"))

(define rust-rfc2047-decoder-1.1.0
  (crate-source
   "rfc2047-decoder"
   "1.1.0"
   "05jd6f0pw636z21fy1ncrxim90pqdfi7ycnfmzz3siww4w4a0kjh"))

(define rust-ring-0.17.14
  (crate-source
   "ring"
   "0.17.14"
   "1dw32gv19ccq4hsx3ribhpdzri1vnrlcfqb2vj41xn4l49n9ws54"))

(define rust-rle-decode-fast-1.0.3
  (crate-source
   "rle-decode-fast"
   "1.0.3"
   "08kljzl29rpm12fiz0qj5pask49aiswdvcjigdcq73s224rgd0im"))

(define rust-rmcp-3.1.0
  (crate-source
   "rmcp"
   "3.1.0"
   "15ankqjsm3vvspp5qmwq7p23kh2mlj2ggnl61vl8gsb6r4bb49md"))

(define rust-rmcp-macros-3.1.0
  (crate-source
   "rmcp-macros"
   "3.1.0"
   "0y8bgrdk8wicd7hj9lln0q3g03dw4w6z9hhlnrqjmgn262379g21"))

(define rust-rmp-0.8.15
  (crate-source
   "rmp"
   "0.8.15"
   "033rwyzxyj5f7iviacvcz1y2wmlbadw1cma2anrwkckjsdrbxa2b"))

(define rust-rmp-serde-1.3.1
  (crate-source
   "rmp-serde"
   "1.3.1"
   "0md1cx5w0hwc40nb55z3c4j26b4npkmp06k8s5vvbycfikp1py3j"))

(define rust-roxmltree-0.21.1
  (crate-source
   "roxmltree"
   "0.21.1"
   "1fxc3jgvl2rk05bw0hj86azqg6mzlijh06gyi9pw69b1qw84p5pi"))

(define rust-rsqlite-vfs-0.1.1
  (crate-source
   "rsqlite-vfs"
   "0.1.1"
   "0b0rrh8qpi0gx5whhr9w7b7yqdrwz8hwdx9x211blzwavzj9l765"))

(define rust-rstest-0.26.1
  (crate-source
   "rstest"
   "0.26.1"
   "0jcxhg9mxlr2p9an14algbcq6ax7r0sk1w1kbals5aiv0qy1k8zm"))

(define rust-rstest-macros-0.26.1
  (crate-source
   "rstest_macros"
   "0.26.1"
   "185v185wn2x3llp3nn1i7h44vi5ffnnsj8b1a32m2ygzy08m714w"))

(define rust-rstest-reuse-0.7.0
  (crate-source
   "rstest_reuse"
   "0.7.0"
   "057y4v1rh9br58n2m3xqvm8xyx8k96jpgibgls3sah78f93gpa5k"))

(define rust-rusqlite-0.40.1
  (crate-source
   "rusqlite"
   "0.40.1"
   "08rkljp4mg4ng2y0g1175v7ji548bvnx2cvc8jv0jccyn4886hqi"))

(define rust-rust-ini-0.21.3
  (crate-source
   "rust-ini"
   "0.21.3"
   "1iw8yss8ncygd9yx5ay5gmr2jk7vcyv1d0d5pr1jlfcncqmqsvkr"))

(define rust-rust-decimal-1.40.0
  (crate-source
   "rust_decimal"
   "1.40.0"
   "1c1yb8lms5aqzlaarwa0d7mn30s2h7x46djipiyginsjk38h7xv1"))

(define rust-rustc-demangle-0.1.27
  (crate-source
   "rustc-demangle"
   "0.1.27"
   "17f0jl6lgsy8kwxdzxp3s2wmipvlpna03kkc4vkqr1gwv5lqh2xm"))

(define rust-rustc-hash-2.1.2
  (crate-source
   "rustc-hash"
   "2.1.2"
   "1gjdc5bw9982cj176jvgz9rrqf9xvr1q1ddpzywf5qhs7yzhlc4l"))

(define rust-rustc-version-0.4.1
  (crate-source
   "rustc_version"
   "0.4.1"
   "14lvdsmr5si5qbqzrajgb6vfn69k0sfygrvfvr2mps26xwi3mjyg"))

(define rust-rustix-0.38.44
  (crate-source
   "rustix"
   "0.38.44"
   "0m61v0h15lf5rrnbjhcb9306bgqrhskrqv7i1n0939dsw8dbrdgx"))

(define rust-rustix-1.1.4
  (crate-source
   "rustix"
   "1.1.4"
   "14511f9yjqh0ix07xjrjpllah3325774gfwi9zpq72sip5jlbzmn"))

(define rust-rustls-0.23.38
  (crate-source
   "rustls"
   "0.23.38"
   "089ssmhd79f0kd22brh6lkaadql2p3pi6579ax1s0kn1n9pldyb9"))

(define rust-rustls-native-certs-0.8.3
  (crate-source
   "rustls-native-certs"
   "0.8.3"
   "0qrajg2n90bcr3bcq6j95gjm7a9lirfkkdmjj32419dyyzan0931"))

(define rust-rustls-pki-types-1.14.0
  (crate-source
   "rustls-pki-types"
   "1.14.0"
   "1p9zsgslvwzzkzhm6bqicffqndr4jpx67992b0vl0pi21a5hy15y"))

(define rust-rustls-platform-verifier-0.6.2
  (crate-source
   "rustls-platform-verifier"
   "0.6.2"
   "110pqkn3px9115pb6h6a23cq738v29gbp559dfvpmbibqzmzx68x"))

(define rust-rustls-platform-verifier-android-0.1.1
  (crate-source
   "rustls-platform-verifier-android"
   "0.1.1"
   "13vq6sxsgz9547xm2zbdxiw8x7ad1g8n8ax6xvxsjqszk7q6awgq"))

(define rust-rustls-webpki-0.103.13
  (crate-source
   "rustls-webpki"
   "0.103.13"
   "0vkm7z9pnxz5qz66p2kmyy2pwx0g4jnsbqk5xzfhs4czcjl2ki31"))

(define rust-rustversion-1.0.22
  (crate-source
   "rustversion"
   "1.0.22"
   "0vfl70jhv72scd9rfqgr2n11m5i9l1acnk684m2w83w0zbqdx75k"))

(define rust-ryu-1.0.23
  (crate-source
   "ryu"
   "1.0.23"
   "0zs70sg00l2fb9jwrf6cbkdyscjs53anrvai2hf7npyyfi5blx4p"))

(define rust-same-file-1.0.6
  (crate-source
   "same-file"
   "1.0.6"
   "00h5j1w87dmhnvbv9l8bic3y7xxsnjmssvifw2ayvgx9mb1ivz4k"))

(define rust-schannel-0.1.29
  (crate-source
   "schannel"
   "0.1.29"
   "0ffrzz5vf2s3gnzvphgb5gg8fqifvryl07qcf7q3x1scj3jbghci"))

(define rust-schemars-1.2.1
  (crate-source
   "schemars"
   "1.2.1"
   "1k16qzpdpy6p9hrh18q2l6cwawxzyqi25f8masa13l0wm8v2zd52"))

(define rust-schemars-derive-1.2.1
  (crate-source
   "schemars_derive"
   "1.2.1"
   "0zrh1ckcc63sqy5hyhnh2lbxh4vmbij2z4f1g5za1vmayi85n4bx"))

(define rust-scopeguard-1.2.0
  (crate-source
   "scopeguard"
   "1.2.0"
   "0jcz9sd47zlsgcnm1hdw0664krxwb5gczlif4qngj2aif8vky54l"))

(define rust-scraper-0.27.0
  (crate-source
   "scraper"
   "0.27.0"
   "1hmbpwm9815qwv9fi0smwp9dv2gp1v4bn0fx0vxqn13g556vxl5x"))

(define rust-scroll-0.11.0
  (crate-source
   "scroll"
   "0.11.0"
   "1nhrhpzf95pxbcjjy222blwf8rl3adws6vsqax0yzyxsa6snbi84"))

(define rust-scroll-derive-0.11.1
  (crate-source
   "scroll_derive"
   "0.11.1"
   "1bi5ljnzksvqhic6j7i2a2ap41s78xr0gifkgjxdxlj63pw4kc8x"))

(define rust-security-framework-3.7.0
  (crate-source
   "security-framework"
   "3.7.0"
   "07fd0j29j8yczb3hd430vwz784lx9knb5xwbvqna1nbkbivvrx5p"))

(define rust-security-framework-sys-2.17.0
  (crate-source
   "security-framework-sys"
   "2.17.0"
   "1qr0w0y9iwvmv3hwg653q1igngnc5b74xcf0679cbv23z0fnkqkc"))

(define rust-selectors-0.38.0
  (crate-source
   "selectors"
   "0.38.0"
   "0k8ik7p8rwlvrl51krh6wxx3jms3hwxkn8lblaw2fa4ik31a3pwa"))

(define rust-self-cell-1.2.2
  (crate-source
   "self_cell"
   "1.2.2"
   "12cdmh9p2h72rmw923kj841jji4k0vrykihvx19fn059az8pcbmi"))

(define rust-semver-1.0.27
  (crate-source
   "semver"
   "1.0.27"
   "1qmi3akfrnqc2hfkdgcxhld5bv961wbk8my3ascv5068mc5fnryp"))

(define rust-serde-1.0.229
  (crate-source
   "serde"
   "1.0.229"
   "1fp04fq4a79bpm61xz1zy0pbz4kpc7d771zii1k3inmszq55jj21"))

(define rust-serde-saphyr-1.0.0
  (crate-source
   "serde-saphyr"
   "1.0.0"
   "10y8n51wdxq57gskc4z0i7xi25hdwnx12g431g08ifx5m059rd2v"))

(define rust-serde-core-1.0.229
  (crate-source
   "serde_core"
   "1.0.229"
   "0j1ajiha76h3nmd976il9li6975k121xa7jb39ws8n0yqp4s5p37"))

(define rust-serde-derive-1.0.229
  (crate-source
   "serde_derive"
   "1.0.229"
   "0j4k63i7h1bikxwz2c89ig0hrwbnl9mz1czn85xx99x5cc9dg9g7"))

(define rust-serde-derive-internals-0.29.1
  (crate-source
   "serde_derive_internals"
   "0.29.1"
   "04g7macx819vbnxhi52cx0nhxi56xlhrybgwybyy7fb9m4h6mlhq"))

(define rust-serde-json-1.0.151
  (crate-source
   "serde_json"
   "1.0.151"
   "051zww7lvpw147vvwss1ng6w587qyrkzg75fvj08q2dfrmgbahf8"))

(define rust-serde-regex-1.2.0
  (crate-source
   "serde_regex"
   "1.2.0"
   "04kh0nq22kj105ridmxcnjjwm6pxg6s5kd0n1zqwzkihac68vz5s"))

(define rust-serde-repr-0.1.20
  (crate-source
   "serde_repr"
   "0.1.20"
   "1755gss3f6lwvv23pk7fhnjdkjw7609rcgjlr8vjg6791blf6php"))

(define rust-serde-spanned-1.1.1
  (crate-source
   "serde_spanned"
   "1.1.1"
   "09jzk7i6wihn3d8i3wi4j4n98ghi93c3b8m8k64nxq0ijn3vaqk6"))

(define rust-serde-stacker-0.1.14
  (crate-source
   "serde_stacker"
   "0.1.14"
   "0jhgpgcki4gqa8z28g1bxliz6ilf9wsak4r2ybpyfjqcsmsn74yl"))

(define rust-serde-urlencoded-0.7.1
  (crate-source
   "serde_urlencoded"
   "0.7.1"
   "1zgklbdaysj3230xivihs30qi5vkhigg323a9m62k8jwf4a1qjfk"))

(define rust-serde-yaml-0.8.26
  (crate-source
   "serde_yaml"
   "0.8.26"
   "06y7gxy312mink8nsnmci9cw0ykpgsdcxmayg0snmdbnnwrp92jp"))

(define rust-servo-arc-0.4.3
  (crate-source
   "servo_arc"
   "0.4.3"
   "0c2rl0r9x4kbppwlcrd5bnwds612na179im7kb37vqadncxbh3qp"))

(define rust-sha1-0.10.6
  (crate-source
   "sha1"
   "0.10.6"
   "1fnnxlfg08xhkmwf2ahv634as30l1i3xhlhkvxflmasi5nd85gz3"))

(define rust-sha1-smol-1.0.1
  (crate-source
   "sha1_smol"
   "1.0.1"
   "0pbh2xjfnzgblws3hims0ib5bphv7r5rfdpizyh51vnzvnribymv"))

(define rust-sha2-0.10.9
  (crate-source
   "sha2"
   "0.10.9"
   "10xjj843v31ghsksd9sl9y12qfc48157j1xpb8v1ml39jy0psl57"))

(define rust-sha2-0.11.0
  (crate-source
   "sha2"
   "0.11.0"
   "1x15x22c5yf54ac0np5bfqnq5x0hdw4wqzpi48zwn94ma0bsfss4"))

(define rust-shadow-rs-2.0.0
  (crate-source
   "shadow-rs"
   "2.0.0"
   "17n3hx3vcyqpgmx516ybb5vp8vh4jka333521kk3dgbp415rplqx"))

(define rust-sharded-slab-0.1.7
  (crate-source
   "sharded-slab"
   "0.1.7"
   "1xipjr4nqsgw34k7a2cgj9zaasl2ds6jwn89886kww93d32a637l"))

(define rust-shlex-1.3.0
  (crate-source
   "shlex"
   "1.3.0"
   "0r1y6bv26c1scpxvhg2cabimrmwgbp4p3wy6syj9n0c4s3q2znhg"))

(define rust-signal-hook-0.3.18
  (crate-source
   "signal-hook"
   "0.3.18"
   "1qnnbq4g2vixfmlv28i1whkr0hikrf1bsc4xjy2aasj2yina30fq"))

(define rust-signal-hook-0.4.3
  (crate-source
   "signal-hook"
   "0.4.3"
   "13pv6n4sacdh8dr8i9s5gi0ahp62xqk9bkkxlbsgk7sglyfp0mrv"))

(define rust-signal-hook-mio-0.2.5
  (crate-source
   "signal-hook-mio"
   "0.2.5"
   "1k20rr76ngvmzr6kskkl7dv8iyb84cbydpjbjk3mpcj0lykijnmp"))

(define rust-signal-hook-registry-1.4.8
  (crate-source
   "signal-hook-registry"
   "1.4.8"
   "06vc7pmnki6lmxar3z31gkyg9cw7py5x9g7px70gy2hil75nkny4"))

(define rust-simd-adler32-0.3.8
  (crate-source
   "simd-adler32"
   "0.3.8"
   "18lx2gdgislabbvlgw5q3j5ssrr77v8kmkrxaanp3liimp2sc873"))

(define rust-simd-json-0.17.0
  (crate-source
   "simd-json"
   "0.17.0"
   "1qv43zq42p3qy08vy22nffkgcxmk3b422qyv900a4aqd65pi4ma2"))

(define rust-simdutf8-0.1.5
  (crate-source
   "simdutf8"
   "0.1.5"
   "0vmpf7xaa0dnaikib5jlx6y4dxd3hxqz6l830qb079g7wcsgxag3"))

(define rust-similar-2.7.0
  (crate-source
   "similar"
   "2.7.0"
   "1aidids7ymfr96s70232s6962v5g9l4zwhkvcjp4c5hlb6b5vfxv"))

(define rust-similar-3.1.0
  (crate-source
   "similar"
   "3.1.0"
   "0gsbicbdhzgbyq07mkkq9kx0fp4xxjw6jd438xxljbny3s33xn84"))

(define rust-simplelog-0.12.2
  (crate-source
   "simplelog"
   "0.12.2"
   "1h59cp84gwdmbxiljq6qmqq1x3lv9ikc1gb32f5ya7pgzbdpl98n"))

(define rust-siphasher-1.0.2
  (crate-source
   "siphasher"
   "1.0.2"
   "13k7cfbpcm8qgj9p2n8dwg9skv9s0hxk5my30j5chy1p4l78bamj"))

(define rust-slab-0.4.12
  (crate-source
   "slab"
   "0.4.12"
   "1xcwik6s6zbd3lf51kkrcicdq2j4c1fw0yjdai2apy9467i0sy8c"))

(define rust-slotmap-1.1.1
  (crate-source
   "slotmap"
   "1.1.1"
   "0f20xf53zaysx9ydzkwwqm6hsjyb8lj2j6amhg57iln3jcy8rmdx"))

(define rust-smallvec-1.15.1
  (crate-source
   "smallvec"
   "1.15.1"
   "00xxdxxpgyq5vjnpljvkmy99xij5rxgh913ii1v16kzynnivgcb7"))

(define rust-smol-str-0.3.6
  (crate-source
   "smol_str"
   "0.3.6"
   "08qm7y1k2fkzrs8k78m03h4z4wbarv5g0bfr5m62m1glzil77aja"))

(define rust-snap-1.1.1
  (crate-source
   "snap"
   "1.1.1"
   "0fxw80m831l76a5zxcwmz2aq7mcwc1pp345pnljl4cv1kbxnfsqv"))

(define rust-socket2-0.5.10
  (crate-source
   "socket2"
   "0.5.10"
   "0y067ki5q946w91xlz2sb175pnfazizva6fi3kfp639mxnmpc8z2"))

(define rust-socket2-0.6.3
  (crate-source
   "socket2"
   "0.6.3"
   "0gkjjcyn69hqhhlh5kl8byk5m0d7hyrp2aqwzbs3d33q208nwxis"))

(define rust-socks-0.3.4
  (crate-source
   "socks"
   "0.3.4"
   "12ymihhib0zybm6n4mrvh39hj1dm0ya8mqnqdly63079kayxphzh"))

(define rust-sqlite-wasm-rs-0.5.5
  (crate-source
   "sqlite-wasm-rs"
   "0.5.5"
   "0xax662vn9vi9zmnrwqbbmjbjylczaxkn1fhrvhxfd96m06zqgnw"))

(define rust-sqlparser-0.60.0
  (crate-source
   "sqlparser"
   "0.60.0"
   "1zvlfzg27x03m72gzsdz4miigl0k7375q4jzpxsi6k2w0ims2njh"))

(define rust-sqlparser-0.61.0
  (crate-source
   "sqlparser"
   "0.61.0"
   "1dqc419qs0cmbd62j8pwrqxn1giakb5fpayby4d8x03w9n6ymxfv"))

(define rust-sqlparser-derive-0.4.0
  (crate-source
   "sqlparser_derive"
   "0.4.0"
   "0f6cyn3rgfxncxhxk9c78a6i89yqv5w1f9zayfwk22r7bqfmb3h2"))

(define rust-sse-stream-0.2.5
  (crate-source
   "sse-stream"
   "0.2.5"
   "07knnhxfghnkm46b8nna49li9x99crp12qk11y5lpv74mnbg48y1"))

(define rust-stable-deref-trait-1.2.1
  (crate-source
   "stable_deref_trait"
   "1.2.1"
   "15h5h73ppqyhdhx6ywxfj88azmrpml9gl6zp3pwy2malqa6vxqkc"))

(define rust-stacker-0.1.23
  (crate-source
   "stacker"
   "0.1.23"
   "04y0f6yfvz8rky3b3rx2mssf6ij35bf7c88fs48r8l4xc0ilmmq8"))

(define rust-static-assertions-1.1.0
  (crate-source
   "static_assertions"
   "1.1.0"
   "0gsl6xmw10gvn3zs1rv99laj5ig7ylffnh71f9l34js4nr4r7sx2"))

(define rust-streaming-decompression-0.1.2
  (crate-source
   "streaming-decompression"
   "0.1.2"
   "1wscqj3s30qknda778wf7z99mknk65p0h9hhs658l4pvkfqw6v5z"))

(define rust-streaming-iterator-0.1.9
  (crate-source
   "streaming-iterator"
   "0.1.9"
   "0845zdv8qb7zwqzglpqc0830i43xh3fb6vqms155wz85qfvk28ib"))

(define rust-strength-reduce-0.2.4
  (crate-source
   "strength_reduce"
   "0.2.4"
   "10jdq9dijjdkb20wg1dmwg447rnj37jbq0mwvbadvqi2gys5x2gy"))

(define rust-string-cache-0.8.9
  (crate-source
   "string_cache"
   "0.8.9"
   "03z7km2kzlwiv2r2qifq5riv4g8phazwng9wnvs3py3lzainnxxz"))

(define rust-string-cache-0.9.0
  (crate-source
   "string_cache"
   "0.9.0"
   "008rwf8gd1xhwr523r5zzzgypgkfmrz6l3wwh7r2k9w5qzw9d1d1"))

(define rust-string-cache-codegen-0.5.4
  (crate-source
   "string_cache_codegen"
   "0.5.4"
   "181ir4d6y053s1kka2idpjx5g9d9jgll6fy517jhzzpi2n3r44f7"))

(define rust-string-cache-codegen-0.6.1
  (crate-source
   "string_cache_codegen"
   "0.6.1"
   "0scvya8dsfard2r8m7pb2cjnar312jc9g165fsghacdjdpj3amjq"))

(define rust-strip-ansi-escapes-0.2.1
  (crate-source
   "strip-ansi-escapes"
   "0.2.1"
   "0980min1s9f5g47rwlq8l9njks952a0jlz0v7yxrm5p7www813ra"))

(define rust-strsim-0.11.1
  (crate-source
   "strsim"
   "0.11.1"
   "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x"))

(define rust-strum-0.27.2
  (crate-source
   "strum"
   "0.27.2"
   "1ksb9jssw4bg9kmv9nlgp2jqa4vnsa3y4q9zkppvl952q7vdc8xg"))

(define rust-strum-0.28.0
  (crate-source
   "strum"
   "0.28.0"
   "1ggr0if083c1mz9w33hkdjsp0iqk2fz9n49bvb73knwihydxwa4n"))

(define rust-strum-macros-0.27.2
  (crate-source
   "strum_macros"
   "0.27.2"
   "19xwikxma0yi70fxkcy1yxcv0ica8gf3jnh5gj936jza8lwcx5bn"))

(define rust-strum-macros-0.28.0
  (crate-source
   "strum_macros"
   "0.28.0"
   "0r7n6v5b3x85m52isyc8wq78irmr22g0hmj1xn3pbq8f4yhfx1db"))

(define rust-subtle-2.6.1
  (crate-source
   "subtle"
   "2.6.1"
   "14ijxaymghbl1p0wql9cib5zlwiina7kall6w7g89csprkgbvhhk"))

(define rust-supports-color-3.0.2
  (crate-source
   "supports-color"
   "3.0.2"
   "1mk7r2j6l7zmqk3pg7av0l6viq413lmk1vz4bjnf9lnq5liwfky6"))

(define rust-supports-hyperlinks-3.2.0
  (crate-source
   "supports-hyperlinks"
   "3.2.0"
   "14byz5m3mcfz8jcg3vd639sp5qvd6svs05di40qvik0i7d9bd5p3"))

(define rust-supports-unicode-3.0.0
  (crate-source
   "supports-unicode"
   "3.0.0"
   "1qpc344453x3ai4k9iygxnbk6lr2nw5jflj8ns5q3dbcmwq1lh5p"))

(define rust-sxd-document-0.3.2
  (crate-source
   "sxd-document"
   "0.3.2"
   "0y10shqmy9xb73g403rg1108wsagny9d8jrcm081pbwzpqvjzn4l"))

(define rust-sxd-xpath-0.4.2
  (crate-source
   "sxd-xpath"
   "0.4.2"
   "1sin3g8lzans065gjcwrpm7gdpwdpdg4rpi91rlvb1q8sfjrvqrn"))

(define rust-symlink-0.1.0
  (crate-source
   "symlink"
   "0.1.0"
   "02h1i0b81mxb4vns4xrvrfibpcvs7jqqav8p3yilwik8cv73r5x7"))

(define rust-syn-1.0.109
  (crate-source
   "syn"
   "1.0.109"
   "0ds2if4600bd59wsv7jjgfkayfzy3hnazs394kz6zdkmna8l3dkj"))

(define rust-syn-2.0.117
  (crate-source
   "syn"
   "2.0.117"
   "16cv7c0wbn8amxc54n4w15kxlx5ypdmla8s0gxr2l7bv7s0bhrg6"))

(define rust-syn-3.0.2
  (crate-source
   "syn"
   "3.0.2"
   "18w7g5b9c585jw2rgvhygqdli8hq7w2jcds4h05lgz5plbbdc1x2"))

(define rust-sync-wrapper-1.0.2
  (crate-source
   "sync_wrapper"
   "1.0.2"
   "0qvjyasd6w18mjg5xlaq5jgy84jsjfsvmnn12c13gypxbv75dwhb"))

(define rust-synchronoise-1.0.1
  (crate-source
   "synchronoise"
   "1.0.1"
   "1wnylkdf84520ks7a70fnwds2wibxmnkgqzz3j6ww9n61wwh3g1x"))

(define rust-synstructure-0.13.2
  (crate-source
   "synstructure"
   "0.13.2"
   "1lh9lx3r3jb18f8sbj29am5hm9jymvbwh6jb1izsnnxgvgrp12kj"))

(define rust-sys-locale-0.3.2
  (crate-source
   "sys-locale"
   "0.3.2"
   "1i16hq9mkwpzqvixjfy1ph4i2q5klgagjg4hibz6k894l2crmawf"))

(define rust-sysinfo-0.37.2
  (crate-source
   "sysinfo"
   "0.37.2"
   "07xizvikp5j2f6jky0j4vlaxp21djznzja1m0z70f77xmxf7sq0n"))

(define rust-sysinfo-0.39.3
  (crate-source
   "sysinfo"
   "0.39.3"
   "15mskbv4bjdicg6phhqz85fkfqml9bgsv2p2jzla7k8gq4wdkl11"))

(define rust-tabled-0.21.0
  (crate-source
   "tabled"
   "0.21.0"
   "1zsxc1wc1h16hcjirfqn5v4377bwjrbnplca89pasi58dlp6dp5m"))

(define rust-tango-bench-0.7.2
  (crate-source
   "tango-bench"
   "0.7.2"
   "1rsk3am9bpwl2lcq4hzwz8jv4n6bv3s9j4jm7yq3bq7d566xnm5s"))

(define rust-tempfile-3.27.0
  (crate-source
   "tempfile"
   "3.27.0"
   "1gblhnyfjsbg9wjg194n89wrzah7jy3yzgnyzhp56f3v9jd7wj9j"))

(define rust-tendril-0.4.3
  (crate-source
   "tendril"
   "0.4.3"
   "1c3vip59sqwxn148i714nmkrvjzbk7105vj0h92s6r64bw614jnj"))

(define rust-tendril-0.5.0
  (crate-source
   "tendril"
   "0.5.0"
   "090dcvslanahwjnm4ihggjiv7fc82gir9c24nps319fmd71hyyf4"))

(define rust-termcolor-1.4.1
  (crate-source
   "termcolor"
   "1.4.1"
   "0mappjh3fj3p2nmrg4y7qv94rchwi9mzmgmfflr8p2awdj7lyy86"))

(define rust-terminal-size-0.4.3
  (crate-source
   "terminal_size"
   "0.4.3"
   "1l7cicmz49c0cyskfp5a389rsai649xi7y032v73475ikjbwpf30"))

(define rust-termtree-0.5.1
  (crate-source
   "termtree"
   "0.5.1"
   "10s610ax6nb70yi7xfmwcb6d3wi9sj5isd0m63gy2pizr2zgwl4g"))

(define rust-testing-table-0.3.0
  (crate-source
   "testing_table"
   "0.3.0"
   "1k0l036hgxmvjzr8ngc57ngkhnza3p9xh6cyc5jlz8lmk7iam38g"))

(define rust-textwrap-0.16.2
  (crate-source
   "textwrap"
   "0.16.2"
   "0mrhd8q0dnh5hwbwhiv89c6i41yzmhw4clwa592rrp24b9hlfdf1"))

(define rust-thiserror-1.0.69
  (crate-source
   "thiserror"
   "1.0.69"
   "0lizjay08agcr5hs9yfzzj6axs53a2rgx070a1dsi3jpkcrzbamn"))

(define rust-thiserror-2.0.19
  (crate-source
   "thiserror"
   "2.0.19"
   "1ngwxsjsa64v1n7vb90h2b0i3fqk1piwaf0z6fqdacqfhjc3b909"))

(define rust-thiserror-impl-1.0.69
  (crate-source
   "thiserror-impl"
   "1.0.69"
   "1h84fmn2nai41cxbhk6pqf46bxqq1b344v8yz089w1chzi76rvjg"))

(define rust-thiserror-impl-2.0.19
  (crate-source
   "thiserror-impl"
   "2.0.19"
   "1ka10pqy1g8zy5al9m8yadg30jp8hx0q80j8awmd8131yw6gxjs3"))

(define rust-thread-tree-0.3.3
  (crate-source
   "thread-tree"
   "0.3.3"
   "0c6n8m5xrxffxkvfqbn7z09n38r493hn77sdjljkm5a7p063gggz"))

(define rust-thread-local-1.1.9
  (crate-source
   "thread_local"
   "1.1.9"
   "1191jvl8d63agnq06pcnarivf63qzgpws5xa33hgc92gjjj4c0pn"))

(define rust-tiff-0.11.3
  (crate-source
   "tiff"
   "0.11.3"
   "0lmw68ic77sixk17r4rl2vsv00rqhja3yj2h9p5bcd9x6krylgxn"))

(define rust-time-0.3.47
  (crate-source
   "time"
   "0.3.47"
   "0b7g9ly2iabrlgizliz6v5x23yq5d6bpp0mqz6407z1s526d8fvl"))

(define rust-time-core-0.1.8
  (crate-source
   "time-core"
   "0.1.8"
   "1jidl426mw48i7hjj4hs9vxgd9lwqq4vyalm4q8d7y4iwz7y353n"))

(define rust-time-macros-0.2.27
  (crate-source
   "time-macros"
   "0.2.27"
   "058ja265waq275wxvnfwavbz9r1hd4dgwpfn7a1a9a70l32y8w1f"))

(define rust-tiny-keccak-2.0.2
  (crate-source
   "tiny-keccak"
   "2.0.2"
   "0dq2x0hjffmixgyf6xv9wgsbcxkd65ld0wrfqmagji8a829kg79c"))

(define rust-tinystr-0.8.2
  (crate-source
   "tinystr"
   "0.8.2"
   "0sa8z88axdsf088hgw5p4xcyi6g3w3sgbb6qdp81bph9bk2fkls2"))

(define rust-tinyvec-1.10.0
  (crate-source
   "tinyvec"
   "1.10.0"
   "1yhk0qdqyiaa4v2j9h8pzax5gxgwpz4da0lcphfil6g6pk1zv9dz"))

(define rust-tinyvec-macros-0.1.1
  (crate-source
   "tinyvec_macros"
   "0.1.1"
   "081gag86208sc3y6sdkshgw3vysm5d34p431dzw0bshz66ncng0z"))

(define rust-titlecase-3.6.0
  (crate-source
   "titlecase"
   "3.6.0"
   "0h4xcxck5pvq6czki6idxdfhvqawpvi4k08caa9b8n8xm6470mpb"))

(define rust-tokio-1.53.1
  (crate-source
   "tokio"
   "1.53.1"
   "1v8b3b45pkpbibls75yniqbvx5dlks2708141ljni5mnf6lawb10"))

(define rust-tokio-macros-2.7.0
  (crate-source
   "tokio-macros"
   "2.7.0"
   "15m4f37mdafs0gg36sh0rskm1i768lb7zmp8bw67kaxr3avnqniq"))

(define rust-tokio-native-tls-0.3.1
  (crate-source
   "tokio-native-tls"
   "0.3.1"
   "1wkfg6zn85zckmv4im7mv20ca6b1vmlib5xwz9p7g19wjfmpdbmv"))

(define rust-tokio-rustls-0.26.4
  (crate-source
   "tokio-rustls"
   "0.26.4"
   "0qggwknz9w4bbsv1z158hlnpkm97j3w8v31586jipn99byaala8p"))

(define rust-tokio-stream-0.1.18
  (crate-source
   "tokio-stream"
   "0.1.18"
   "0w3cj33605ab58wqd382gnla5pnd9hnr00xgg333np5bka04knij"))

(define rust-tokio-util-0.7.18
  (crate-source
   "tokio-util"
   "0.7.18"
   "1600rd47pylwn7cap1k7s5nvdaa9j7w8kqigzp1qy7mh0p4cxscs"))

(define rust-toml-1.1.2+spec-1.1.0
  (crate-source
   "toml"
   "1.1.2+spec-1.1.0"
   "1vpggpamqhw4852kic7465zsidczsla06wz6friqkkfbhigd3ww1"))

(define rust-toml-datetime-1.1.1+spec-1.1.0
  (crate-source
   "toml_datetime"
   "1.1.1+spec-1.1.0"
   "1mws2mkkf46l7inn77azhm0vdwxngv9vsbhbl0ah33p2c9gzcr9i"))

(define rust-toml-edit-0.25.11+spec-1.1.0
  (crate-source
   "toml_edit"
   "0.25.11+spec-1.1.0"
   "0awzffbkx33v9x4h19b5mfrwp3sn4ifr16y58sbk6j6l5v9c8n8b"))

(define rust-toml-parser-1.1.2+spec-1.1.0
  (crate-source
   "toml_parser"
   "1.1.2+spec-1.1.0"
   "09kmzc55a0j21whm290wlf5a8b18a0qc87a1s8sncrckc6wfkax2"))

(define rust-toml-writer-1.1.1+spec-1.1.0
  (crate-source
   "toml_writer"
   "1.1.1+spec-1.1.0"
   "1nwjhvvrxz8f4ck1qi4xcz2x9qhpci37nrknhxxf9sqk22dsyvbm"))

(define rust-tower-0.5.3
  (crate-source
   "tower"
   "0.5.3"
   "1m5i3a2z1sgs8nnz1hgfq2nr4clpdmizlp1d9qsg358ma5iyzrgb"))

(define rust-tower-http-0.6.8
  (crate-source
   "tower-http"
   "0.6.8"
   "1y514jwzbyrmrkbaajpwmss4rg0mak82k16d6588w9ncaffmbrnl"))

(define rust-tower-layer-0.3.3
  (crate-source
   "tower-layer"
   "0.3.3"
   "03kq92fdzxin51w8iqix06dcfgydyvx7yr6izjq0p626v9n2l70j"))

(define rust-tower-service-0.3.3
  (crate-source
   "tower-service"
   "0.3.3"
   "1hzfkvkci33ra94xjx64vv3pp0sq346w06fpkcdwjcid7zhvdycd"))

(define rust-tracing-0.1.44
  (crate-source
   "tracing"
   "0.1.44"
   "006ilqkg1lmfdh3xhg3z762izfwmxcvz0w7m4qx2qajbz9i1drv3"))

(define rust-tracing-appender-0.2.5
  (crate-source
   "tracing-appender"
   "0.2.5"
   "0g4a6q5s3wafid5lqw1ljzvh1nhk3a4zmb627fxv96dr7qcqc1h5"))

(define rust-tracing-attributes-0.1.31
  (crate-source
   "tracing-attributes"
   "0.1.31"
   "1np8d77shfvz0n7camx2bsf1qw0zg331lra0hxb4cdwnxjjwz43l"))

(define rust-tracing-core-0.1.36
  (crate-source
   "tracing-core"
   "0.1.36"
   "16mpbz6p8vd6j7sf925k9k8wzvm9vdfsjbynbmaxxyq6v7wwm5yv"))

(define rust-tracing-log-0.2.0
  (crate-source
   "tracing-log"
   "0.2.0"
   "1hs77z026k730ij1a9dhahzrl0s073gfa2hm5p0fbl0b80gmz1gf"))

(define rust-tracing-subscriber-0.3.22
  (crate-source
   "tracing-subscriber"
   "0.3.22"
   "07hz575a0p1c2i4xw3gs3hkrykhndnkbfhyqdwjhvayx4ww18c1g"))

(define rust-trash-5.2.6
  (crate-source
   "trash"
   "5.2.6"
   "0ikg6n5844014rj90fq6lbpkjh49qzxijwliihmdkhkfsv3y00kn"))

(define rust-tree-magic-mini-3.2.2
  (crate-source
   "tree_magic_mini"
   "3.2.2"
   "19nm2hkspb8p4gxgk442b1hmbbh9l5fnf7w3nli6rfhw0s85nxmq"))

(define rust-try-lock-0.2.5
  (crate-source
   "try-lock"
   "0.2.5"
   "0jqijrrvm1pyq34zn1jmy2vihd4jcrjlvsh4alkjahhssjnsn8g4"))

(define rust-tui-tree-widget-0.24.0
  (crate-source
   "tui-tree-widget"
   "0.24.0"
   "14pzbpbm3780zkaii6apqi6l8cpn747h577v1hpfx7h0anai3jny"))

(define rust-type-map-0.5.1
  (crate-source
   "type-map"
   "0.5.1"
   "143v32wwgpymxfy4y8s694vyq0wdi7li4s5dmms5w59nj2yxnc6b"))

(define rust-typed-arena-1.7.0
  (crate-source
   "typed-arena"
   "1.7.0"
   "0va4q7439qzlxh9acd9nba7m7sljdh7xz1gp8l0i597b0y025cm9"))

(define rust-typed-path-0.12.3
  (crate-source
   "typed-path"
   "0.12.3"
   "03k051dafrnyg3lbm4c85zg0mpfhbn6l9aq4ryq8yyy8h2dzha4f"))

(define rust-typeid-1.0.3
  (crate-source
   "typeid"
   "1.0.3"
   "0727ypay2p6mlw72gz3yxkqayzdmjckw46sxqpaj08v0b0r64zdw"))

(define rust-typenum-1.20.1
  (crate-source
   "typenum"
   "1.20.1"
   "086s9ly0906kw5yw41249fba97w5zfxf03pyfwdkffvcprqfixdn"))

(define rust-typetag-0.2.21
  (crate-source
   "typetag"
   "0.2.21"
   "1gw69cvsr2z9kn11psjrz9frmkwlhjci9pi442izrg5rm74148my"))

(define rust-typetag-impl-0.2.21
  (crate-source
   "typetag-impl"
   "0.2.21"
   "0ip87p4cmdpbrfn71p2xvfp43b2cc22jnqy3yvqzc8d15fvsk9r7"))

(define rust-ucd-trie-0.1.7
  (crate-source
   "ucd-trie"
   "0.1.7"
   "0wc9p07sqwz320848i52nvyjvpsxkx3kv5bfbmm6s35809fdk5i8"))

(define rust-umask-2.1.0
  (crate-source
   "umask"
   "2.1.0"
   "071xszsd6znk0ik11pxl7mwhf07clsiq3qpzw1ac0dcyak14d6pc"))

(define rust-unic-langid-0.9.6
  (crate-source
   "unic-langid"
   "0.9.6"
   "01bx59sqsx2jz4z7ppxq9kldcjq9dzadkmb2dr7iyc85kcnab2x2"))

(define rust-unic-langid-impl-0.9.6
  (crate-source
   "unic-langid-impl"
   "0.9.6"
   "0n66kdan4cz99n8ra18i27f7w136hmppi4wc0aa7ljsd0h4bzqfw"))

(define rust-unicase-2.9.0
  (crate-source
   "unicase"
   "2.9.0"
   "0hh1wrfd7807mfph2q67jsxqgw8hm82xg2fb8ln8cvblkwxbri6v"))

(define rust-unicode-id-0.3.6
  (crate-source
   "unicode-id"
   "0.3.6"
   "1015prrd0dmy1p6zxymi7zjnnc5y6y6p2xp4rd1w09wrf272ifkh"))

(define rust-unicode-ident-1.0.24
  (crate-source
   "unicode-ident"
   "1.0.24"
   "0xfs8y1g7syl2iykji8zk5hgfi5jw819f5zsrbaxmlzwsly33r76"))

(define rust-unicode-linebreak-0.1.5
  (crate-source
   "unicode-linebreak"
   "0.1.5"
   "07spj2hh3daajg335m4wdav6nfkl0f6c0q72lc37blr97hych29v"))

(define rust-unicode-normalization-0.1.25
  (crate-source
   "unicode-normalization"
   "0.1.25"
   "1s76dcrxw7vs32yhpi0p074apdc3s7lak7809f3qvclwij3zdm2z"))

(define rust-unicode-reverse-1.0.9
  (crate-source
   "unicode-reverse"
   "1.0.9"
   "0xhcybbgy0l8s8n7sfd6hxi854f8znlxqkspzfnr8c62xf44hvsb"))

(define rust-unicode-segmentation-1.13.3
  (crate-source
   "unicode-segmentation"
   "1.13.3"
   "1a47zaq83p386r3baq4m018xd5q4q0grdg56i1x042dzn71x7xf6"))

(define rust-unicode-truncate-2.0.1
  (crate-source
   "unicode-truncate"
   "2.0.1"
   "19g9af5v0a8xaigqbs9hi9csxkg1fff07ycilvwfaqw64fhq1cqn"))

(define rust-unicode-width-0.1.14
  (crate-source
   "unicode-width"
   "0.1.14"
   "1bzn2zv0gp8xxbxbhifw778a7fc93pa6a1kj24jgg9msj07f7mkx"))

(define rust-unicode-width-0.2.2
  (crate-source
   "unicode-width"
   "0.2.2"
   "0m7jjzlcccw716dy9423xxh0clys8pfpllc5smvfxrzdf66h9b5l"))

(define rust-unicode-xid-0.2.6
  (crate-source
   "unicode-xid"
   "0.2.6"
   "0lzqaky89fq0bcrh6jj6bhlz37scfd8c7dsj5dq7y32if56c1hgb"))

(define rust-unit-prefix-0.5.2
  (crate-source
   "unit-prefix"
   "0.5.2"
   "18xr6yhdvlxrv51y6js9npa3qhkzc5b1z4skr5kfzn7kkd449rc1"))

(define rust-untrusted-0.9.0
  (crate-source
   "untrusted"
   "0.9.0"
   "1ha7ib98vkc538x0z60gfn0fc5whqdd85mb87dvisdcaifi6vjwf"))

(define rust-unty-0.0.4
  (crate-source
   "unty"
   "0.0.4"
   "1blhyv01qiv5sb72sal3xa1l8nzck3answawxkkiw3fd2x1phjbd"))

(define rust-update-informer-1.3.0
  (crate-source
   "update-informer"
   "1.3.0"
   "0anf7a855m86hky2nlw337f5ay8sdri02lh8q9javikdfv7pvck7"))

(define rust-ureq-3.3.0
  (crate-source
   "ureq"
   "3.3.0"
   "1h6gmx5kbafh4vn1dbypc01m5gy9imja2n0vxd74v1nmvjf119yy"))

(define rust-ureq-proto-0.6.0
  (crate-source
   "ureq-proto"
   "0.6.0"
   "1340ga8p9qi70c0vdrwg21h1fp4ai7pvfy18z461n6xxn22bm579"))

(define rust-url-2.5.8
  (crate-source
   "url"
   "2.5.8"
   "1v8f7nx3hpr1qh76if0a04sj08k86amsq4h8cvpw6wvk76jahrzz"))

(define rust-urlencoding-2.1.3
  (crate-source
   "urlencoding"
   "2.1.3"
   "1nj99jp37k47n0hvaz5fvz7z6jd0sb4ppvfy3nphr1zbnyixpy6s"))

(define rust-utf-8-0.7.6
  (crate-source
   "utf-8"
   "0.7.6"
   "1a9ns3fvgird0snjkd3wbdhwd3zdpc2h5gpyybrfr6ra5pkqxk09"))

(define rust-utf8-zero-0.8.1
  (crate-source
   "utf8-zero"
   "0.8.1"
   "0vjsmwd1k2wwlsn1phi7mrcjxn4bv8fzk24caxyaw2slr51s1h5q"))

(define rust-utf8-iter-1.0.4
  (crate-source
   "utf8_iter"
   "1.0.4"
   "1gmna9flnj8dbyd8ba17zigrp9c4c3zclngf5lnb5yvz1ri41hdn"))

(define rust-utf8parse-0.2.2
  (crate-source
   "utf8parse"
   "0.2.2"
   "088807qwjq46azicqwbhlmzwrbkz7l4hpw43sdkdyyk524vdxaq6"))

(define rust-uu-cp-0.10.0
  (crate-source
   "uu_cp"
   "0.10.0"
   "0gsx763y1j0phws8aa6x8vgja5wb7yq5sgrrsg1dh7fhv18pmrb7"))

(define rust-uu-mkdir-0.10.0
  (crate-source
   "uu_mkdir"
   "0.10.0"
   "1rw6z72h8hjprjxmixj2dqy8mj1gdcskrsx7ra8d4lmxzjbaa246"))

(define rust-uu-mktemp-0.10.0
  (crate-source
   "uu_mktemp"
   "0.10.0"
   "1rzvnqwj0q8q2vl4h7alw2cx12744fsdc567x90anp5zkhiqv85j"))

(define rust-uu-mv-0.10.0
  (crate-source
   "uu_mv"
   "0.10.0"
   "1v81dh1zdw9ayldy0aj4mlqnphnx2g6sf5y0hlry1931smwxzd0x"))

(define rust-uu-touch-0.10.0
  (crate-source
   "uu_touch"
   "0.10.0"
   "1cwawsq6kcmcdsvb419jnwwjl6mzsp67v6r0lcyb0j61rmdjkybp"))

(define rust-uu-uname-0.10.0
  (crate-source
   "uu_uname"
   "0.10.0"
   "1bgsl9888y17lzgg6igjfvamwi9zy1kvqbl8lkw52qs96krbqwj1"))

(define rust-uu-whoami-0.10.0
  (crate-source
   "uu_whoami"
   "0.10.0"
   "1gsw2c58q797d4i1yc4s3qcwpknvrxx50h5k870bhri64z129dxs"))

(define rust-uucore-0.10.0
  (crate-source
   "uucore"
   "0.10.0"
   "1m5qw1m923j2fms72ii78gwx72jbp71mdyd9zfpi5vdjigyx0zg9"))

(define rust-uucore-procs-0.10.0
  (crate-source
   "uucore_procs"
   "0.10.0"
   "0n0z86zsa29gw7mpbgrp36j77f4anh2qz2dxnk6l5sj6h211nzwh"))

(define rust-uuid-1.24.0
  (crate-source
   "uuid"
   "1.24.0"
   "0faj5x0zgri8m3i8dv9qgyhiwqwdyhbl2g351cp3iin4ynk26fdz"))

(define rust-v-escape-base-0.1.0
  (crate-source
   "v_escape-base"
   "0.1.0"
   "0ggva3djyq15zfbx6n2zqk4g4jchvfrmb3jp9ccsyx8bhg72y8gi"))

(define rust-v-htmlescape-0.17.0
  (crate-source
   "v_htmlescape"
   "0.17.0"
   "168dfhjazwdfdb2r1qd2srjd4nycr35rcn382wa69v73r59kvyxy"))

(define rust-valuable-0.1.1
  (crate-source
   "valuable"
   "0.1.1"
   "0r9srp55v7g27s5bg7a2m095fzckrcdca5maih6dy9bay6fflwxs"))

(define rust-value-trait-0.12.1
  (crate-source
   "value-trait"
   "0.12.1"
   "0nfb12mvbzypbskq5q6gxbc64xprw8i5v45k06jj01xg6g3z104f"))

(define rust-vcpkg-0.2.15
  (crate-source
   "vcpkg"
   "0.2.15"
   "09i4nf5y8lig6xgj3f7fyrvzd3nlaw4znrihw8psidvv5yk4xkdc"))

(define rust-version-check-0.9.5
  (crate-source
   "version_check"
   "0.9.5"
   "0nhhi4i5x89gm911azqbn7avs9mdacw2i3vcz3cnmz3mv4rqz4hb"))

(define rust-virtue-0.0.18
  (crate-source
   "virtue"
   "0.0.18"
   "1cgp79pzzs117kjlc3jnnkixbyaqri12j40mx2an41qhrymv27h5"))

(define rust-vsimd-0.8.0
  (crate-source
   "vsimd"
   "0.8.0"
   "0r4wn54jxb12r0x023r5yxcrqk785akmbddqkcafz9fm03584c2w"))

(define rust-vte-0.14.1
  (crate-source
   "vte"
   "0.14.1"
   "0xy01fgkzb2080prh2ncd8949hm2248fc5wf1lryhdrhxzbxq7r3"))

(define rust-wait-timeout-0.2.1
  (crate-source
   "wait-timeout"
   "0.2.1"
   "04azqv9mnfxgvnc8j2wp362xraybakh2dy1nj22gj51rdl93pb09"))

(define rust-walkdir-2.5.0
  (crate-source
   "walkdir"
   "2.5.0"
   "0jsy7a710qv8gld5957ybrnc07gavppp963gs32xk4ag8130jy99"))

(define rust-want-0.3.1
  (crate-source
   "want"
   "0.3.1"
   "03hbfrnvqqdchb5kgxyavb9jabwza0dmh2vw5kg0dq8rxl57d9xz"))

(define rust-wasi-0.11.1+wasi-snapshot-preview1
  (crate-source
   "wasi"
   "0.11.1+wasi-snapshot-preview1"
   "0jx49r7nbkbhyfrfyhz0bm4817yrnxgd3jiwwwfv0zl439jyrwyc"))

(define rust-wasip2-1.0.2+wasi-0.2.9
  (crate-source
   "wasip2"
   "1.0.2+wasi-0.2.9"
   "1xdw7v08jpfjdg94sp4lbdgzwa587m5ifpz6fpdnkh02kwizj5wm"))

(define rust-wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06
  (crate-source
   "wasip3"
   "0.4.0+wasi-0.3.0-rc-2026-01-06"
   "19dc8p0y2mfrvgk3qw3c3240nfbylv22mvyxz84dqpgai2zzha2l"))

(define rust-wasm-bindgen-0.2.114
  (crate-source
   "wasm-bindgen"
   "0.2.114"
   "13nkhw552hpllrrmkd2x9y4bmcxr82kdpky2n667kqzcq6jzjck5"))

(define rust-wasm-bindgen-futures-0.4.64
  (crate-source
   "wasm-bindgen-futures"
   "0.4.64"
   "1f3xnr40wwims4zhvh119dhwmffz4h4x82cffi118ri878mm5ig9"))

(define rust-wasm-bindgen-macro-0.2.114
  (crate-source
   "wasm-bindgen-macro"
   "0.2.114"
   "1rhq9kkl7n0zjrag9p25xsi4aabpgfkyf02zn4xv6pqhrw7xb8hq"))

(define rust-wasm-bindgen-macro-support-0.2.114
  (crate-source
   "wasm-bindgen-macro-support"
   "0.2.114"
   "1qriqqjpn922kv5c7f7627fj823k5aifv06j2gvwsiy5map4rkh3"))

(define rust-wasm-bindgen-shared-0.2.114
  (crate-source
   "wasm-bindgen-shared"
   "0.2.114"
   "05lc6w64jxlk4wk8rjci4z61lhx2ams90la27a41gvi3qaw2d8vm"))

(define rust-wasm-encoder-0.244.0
  (crate-source
   "wasm-encoder"
   "0.244.0"
   "06c35kv4h42vk3k51xjz1x6hn3mqwfswycmr6ziky033zvr6a04r"))

(define rust-wasm-metadata-0.244.0
  (crate-source
   "wasm-metadata"
   "0.244.0"
   "02f9dhlnryd2l7zf03whlxai5sv26x4spfibjdvc3g9gd8z3a3mv"))

(define rust-wasm-streams-0.4.2
  (crate-source
   "wasm-streams"
   "0.4.2"
   "0rddn007hp6k2cm91mm9y33n79b0jxv0c3znzszcvv67hn6ks18m"))

(define rust-wasmparser-0.244.0
  (crate-source
   "wasmparser"
   "0.244.0"
   "1zi821hrlsxfhn39nqpmgzc0wk7ax3dv6vrs5cw6kb0v5v3hgf27"))

(define rust-wax-0.7.0
  (crate-source
   "wax"
   "0.7.0"
   "0yrxgb03hbjy7n3cyxlzcpbbqby5ahgp5j0s68q9naql4n0vz30z"))

(define rust-wayland-backend-0.3.14
  (crate-source
   "wayland-backend"
   "0.3.14"
   "01m4qv2fwc8knxnlh3v9xzgcwm56kf9wsirzigbbq6gpnw0g8xda"))

(define rust-wayland-client-0.31.13
  (crate-source
   "wayland-client"
   "0.31.13"
   "1hqnyn637ldfgbwkbf2v0d452lwy951bgqh7c3kyxaviq3vxjldb"))

(define rust-wayland-protocols-0.32.11
  (crate-source
   "wayland-protocols"
   "0.32.11"
   "1ixfqjimafldmkagmj4hizshqdmssn8paq5c0s7k5wgg3krmsfxj"))

(define rust-wayland-protocols-wlr-0.3.11
  (crate-source
   "wayland-protocols-wlr"
   "0.3.11"
   "0db2ils5zvx2xhkbi1m5jws1zbnw6231ap5sf0ridy7gq168w93q"))

(define rust-wayland-scanner-0.31.9
  (crate-source
   "wayland-scanner"
   "0.31.9"
   "1qx4ky8sn95qkk45fnghdaas4j508mrrnw6a46w9k5rh38aqfqn8"))

(define rust-wayland-sys-0.31.10
  (crate-source
   "wayland-sys"
   "0.31.10"
   "05wdafyvckjadsnlv4k415izyn9vapyqhad3c6abzmp0x1q6nkrp"))

(define rust-web-sys-0.3.91
  (crate-source
   "web-sys"
   "0.3.91"
   "1y91r8f4dy4iqgrr03swdzqffz6wmllrgninp8kgpaq4n5xs2jw5"))

(define rust-web-time-1.1.0
  (crate-source
   "web-time"
   "1.1.0"
   "1fx05yqx83dhx628wb70fyy10yjfq1jpl20qfqhdkymi13rq0ras"))

(define rust-web-atoms-0.2.3
  (crate-source
   "web_atoms"
   "0.2.3"
   "0xhm7f286sgz5ci33fd7zcx7fsrgm83ygbhpwcfarlh4kyg7gaap"))

(define rust-webpage-2.0.1
  (crate-source
   "webpage"
   "2.0.1"
   "1b1fh3k6xcwkksyi9gbcx28d15h5mqs9rfw2maxycihx0ky2x1kh"))

(define rust-webpki-root-certs-1.0.6
  (crate-source
   "webpki-root-certs"
   "1.0.6"
   "1jm844z3caldlsb4ycb2h7q6vw4awfdgmddmx2sgyxi6mjj1hkw0"))

(define rust-webpki-roots-1.0.7
  (crate-source
   "webpki-roots"
   "1.0.7"
   "17gblaqmp51znxd2c18c04k8yfnf7s77c04n6hdmzxbcr52fxxaj"))

(define rust-weezl-0.1.12
  (crate-source
   "weezl"
   "0.1.12"
   "122a1dhha6cib5az4ihcqlh60ns2bi6rskdv875p94lbvj6wk2m2"))

(define rust-which-4.4.2
  (crate-source
   "which"
   "4.4.2"
   "1ixzmx3svsv5hbdvd8vdhd3qwvf6ns8jdpif1wmwsy10k90j9fl7"))

(define rust-which-8.0.2
  (crate-source
   "which"
   "8.0.2"
   "0nf4c067qvw5zzk0lr9iadzfnaprr9kkrj0cgmxf8smgmapmz6c1"))

(define rust-widestring-1.2.1
  (crate-source
   "widestring"
   "1.2.1"
   "0wg4qdbs70xqnlbm8wb0bs4idm2mxk3b6kaqwllsncmb2cqrq1kj"))

(define rust-wild-2.2.1
  (crate-source
   "wild"
   "2.2.1"
   "1q8hnhmv3fvgx0j7bv8qig00599a15mfsdhgx3hq2ljpiky1l4x3"))

(define rust-win-uds-0.2.4
  (crate-source
   "win_uds"
   "0.2.4"
   "0x502ghmdkza4crli159xsz9aadmnk25klm9j37c13xdgza244pz"))

(define rust-winapi-0.3.9
  (crate-source
   "winapi"
   "0.3.9"
   "06gl025x418lchw1wxj64ycr7gha83m44cjr5sarhynd9xkrm0sw"))

(define rust-winapi-i686-pc-windows-gnu-0.4.0
  (crate-source
   "winapi-i686-pc-windows-gnu"
   "0.4.0"
   "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc"))

(define rust-winapi-util-0.1.11
  (crate-source
   "winapi-util"
   "0.1.11"
   "08hdl7mkll7pz8whg869h58c1r9y7in0w0pk8fm24qc77k0b39y2"))

(define rust-winapi-x86-64-pc-windows-gnu-0.4.0
  (crate-source
   "winapi-x86_64-pc-windows-gnu"
   "0.4.0"
   "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))

(define rust-windows-0.56.0
  (crate-source
   "windows"
   "0.56.0"
   "0cp10nzrqgrlk91dpwxjcpzyy6imr5vxr5f898pss7nz3gq9vrhx"))

(define rust-windows-0.61.3
  (crate-source
   "windows"
   "0.61.3"
   "14v8dln7i4ccskd8danzri22bkjkbmgzh284j3vaxhd4cykx7awv"))

(define rust-windows-0.62.2
  (crate-source
   "windows"
   "0.62.2"
   "10457l9ihrbw8j79z2v4plyjxkf6xvb5npd0lqwmkh702gpaszsj"))

(define rust-windows-collections-0.2.0
  (crate-source
   "windows-collections"
   "0.2.0"
   "1s65anr609qvsjga7w971p6iq964h87670dkfqfypnfgwnswxviv"))

(define rust-windows-collections-0.3.2
  (crate-source
   "windows-collections"
   "0.3.2"
   "0436rjbkqn3j9m2v2lcmwwk0l3n2r57yvqb7fcy4m8d8y5ddkci3"))

(define rust-windows-core-0.56.0
  (crate-source
   "windows-core"
   "0.56.0"
   "19pj57bm0rzhlk0ghrccd3i5zvh0ghm52f8cmdc8d3yhs8pfb626"))

(define rust-windows-core-0.61.2
  (crate-source
   "windows-core"
   "0.61.2"
   "1qsa3iw14wk4ngfl7ipcvdf9xyq456ms7cx2i9iwf406p7fx7zf0"))

(define rust-windows-core-0.62.2
  (crate-source
   "windows-core"
   "0.62.2"
   "1swxpv1a8qvn3bkxv8cn663238h2jccq35ff3nsj61jdsca3ms5q"))

(define rust-windows-future-0.2.1
  (crate-source
   "windows-future"
   "0.2.1"
   "13mdzcdn51ckpzp3frb8glnmkyjr1c30ym9wnzj9zc97hkll2spw"))

(define rust-windows-future-0.3.2
  (crate-source
   "windows-future"
   "0.3.2"
   "1jq5qs2dwzf6rl60f8gr49z2mifxsrdh4y4yfdws467ya41gkmp1"))

(define rust-windows-implement-0.56.0
  (crate-source
   "windows-implement"
   "0.56.0"
   "16rgkvlx4syqmajfdwmkcvn6nvh126wjj8sg3jvsk5fdivskbz7n"))

(define rust-windows-implement-0.60.2
  (crate-source
   "windows-implement"
   "0.60.2"
   "1psxhmklzcf3wjs4b8qb42qb6znvc142cb5pa74rsyxm1822wgh5"))

(define rust-windows-interface-0.56.0
  (crate-source
   "windows-interface"
   "0.56.0"
   "1k2prfxna0mw47f8gi8qhw9jfpw66bh2cqzs67sgipjfpx30b688"))

(define rust-windows-interface-0.59.3
  (crate-source
   "windows-interface"
   "0.59.3"
   "0n73cwrn4247d0axrk7gjp08p34x1723483jxjxjdfkh4m56qc9z"))

(define rust-windows-link-0.1.3
  (crate-source
   "windows-link"
   "0.1.3"
   "12kr1p46dbhpijr4zbwr2spfgq8i8c5x55mvvfmyl96m01cx4sjy"))

(define rust-windows-link-0.2.1
  (crate-source
   "windows-link"
   "0.2.1"
   "1rag186yfr3xx7piv5rg8b6im2dwcf8zldiflvb22xbzwli5507h"))

(define rust-windows-numerics-0.2.0
  (crate-source
   "windows-numerics"
   "0.2.0"
   "1cf2j8nbqf0hqqa7chnyid91wxsl2m131kn0vl3mqk3c0rlayl4i"))

(define rust-windows-numerics-0.3.1
  (crate-source
   "windows-numerics"
   "0.3.1"
   "09hgbg8pf89r4090yyhh9q29ppi7yyxkgmga9ascshy19a240bkf"))

(define rust-windows-result-0.1.2
  (crate-source
   "windows-result"
   "0.1.2"
   "1y274q1v0vy21lhkgslpxpq1m08hvr1mcs2l88h1b1gcx0136f2y"))

(define rust-windows-result-0.3.4
  (crate-source
   "windows-result"
   "0.3.4"
   "1il60l6idrc6hqsij0cal0mgva6n3w6gq4ziban8wv6c6b9jpx2n"))

(define rust-windows-result-0.4.1
  (crate-source
   "windows-result"
   "0.4.1"
   "1d9yhmrmmfqh56zlj751s5wfm9a2aa7az9rd7nn5027nxa4zm0bp"))

(define rust-windows-strings-0.4.2
  (crate-source
   "windows-strings"
   "0.4.2"
   "0mrv3plibkla4v5kaakc2rfksdd0b14plcmidhbkcfqc78zwkrjn"))

(define rust-windows-strings-0.5.1
  (crate-source
   "windows-strings"
   "0.5.1"
   "14bhng9jqv4fyl7lqjz3az7vzh8pw0w4am49fsqgcz67d67x0dvq"))

(define rust-windows-sys-0.45.0
  (crate-source
   "windows-sys"
   "0.45.0"
   "1l36bcqm4g89pknfp8r9rl1w4bn017q6a8qlx8viv0xjxzjkna3m"))

(define rust-windows-sys-0.48.0
  (crate-source
   "windows-sys"
   "0.48.0"
   "1aan23v5gs7gya1lc46hqn9mdh8yph3fhxmhxlw36pn6pqc28zb7"))

(define rust-windows-sys-0.52.0
  (crate-source
   "windows-sys"
   "0.52.0"
   "0gd3v4ji88490zgb6b5mq5zgbvwv7zx1ibn8v3x83rwcdbryaar8"))

(define rust-windows-sys-0.59.0
  (crate-source
   "windows-sys"
   "0.59.0"
   "0fw5672ziw8b3zpmnbp9pdv1famk74f1l9fcbc3zsrzdg56vqf0y"))

(define rust-windows-sys-0.60.2
  (crate-source
   "windows-sys"
   "0.60.2"
   "1jrbc615ihqnhjhxplr2kw7rasrskv9wj3lr80hgfd42sbj01xgj"))

(define rust-windows-sys-0.61.2
  (crate-source
   "windows-sys"
   "0.61.2"
   "1z7k3y9b6b5h52kid57lvmvm05362zv1v8w0gc7xyv5xphlp44xf"))

(define rust-windows-targets-0.42.2
  (crate-source
   "windows-targets"
   "0.42.2"
   "0wfhnib2fisxlx8c507dbmh97kgij4r6kcxdi0f9nk6l1k080lcf"))

(define rust-windows-targets-0.48.5
  (crate-source
   "windows-targets"
   "0.48.5"
   "034ljxqshifs1lan89xwpcy1hp0lhdh4b5n0d2z4fwjx2piacbws"))

(define rust-windows-targets-0.52.6
  (crate-source
   "windows-targets"
   "0.52.6"
   "0wwrx625nwlfp7k93r2rra568gad1mwd888h1jwnl0vfg5r4ywlv"))

(define rust-windows-targets-0.53.5
  (crate-source
   "windows-targets"
   "0.53.5"
   "1wv9j2gv3l6wj3gkw5j1kr6ymb5q6dfc42yvydjhv3mqa7szjia9"))

(define rust-windows-threading-0.1.0
  (crate-source
   "windows-threading"
   "0.1.0"
   "19jpn37zpjj2q7pn07dpq0ay300w65qx7wdp13wbp8qf5snn6r5n"))

(define rust-windows-threading-0.2.1
  (crate-source
   "windows-threading"
   "0.2.1"
   "0dsvsy33vxs0153z4n39sqkzx382cjjkrd46rb3z3zfak5dvsj9r"))

(define rust-windows-aarch64-gnullvm-0.42.2
  (crate-source
   "windows_aarch64_gnullvm"
   "0.42.2"
   "1y4q0qmvl0lvp7syxvfykafvmwal5hrjb4fmv04bqs0bawc52yjr"))

(define rust-windows-aarch64-gnullvm-0.48.5
  (crate-source
   "windows_aarch64_gnullvm"
   "0.48.5"
   "1n05v7qblg1ci3i567inc7xrkmywczxrs1z3lj3rkkxw18py6f1b"))

(define rust-windows-aarch64-gnullvm-0.52.6
  (crate-source
   "windows_aarch64_gnullvm"
   "0.52.6"
   "1lrcq38cr2arvmz19v32qaggvj8bh1640mdm9c2fr877h0hn591j"))

(define rust-windows-aarch64-gnullvm-0.53.1
  (crate-source
   "windows_aarch64_gnullvm"
   "0.53.1"
   "0lqvdm510mka9w26vmga7hbkmrw9glzc90l4gya5qbxlm1pl3n59"))

(define rust-windows-aarch64-msvc-0.42.2
  (crate-source
   "windows_aarch64_msvc"
   "0.42.2"
   "0hsdikjl5sa1fva5qskpwlxzpc5q9l909fpl1w6yy1hglrj8i3p0"))

(define rust-windows-aarch64-msvc-0.48.5
  (crate-source
   "windows_aarch64_msvc"
   "0.48.5"
   "1g5l4ry968p73g6bg6jgyvy9lb8fyhcs54067yzxpcpkf44k2dfw"))

(define rust-windows-aarch64-msvc-0.52.6
  (crate-source
   "windows_aarch64_msvc"
   "0.52.6"
   "0sfl0nysnz32yyfh773hpi49b1q700ah6y7sacmjbqjjn5xjmv09"))

(define rust-windows-aarch64-msvc-0.53.1
  (crate-source
   "windows_aarch64_msvc"
   "0.53.1"
   "01jh2adlwx043rji888b22whx4bm8alrk3khjpik5xn20kl85mxr"))

(define rust-windows-i686-gnu-0.42.2
  (crate-source
   "windows_i686_gnu"
   "0.42.2"
   "0kx866dfrby88lqs9v1vgmrkk1z6af9lhaghh5maj7d4imyr47f6"))

(define rust-windows-i686-gnu-0.48.5
  (crate-source
   "windows_i686_gnu"
   "0.48.5"
   "0gklnglwd9ilqx7ac3cn8hbhkraqisd0n83jxzf9837nvvkiand7"))

(define rust-windows-i686-gnu-0.52.6
  (crate-source
   "windows_i686_gnu"
   "0.52.6"
   "02zspglbykh1jh9pi7gn8g1f97jh1rrccni9ivmrfbl0mgamm6wf"))

(define rust-windows-i686-gnu-0.53.1
  (crate-source
   "windows_i686_gnu"
   "0.53.1"
   "18wkcm82ldyg4figcsidzwbg1pqd49jpm98crfz0j7nqd6h6s3ln"))

(define rust-windows-i686-gnullvm-0.52.6
  (crate-source
   "windows_i686_gnullvm"
   "0.52.6"
   "0rpdx1537mw6slcpqa0rm3qixmsb79nbhqy5fsm3q2q9ik9m5vhf"))

(define rust-windows-i686-gnullvm-0.53.1
  (crate-source
   "windows_i686_gnullvm"
   "0.53.1"
   "030qaxqc4salz6l4immfb6sykc6gmhyir9wzn2w8mxj8038mjwzs"))

(define rust-windows-i686-msvc-0.42.2
  (crate-source
   "windows_i686_msvc"
   "0.42.2"
   "0q0h9m2aq1pygc199pa5jgc952qhcnf0zn688454i7v4xjv41n24"))

(define rust-windows-i686-msvc-0.48.5
  (crate-source
   "windows_i686_msvc"
   "0.48.5"
   "01m4rik437dl9rdf0ndnm2syh10hizvq0dajdkv2fjqcywrw4mcg"))

(define rust-windows-i686-msvc-0.52.6
  (crate-source
   "windows_i686_msvc"
   "0.52.6"
   "0rkcqmp4zzmfvrrrx01260q3xkpzi6fzi2x2pgdcdry50ny4h294"))

(define rust-windows-i686-msvc-0.53.1
  (crate-source
   "windows_i686_msvc"
   "0.53.1"
   "1hi6scw3mn2pbdl30ji5i4y8vvspb9b66l98kkz350pig58wfyhy"))

(define rust-windows-x86-64-gnu-0.42.2
  (crate-source
   "windows_x86_64_gnu"
   "0.42.2"
   "0dnbf2xnp3xrvy8v9mgs3var4zq9v9yh9kv79035rdgyp2w15scd"))

(define rust-windows-x86-64-gnu-0.48.5
  (crate-source
   "windows_x86_64_gnu"
   "0.48.5"
   "13kiqqcvz2vnyxzydjh73hwgigsdr2z1xpzx313kxll34nyhmm2k"))

(define rust-windows-x86-64-gnu-0.52.6
  (crate-source
   "windows_x86_64_gnu"
   "0.52.6"
   "0y0sifqcb56a56mvn7xjgs8g43p33mfqkd8wj1yhrgxzma05qyhl"))

(define rust-windows-x86-64-gnu-0.53.1
  (crate-source
   "windows_x86_64_gnu"
   "0.53.1"
   "16d4yiysmfdlsrghndr97y57gh3kljkwhfdbcs05m1jasz6l4f4w"))

(define rust-windows-x86-64-gnullvm-0.42.2
  (crate-source
   "windows_x86_64_gnullvm"
   "0.42.2"
   "18wl9r8qbsl475j39zvawlidp1bsbinliwfymr43fibdld31pm16"))

(define rust-windows-x86-64-gnullvm-0.48.5
  (crate-source
   "windows_x86_64_gnullvm"
   "0.48.5"
   "1k24810wfbgz8k48c2yknqjmiigmql6kk3knmddkv8k8g1v54yqb"))

(define rust-windows-x86-64-gnullvm-0.52.6
  (crate-source
   "windows_x86_64_gnullvm"
   "0.52.6"
   "03gda7zjx1qh8k9nnlgb7m3w3s1xkysg55hkd1wjch8pqhyv5m94"))

(define rust-windows-x86-64-gnullvm-0.53.1
  (crate-source
   "windows_x86_64_gnullvm"
   "0.53.1"
   "1qbspgv4g3q0vygkg8rnql5c6z3caqv38japiynyivh75ng1gyhg"))

(define rust-windows-x86-64-msvc-0.42.2
  (crate-source
   "windows_x86_64_msvc"
   "0.42.2"
   "1w5r0q0yzx827d10dpjza2ww0j8iajqhmb54s735hhaj66imvv4s"))

(define rust-windows-x86-64-msvc-0.48.5
  (crate-source
   "windows_x86_64_msvc"
   "0.48.5"
   "0f4mdp895kkjh9zv8dxvn4pc10xr7839lf5pa9l0193i2pkgr57d"))

(define rust-windows-x86-64-msvc-0.52.6
  (crate-source
   "windows_x86_64_msvc"
   "0.52.6"
   "1v7rb5cibyzx8vak29pdrk8nx9hycsjs4w0jgms08qk49jl6v7sq"))

(define rust-windows-x86-64-msvc-0.53.1
  (crate-source
   "windows_x86_64_msvc"
   "0.53.1"
   "0l6npq76vlq4ksn4bwsncpr8508mk0gmznm6wnhjg95d19gzzfyn"))

(define rust-winnow-0.7.15
  (crate-source
   "winnow"
   "0.7.15"
   "0i9rkl2rqpbnnxlgs20gmkj3nd0b2k8q55mjmpc2ybb84xwxjyfz"))

(define rust-winnow-1.0.0
  (crate-source
   "winnow"
   "1.0.0"
   "1n67gx8mg2b6r2z54zwbrb6qsfbdsar1lvafsfaajr3jcvj8h3m9"))

(define rust-winreg-0.56.0
  (crate-source
   "winreg"
   "0.56.0"
   "046a5jpvc0yzr9c0wgik743k6yalr2f0bchy4c0nz7sazyh34vvx"))

(define rust-winresource-0.1.31
  (crate-source
   "winresource"
   "0.1.31"
   "11v0hr6kfyi8kl8am96fkn325bjinjgs77ixzvjd7dw6snqsi1h9"))

(define rust-wit-bindgen-0.51.0
  (crate-source
   "wit-bindgen"
   "0.51.0"
   "19fazgch8sq5cvjv3ynhhfh5d5x08jq2pkw8jfb05vbcyqcr496p"))

(define rust-wit-bindgen-core-0.51.0
  (crate-source
   "wit-bindgen-core"
   "0.51.0"
   "1p2jszqsqbx8k7y8nwvxg65wqzxjm048ba5phaq8r9iy9ildwqga"))

(define rust-wit-bindgen-rust-0.51.0
  (crate-source
   "wit-bindgen-rust"
   "0.51.0"
   "08bzn5fsvkb9x9wyvyx98qglknj2075xk1n7c5jxv15jykh6didp"))

(define rust-wit-bindgen-rust-macro-0.51.0
  (crate-source
   "wit-bindgen-rust-macro"
   "0.51.0"
   "0ymizapzv2id89igxsz2n587y2hlfypf6n8kyp68x976fzyrn3qc"))

(define rust-wit-component-0.244.0
  (crate-source
   "wit-component"
   "0.244.0"
   "1clwxgsgdns3zj2fqnrjcp8y5gazwfa1k0sy5cbk0fsmx4hflrlx"))

(define rust-wit-parser-0.244.0
  (crate-source
   "wit-parser"
   "0.244.0"
   "0dm7avvdxryxd5b02l0g5h6933z1cw5z0d4wynvq2cywq55srj7c"))

(define rust-wl-clipboard-rs-0.9.3
  (crate-source
   "wl-clipboard-rs"
   "0.9.3"
   "18xh5q3r9k57v3g2565vr33irldjh99p29x1ydpdk1rfldqi8rg9"))

(define rust-writeable-0.6.2
  (crate-source
   "writeable"
   "0.6.2"
   "1fg08y97n6vk7l0rnjggw3xyrii6dcqg54wqaxldrlk98zdy1pcy"))

(define rust-x11rb-0.13.2
  (crate-source
   "x11rb"
   "0.13.2"
   "053lvnaw9ycbl791mgwly2hw27q6vqgzrb1y5kz1as52wmdsm4wr"))

(define rust-x11rb-protocol-0.13.2
  (crate-source
   "x11rb-protocol"
   "0.13.2"
   "1g81cznbyn522b0fbis0i44wh3adad2vhsz5pzf99waf3sbc4vza"))

(define rust-xattr-1.6.1
  (crate-source
   "xattr"
   "1.6.1"
   "0ml1mb43gqasawillql6b344m0zgq8mz0isi11wj8vbg43a5mr1j"))

(define rust-xml5ever-0.18.1
  (crate-source
   "xml5ever"
   "0.18.1"
   "0sdz92vrcxfwv7yzai28y0wa9gswr6msjnksak0rp4cfbm02dfwv"))

(define rust-xmlparser-0.13.6
  (crate-source
   "xmlparser"
   "0.13.6"
   "1r796g21c70p983ax0j6rmhzmalg4rhx61mvd4farxdhfyvy1zk6"))

(define rust-xxhash-rust-0.8.15
  (crate-source
   "xxhash-rust"
   "0.8.15"
   "1lrmffpn45d967afw7f1p300rsx7ill66irrskxpcm1p41a0rlpx"))

(define rust-yaml-rust-0.4.5
  (crate-source
   "yaml-rust"
   "0.4.5"
   "118wbqrr4n6wgk5rjjnlrdlahawlxc1bdsx146mwk8f79in97han"))

(define rust-yansi-1.0.1
  (crate-source
   "yansi"
   "1.0.1"
   "0jdh55jyv0dpd38ij4qh60zglbw9aa8wafqai6m0wa7xaxk3mrfg"))

(define rust-yoke-0.8.1
  (crate-source
   "yoke"
   "0.8.1"
   "0m29dm0bf5iakxgma0bj6dbmc3b8qi9b1vaw9sa76kdqmz3fbmkj"))

(define rust-yoke-derive-0.8.1
  (crate-source
   "yoke-derive"
   "0.8.1"
   "0pbyja133jnng4mrhimzdq4a0y26421g734ybgz8wsgbfhl0andn"))

(define rust-zerocopy-0.7.35
  (crate-source
   "zerocopy"
   "0.7.35"
   "1w36q7b9il2flg0qskapgi9ymgg7p985vniqd09vi0mwib8lz6qv"))

(define rust-zerocopy-0.8.42
  (crate-source
   "zerocopy"
   "0.8.42"
   "1qq50mj06rds2iac197kpkdlvgql1j3vvm82gy5qayladxqqnmzj"))

(define rust-zerocopy-derive-0.7.35
  (crate-source
   "zerocopy-derive"
   "0.7.35"
   "0gnf2ap2y92nwdalzz3x7142f2b83sni66l39vxp2ijd6j080kzs"))

(define rust-zerocopy-derive-0.8.42
  (crate-source
   "zerocopy-derive"
   "0.8.42"
   "0bx010zlchg4y8xixvkb4c74634j7ypnbpl7cqjdcfsdxacc0v3y"))

(define rust-zerofrom-0.1.6
  (crate-source
   "zerofrom"
   "0.1.6"
   "19dyky67zkjichsb7ykhv0aqws3q0jfvzww76l66c19y6gh45k2h"))

(define rust-zerofrom-derive-0.1.6
  (crate-source
   "zerofrom-derive"
   "0.1.6"
   "00l5niw7c1b0lf1vhvajpjmcnbdp2vn96jg4nmkhq2db0rp5s7np"))

(define rust-zeroize-1.8.2
  (crate-source
   "zeroize"
   "1.8.2"
   "1l48zxgcv34d7kjskr610zqsm6j2b4fcr2vfh9jm9j1jgvk58wdr"))

(define rust-zerotrie-0.2.3
  (crate-source
   "zerotrie"
   "0.2.3"
   "0lbqznlqazmrwwzslw0ci7p3pqxykrbfhq29npj0gmb2amxc2n9a"))

(define rust-zerovec-0.11.5
  (crate-source
   "zerovec"
   "0.11.5"
   "00m0p47k2g9mkv505hky5xh3r6ps7v8qc0dy4pspg542jj972a3c"))

(define rust-zerovec-derive-0.11.2
  (crate-source
   "zerovec-derive"
   "0.11.2"
   "1wsig4h5j7a1scd5hrlnragnazjny9qjc44hancb6p6a76ay7p7a"))

(define rust-zip-8.6.0
  (crate-source
   "zip"
   "8.6.0"
   "16w0aiqiymyy6kjri0aykkmh45pbk6a6ck69hxhal0hm72ssc11d"))

(define rust-zlib-rs-0.6.3
  (crate-source
   "zlib-rs"
   "0.6.3"
   "04qmv85amq6sv73bzqgvnlsk9mnrl97rygzf2v4zjcx1807d9qrv"))

(define rust-zmij-1.0.21
  (crate-source
   "zmij"
   "1.0.21"
   "1amb5i6gz7yjb0dnmz5y669674pqmwbj44p4yfxfv2ncgvk8x15q"))

(define rust-zopfli-0.8.3
  (crate-source
   "zopfli"
   "0.8.3"
   "0jaj5dyh3mks0805h4ldrsh5pwq4i2jc9dc9zwjm91k3gmwxhp7h"))

(define rust-zstd-0.13.3
  (crate-source
   "zstd"
   "0.13.3"
   "12n0h4w9l526li7jl972rxpyf012jw3nwmji2qbjghv9ll8y67p9"))

(define rust-zstd-safe-7.2.4
  (crate-source
   "zstd-safe"
   "7.2.4"
   "179vxmkzhpz6cq6mfzvgwc99bpgllkr6lwxq7ylh5dmby3aw8jcg"))

(define rust-zstd-sys-2.0.16+zstd.1.5.7
  (crate-source
   "zstd-sys"
   "2.0.16+zstd.1.5.7"
   "0j1pd2iaqpvaxlgqmmijj68wma7xwdv9grrr63j873yw5ay9xqci"))

(define rust-zune-core-0.5.1
  (crate-source
   "zune-core"
   "0.5.1"
   "1ya0zdqxlr5v57791j7bvm408ri2cfx81a4v6z85f560yw3hi2nb"))

(define rust-zune-jpeg-0.5.13
  (crate-source
   "zune-jpeg"
   "0.5.13"
   "0g729p4kxi0fpnk4qf0nsphxf9zphib926gx3r2xmdwpcg3l2pzc"))

(define nushell-cargo-inputs
  (list
   rust-addr2line-0.25.1
   rust-adler2-2.0.1
   rust-adler32-1.2.0
   rust-aegis-password-generator-0.1.1
   rust-ahash-0.8.12
   rust-aho-corasick-1.1.4
   rust-alloc-no-stdlib-2.0.4
   rust-alloc-stdlib-0.2.2
   rust-alloca-0.4.0
   rust-allocator-api2-0.2.21
   rust-alphanumeric-sort-1.5.5
   rust-android-system-properties-0.1.5
   rust-annotate-snippets-0.12.16
   rust-ansi-str-0.9.0
   rust-ansitok-0.3.0
   rust-anstream-0.6.21
   rust-anstyle-1.0.13
   rust-anstyle-parse-0.2.7
   rust-anstyle-query-1.1.5
   rust-anstyle-wincon-3.0.11
   rust-anyhow-1.0.102
   rust-approx-0.5.1
   rust-ar-archive-writer-0.5.1
   rust-arboard-3.6.1
   rust-arc-swap-1.9.2
   rust-argminmax-0.6.3
   rust-array-init-cursor-0.2.1
   rust-arraydeque-0.5.1
   rust-arrayref-0.3.9
   rust-arrayvec-0.7.6
   rust-assert-json-diff-2.0.2
   rust-assert-cmd-2.2.1
   rust-async-channel-2.5.0
   rust-async-stream-0.3.6
   rust-async-stream-impl-0.3.6
   rust-async-trait-0.1.89
   rust-atoi-simd-0.17.0
   rust-atoi-simd-0.18.1
   rust-atomic-0.6.1
   rust-atomic-waker-1.1.2
   rust-autocfg-1.5.0
   rust-avro-schema-0.3.0
   rust-aws-config-1.10.0
   rust-aws-credential-types-1.3.0
   rust-aws-lc-rs-1.16.2
   rust-aws-lc-sys-0.39.0
   rust-aws-runtime-1.9.0
   rust-aws-sdk-sso-1.104.0
   rust-aws-sdk-ssooidc-1.106.0
   rust-aws-sdk-sts-1.109.0
   rust-aws-sigv4-1.5.1
   rust-aws-smithy-async-1.3.0
   rust-aws-smithy-http-0.64.0
   rust-aws-smithy-http-client-1.2.0
   rust-aws-smithy-json-0.63.0
   rust-aws-smithy-observability-0.3.0
   rust-aws-smithy-query-0.62.0
   rust-aws-smithy-runtime-1.12.0
   rust-aws-smithy-runtime-api-1.13.0
   rust-aws-smithy-runtime-api-macros-1.1.0
   rust-aws-smithy-schema-0.2.0
   rust-aws-smithy-types-1.6.1
   rust-aws-smithy-xml-0.62.0
   rust-aws-types-1.5.0
   rust-backtrace-0.3.76
   rust-backtrace-ext-0.2.1
   rust-base64-0.22.1
   rust-base64-0.23.0
   rust-base64-simd-0.8.0
   rust-base64ct-1.8.3
   rust-better-default-1.0.5
   rust-bigdecimal-0.4.10
   rust-bincode-1.3.3
   rust-bincode-2.0.1
   rust-bincode-derive-2.0.1
   rust-bindgen-0.72.1
   rust-bit-set-0.8.0
   rust-bit-vec-0.8.0
   rust-bitflags-1.3.2
   rust-bitflags-2.11.0
   rust-blake3-1.8.3
   rust-block-buffer-0.10.4
   rust-block-buffer-0.12.1
   rust-block2-0.6.2
   rust-borsh-1.6.1
   rust-boxcar-0.2.14
   rust-bracoxide-0.1.8
   rust-brotli-8.0.2
   rust-brotli-decompressor-5.0.0
   rust-bstr-1.13.0
   rust-buf-trait-0.4.1
   rust-bumpalo-3.20.2
   rust-bytecount-0.6.9
   rust-bytemuck-1.25.0
   rust-bytemuck-derive-1.10.2
   rust-byteorder-1.5.0
   rust-byteorder-lite-0.1.0
   rust-bytes-1.12.0
   rust-bytes-utils-0.1.4
   rust-bytesize-2.7.0
   rust-byteyarn-0.5.1
   rust-calamine-0.36.0
   rust-castaway-0.2.4
   rust-cc-1.2.56
   rust-cesu8-1.1.0
   rust-cexpr-0.6.0
   rust-cfg-if-1.0.4
   rust-cfg-aliases-0.2.1
   rust-chacha20-0.10.0
   rust-chardetng-1.0.0
   rust-charset-0.1.5
   rust-chrono-0.4.44
   rust-chrono-humanize-0.2.3
   rust-chrono-tz-0.10.4
   rust-chumsky-0.12.0
   rust-clang-sys-1.8.1
   rust-clap-4.5.60
   rust-clap-builder-4.5.60
   rust-clap-derive-4.5.55
   rust-clap-lex-1.0.0
   rust-clipboard-win-5.4.1
   rust-cmake-0.1.57
   rust-cmov-0.5.4
   rust-codepage-0.1.2
   rust-colorchoice-1.0.4
   rust-colorz-1.1.4
   rust-combine-4.6.7
   rust-comfy-table-7.2.2
   rust-compact-str-0.9.0
   rust-concurrent-queue-2.5.0
   rust-console-0.16.2
   rust-const-oid-0.10.2
   rust-const-random-0.1.18
   rust-const-random-macro-0.1.16
   rust-const-format-0.2.35
   rust-const-format-proc-macros-0.2.34
   rust-constant-time-eq-0.4.2
   rust-convert-case-0.4.0
   rust-convert-case-0.10.0
   rust-cookie-0.18.1
   rust-cookie-store-0.22.1
   rust-core-foundation-0.10.1
   rust-core-foundation-sys-0.8.7
   rust-cpufeatures-0.2.17
   rust-cpufeatures-0.3.0
   rust-crc-2.1.0
   rust-crc-catalog-1.1.1
   rust-crc32fast-1.5.0
   rust-crossbeam-channel-0.5.16
   rust-crossbeam-deque-0.8.7
   rust-crossbeam-epoch-0.9.20
   rust-crossbeam-queue-0.3.13
   rust-crossbeam-utils-0.8.22
   rust-crossterm-0.29.0
   rust-crossterm-winapi-0.9.1
   rust-crunchy-0.2.4
   rust-crypto-common-0.1.7
   rust-crypto-common-0.2.2
   rust-cssparser-0.37.0
   rust-cssparser-macros-0.7.0
   rust-csv-1.4.0
   rust-csv-core-0.1.13
   rust-ctrlc-3.5.1
   rust-ctutils-0.4.2
   rust-curl-0.4.49
   rust-curl-sys-0.4.85+curl-8.18.0
   rust-darling-0.21.3
   rust-darling-0.23.0
   rust-darling-core-0.21.3
   rust-darling-core-0.23.0
   rust-darling-macro-0.21.3
   rust-darling-macro-0.23.0
   rust-data-encoding-2.11.0
   rust-debug-unsafe-0.1.4
   rust-der-0.8.0
   rust-deranged-0.5.8
   rust-derive-more-0.99.20
   rust-derive-more-2.1.1
   rust-derive-more-impl-2.1.1
   rust-derive-setters-0.1.9
   rust-devicons-0.6.13
   rust-diff-0.1.13
   rust-difflib-0.4.0
   rust-digest-0.10.7
   rust-digest-0.11.3
   rust-dirs-5.0.1
   rust-dirs-6.0.0
   rust-dirs-sys-0.4.1
   rust-dirs-sys-0.5.0
   rust-dispatch2-0.3.1
   rust-displaydoc-0.2.5
   rust-dlv-list-0.5.2
   rust-dns-lookup-3.0.1
   rust-doc-comment-0.3.4
   rust-doctest-file-1.0.0
   rust-document-features-0.2.12
   rust-downcast-rs-1.2.1
   rust-doxygen-rs-0.4.2
   rust-dtoa-1.0.11
   rust-dtoa-short-0.3.5
   rust-dtparse-2.0.1
   rust-dunce-1.0.5
   rust-dyn-clone-1.0.20
   rust-edit-0.1.5
   rust-edtui-0.11.2
   rust-edtui-jagged-0.1.13
   rust-ego-tree-0.11.0
   rust-either-1.15.0
   rust-eml-parser-0.1.5
   rust-encode-unicode-1.0.0
   rust-encoding-rs-0.8.35
   rust-encoding-rs-io-0.1.7
   rust-enum-dispatch-0.3.13
   rust-env-filter-1.0.0
   rust-env-logger-0.11.9
   rust-equivalent-1.0.2
   rust-erased-serde-0.4.10
   rust-errno-0.3.14
   rust-error-code-3.3.2
   rust-etcetera-0.10.0
   rust-ethnum-1.5.3
   rust-event-listener-5.4.1
   rust-event-listener-strategy-0.5.4
   rust-fallible-iterator-0.3.0
   rust-fallible-streaming-iterator-0.1.9
   rust-fancy-regex-0.19.0
   rust-fast-float2-0.2.3
   rust-fastrand-2.3.0
   rust-fax-0.2.6
   rust-fax-derive-0.2.0
   rust-fd-lock-4.0.4
   rust-fdeflate-0.3.7
   rust-fff-grep-0.10.3
   rust-fff-notify-debouncer-full-0.9.4
   rust-fff-query-parser-0.10.3
   rust-fff-search-0.10.3
   rust-file-id-0.2.3
   rust-filedescriptor-0.8.3
   rust-filesize-0.2.0
   rust-filetime-0.2.29
   rust-find-msvc-tools-0.1.9
   rust-fixedbitset-0.5.7
   rust-flate2-1.1.9
   rust-float-cmp-0.10.0
   rust-fluent-0.17.0
   rust-fluent-bundle-0.16.0
   rust-fluent-langneg-0.13.1
   rust-fluent-syntax-0.12.0
   rust-fluent-uri-0.1.4
   rust-fnv-1.0.7
   rust-foldhash-0.1.5
   rust-foldhash-0.2.0
   rust-foreign-types-0.3.2
   rust-foreign-types-shared-0.1.1
   rust-form-urlencoded-1.2.2
   rust-fs4-0.13.1
   rust-fs-extra-1.3.0
   rust-fsevent-sys-4.1.0
   rust-futf-0.1.5
   rust-futures-0.3.32
   rust-futures-channel-0.3.32
   rust-futures-core-0.3.32
   rust-futures-executor-0.3.32
   rust-futures-io-0.3.32
   rust-futures-macro-0.3.32
   rust-futures-sink-0.3.32
   rust-futures-task-0.3.32
   rust-futures-util-0.3.32
   rust-gatekeeper-3.0.0
   rust-generic-array-0.14.7
   rust-gethostname-1.1.0
   rust-getrandom-0.2.17
   rust-getrandom-0.3.4
   rust-getrandom-0.4.2
   rust-gimli-0.32.3
   rust-git2-0.21.0
   rust-gjson-0.8.1
   rust-glidesort-0.1.2
   rust-glob-0.3.3
   rust-glob-match-0.2.1
   rust-globset-0.4.19
   rust-goblin-0.7.1
   rust-granit-parser-1.0.0
   rust-h2-0.4.18
   rust-half-2.7.1
   rust-halfbrown-0.4.0
   rust-hash32-0.3.1
   rust-hashbrown-0.12.3
   rust-hashbrown-0.14.5
   rust-hashbrown-0.15.5
   rust-hashbrown-0.16.1
   rust-hashbrown-0.17.0
   rust-hashlink-0.12.0
   rust-heapless-0.9.2
   rust-heck-0.5.0
   rust-heed-0.22.1
   rust-heed-traits-0.20.0
   rust-heed-types-0.21.0
   rust-hermit-abi-0.5.2
   rust-hex-0.4.3
   rust-hmac-0.13.0
   rust-home-0.5.12
   rust-html5ever-0.27.0
   rust-html5ever-0.39.0
   rust-http-0.2.12
   rust-http-1.5.0
   rust-http-body-0.4.6
   rust-http-body-1.0.1
   rust-http-body-util-0.1.3
   rust-httparse-1.10.1
   rust-httpdate-1.0.3
   rust-human-date-parser-0.3.1
   rust-humantime-2.4.0
   rust-hybrid-array-0.4.13
   rust-hyper-1.8.1
   rust-hyper-rustls-0.27.7
   rust-hyper-tls-0.6.0
   rust-hyper-util-0.1.20
   rust-iana-time-zone-0.1.65
   rust-iana-time-zone-haiku-0.1.2
   rust-ical-0.11.0
   rust-icu-collections-2.1.1
   rust-icu-locale-core-2.1.1
   rust-icu-normalizer-2.1.1
   rust-icu-normalizer-data-2.1.1
   rust-icu-properties-2.1.2
   rust-icu-properties-data-2.1.2
   rust-icu-provider-2.1.1
   rust-id-arena-2.3.0
   rust-ident-case-1.0.1
   rust-idna-1.1.0
   rust-idna-adapter-1.2.1
   rust-ignore-0.4.29
   rust-image-0.25.10
   rust-indexmap-1.9.3
   rust-indexmap-2.14.0
   rust-indicatif-0.18.4
   rust-indoc-2.0.7
   rust-inotify-0.11.1
   rust-inotify-sys-0.1.5
   rust-instability-0.3.11
   rust-interprocess-2.4.2
   rust-intl-memoizer-0.5.3
   rust-intl-pluralrules-7.0.2
   rust-inventory-0.3.22
   rust-ipnet-2.12.0
   rust-iri-string-0.7.10
   rust-is-docker-0.2.0
   rust-is-wsl-0.4.0
   rust-is-ci-1.2.0
   rust-is-debug-1.1.0
   rust-is-executable-1.0.5
   rust-is-terminal-polyfill-1.70.2
   rust-itertools-0.13.0
   rust-itertools-0.14.0
   rust-itertools-0.15.0
   rust-itoa-1.0.17
   rust-jiff-0.2.23
   rust-jiff-static-0.2.23
   rust-jiff-tzdb-0.1.6
   rust-jiff-tzdb-platform-0.1.3
   rust-jni-0.21.1
   rust-jni-sys-0.3.0
   rust-jobserver-0.1.34
   rust-js-sys-0.3.91
   rust-jsonpath-lib-polars-vendor-0.0.1
   rust-kasuari-0.4.11
   rust-kdl-4.7.1
   rust-kdl-6.7.1
   rust-kitest-0.6.0
   rust-kqueue-1.1.1
   rust-kqueue-sys-1.0.4
   rust-lazy-static-1.5.0
   rust-lean-string-0.7.0
   rust-leb128fmt-0.1.0
   rust-lexopt-0.3.2
   rust-libc-0.2.186
   rust-libflate-1.4.0
   rust-libflate-lz77-1.2.0
   rust-libgit2-sys-0.18.7+1.9.6
   rust-libloading-0.8.9
   rust-libm-0.2.16
   rust-libproc-0.14.11
   rust-libredox-0.1.14
   rust-libsqlite3-sys-0.38.1
   rust-libz-sys-1.1.25
   rust-line-clipping-0.3.5
   rust-linked-hash-map-0.5.6
   rust-linkme-0.3.36
   rust-linkme-impl-0.3.36
   rust-linux-raw-sys-0.4.15
   rust-linux-raw-sys-0.12.1
   rust-litemap-0.8.1
   rust-litrs-1.0.0
   rust-lmdb-master-sys-0.2.6
   rust-lock-api-0.4.14
   rust-log-0.4.29
   rust-lru-0.16.3
   rust-lru-0.18.0
   rust-lru-slab-0.1.2
   rust-lscolors-0.21.0
   rust-lsp-server-0.10.0
   rust-lsp-textdocument-0.5.0
   rust-lsp-types-0.97.0
   rust-lz4-1.28.1
   rust-lz4-sys-1.11.1+lz4-1.10.0
   rust-mac-0.1.1
   rust-mach2-0.6.0
   rust-markdown-1.0.0
   rust-markup5ever-0.12.1
   rust-markup5ever-0.39.0
   rust-markup5ever-rcdom-0.3.0
   rust-matchers-0.2.0
   rust-matrixmultiply-0.3.10
   rust-md-5-0.10.6
   rust-md-5-0.11.0
   rust-mediatype-0.21.0
   rust-memchr-2.8.3
   rust-memmap2-0.9.10
   rust-memoffset-0.7.1
   rust-miette-5.10.0
   rust-miette-7.6.0
   rust-miette-derive-5.10.0
   rust-miette-derive-7.6.0
   rust-mime-0.3.17
   rust-mime-guess-2.0.5
   rust-minimal-lexical-0.2.1
   rust-miniz-oxide-0.8.9
   rust-mio-1.2.0
   rust-mockito-1.7.2
   rust-moxcms-0.8.1
   rust-mq-markdown-0.8.1
   rust-multipart-rs-0.2.2
   rust-native-tls-0.2.18
   rust-ndarray-0.17.2
   rust-neo-frizbee-0.11.0
   rust-new-debug-unreachable-1.0.6
   rust-nix-0.26.4
   rust-nix-0.30.1
   rust-nix-0.31.3
   rust-nohash-hasher-0.2.0
   rust-nom-7.1.3
   rust-nom-8.0.0
   rust-notify-8.2.0
   rust-notify-9.0.0-rc.4
   rust-notify-debouncer-full-0.7.0
   rust-notify-types-2.1.0
   rust-now-0.1.3
   rust-ntapi-0.4.3
   rust-nu-ansi-term-0.50.3
   rust-nucleo-matcher-0.3.1
   rust-num-0.4.3
   rust-num-bigint-0.4.8
   rust-num-complex-0.4.6
   rust-num-conv-0.2.0
   rust-num-derive-0.4.2
   rust-num-format-0.4.4
   rust-num-integer-0.1.46
   rust-num-iter-0.1.45
   rust-num-rational-0.4.2
   rust-num-traits-0.2.19
   rust-num-cpus-1.17.0
   rust-num-threads-0.1.7
   rust-objc2-0.6.4
   rust-objc2-app-kit-0.3.2
   rust-objc2-core-foundation-0.3.2
   rust-objc2-core-graphics-0.3.2
   rust-objc2-core-services-0.3.2
   rust-objc2-encode-4.1.0
   rust-objc2-foundation-0.3.2
   rust-objc2-io-kit-0.3.2
   rust-objc2-io-surface-0.3.2
   rust-objc2-open-directory-0.3.2
   rust-object-0.37.3
   rust-object-store-0.13.2
   rust-oem-cp-2.1.2
   rust-omnipath-0.1.6
   rust-once-cell-1.21.3
   rust-once-cell-polyfill-1.70.2
   rust-open-5.4.0
   rust-openssl-0.10.80
   rust-openssl-macros-0.1.1
   rust-openssl-probe-0.1.6
   rust-openssl-probe-0.2.1
   rust-openssl-src-300.5.5+3.5.5
   rust-openssl-sys-0.9.116
   rust-option-ext-0.2.0
   rust-ordered-multimap-0.7.3
   rust-os-display-0.1.4
   rust-os-pipe-1.2.3
   rust-outref-0.5.2
   rust-owo-colors-4.3.0
   rust-page-size-0.6.0
   rust-papergrid-0.18.0
   rust-parking-2.2.1
   rust-parking-lot-0.12.5
   rust-parking-lot-core-0.9.12
   rust-parse-datetime-0.15.0
   rust-pastey-0.2.3
   rust-pathdiff-0.2.3
   rust-pem-rfc7468-1.0.0
   rust-percent-encoding-2.3.2
   rust-peresil-0.3.0
   rust-pest-2.8.6
   rust-pest-consume-1.1.3
   rust-pest-consume-macros-1.1.0
   rust-pest-derive-2.8.6
   rust-pest-generator-2.8.6
   rust-pest-meta-2.8.6
   rust-petgraph-0.8.3
   rust-phf-0.11.3
   rust-phf-0.12.1
   rust-phf-0.13.1
   rust-phf-codegen-0.11.3
   rust-phf-codegen-0.13.1
   rust-phf-generator-0.11.3
   rust-phf-generator-0.13.1
   rust-phf-macros-0.11.3
   rust-phf-macros-0.13.1
   rust-phf-shared-0.11.3
   rust-phf-shared-0.12.1
   rust-phf-shared-0.13.1
   rust-pin-project-lite-0.2.17
   rust-pin-utils-0.1.0
   rust-pkg-config-0.3.32
   rust-plain-0.2.3
   rust-planus-1.1.1
   rust-platform-info-2.0.5
   rust-plist-1.10.0
   rust-png-0.18.1
   rust-polars-0.54.4
   rust-polars-arrow-0.54.4
   rust-polars-arrow-format-0.2.1
   rust-polars-async-0.54.4
   rust-polars-buffer-0.54.4
   rust-polars-compute-0.54.4
   rust-polars-config-0.54.4
   rust-polars-core-0.54.4
   rust-polars-dtype-0.54.4
   rust-polars-error-0.54.4
   rust-polars-expr-0.54.4
   rust-polars-io-0.54.4
   rust-polars-json-0.54.4
   rust-polars-lazy-0.54.4
   rust-polars-mem-engine-0.54.4
   rust-polars-ooc-0.54.4
   rust-polars-ops-0.54.4
   rust-polars-parquet-0.54.4
   rust-polars-parquet-format-0.1.0
   rust-polars-plan-0.54.4
   rust-polars-row-0.54.4
   rust-polars-schema-0.54.4
   rust-polars-sql-0.54.4
   rust-polars-stream-0.54.4
   rust-polars-time-0.54.4
   rust-polars-utils-0.54.4
   rust-pori-0.0.0
   rust-portable-atomic-1.13.1
   rust-portable-atomic-util-0.2.5
   rust-potential-utf-0.1.4
   rust-powerfmt-0.2.0
   rust-ppv-lite86-0.2.21
   rust-precomputed-hash-0.1.1
   rust-predicates-3.1.4
   rust-predicates-core-1.0.10
   rust-predicates-tree-1.0.13
   rust-pretty-assertions-1.4.1
   rust-prettyplease-0.2.37
   rust-print-positions-0.6.1
   rust-proc-macro-error-attr2-2.0.0
   rust-proc-macro-error2-2.0.1
   rust-proc-macro2-1.0.106
   rust-procfs-0.18.0
   rust-procfs-core-0.18.0
   rust-psm-0.1.30
   rust-pure-rust-locales-0.8.2
   rust-pwd-1.4.0
   rust-pxfm-0.1.28
   rust-quick-error-1.2.3
   rust-quick-error-2.0.1
   rust-quick-xml-0.39.4
   rust-quick-xml-0.41.0
   rust-quickcheck-1.1.0
   rust-quickcheck-macros-1.2.0
   rust-quinn-0.11.9
   rust-quinn-proto-0.11.15
   rust-quinn-udp-0.5.14
   rust-quote-1.0.45
   rust-quoted-printable-0.5.1
   rust-r-efi-5.3.0
   rust-r-efi-6.0.0
   rust-rand-0.8.5
   rust-rand-0.9.2
   rust-rand-0.10.1
   rust-rand-chacha-0.3.1
   rust-rand-chacha-0.9.0
   rust-rand-chacha-0.10.0
   rust-rand-core-0.6.4
   rust-rand-core-0.9.5
   rust-rand-core-0.10.0
   rust-rand-distr-0.5.1
   rust-ratatui-0.30.0
   rust-ratatui-core-0.1.0
   rust-ratatui-crossterm-0.1.0
   rust-ratatui-macros-0.7.0
   rust-ratatui-widgets-0.3.0
   rust-raw-cpuid-11.6.0
   rust-rawpointer-0.2.1
   rust-rayon-1.12.0
   rust-rayon-core-1.13.0
   rust-recursive-0.1.1
   rust-recursive-proc-macro-impl-0.1.1
   rust-recvmsg-1.0.0
   rust-redox-syscall-0.5.18
   rust-redox-users-0.4.6
   rust-redox-users-0.5.2
   rust-reedline-0.51.0
   rust-ref-cast-1.0.25
   rust-ref-cast-impl-1.0.25
   rust-regex-1.13.1
   rust-regex-automata-0.3.9
   rust-regex-automata-0.4.16
   rust-regex-lite-0.1.9
   rust-regex-syntax-0.7.5
   rust-regex-syntax-0.8.11
   rust-relative-path-1.9.3
   rust-reqwest-0.12.28
   rust-rfc2047-decoder-1.1.0
   rust-ring-0.17.14
   rust-rle-decode-fast-1.0.3
   rust-rmcp-3.1.0
   rust-rmcp-macros-3.1.0
   rust-rmp-0.8.15
   rust-rmp-serde-1.3.1
   rust-roxmltree-0.21.1
   rust-rsqlite-vfs-0.1.1
   rust-rstest-0.26.1
   rust-rstest-macros-0.26.1
   rust-rstest-reuse-0.7.0
   rust-rusqlite-0.40.1
   rust-rust-ini-0.21.3
   rust-rust-decimal-1.40.0
   rust-rustc-demangle-0.1.27
   rust-rustc-hash-2.1.2
   rust-rustc-version-0.4.1
   rust-rustix-0.38.44
   rust-rustix-1.1.4
   rust-rustls-0.23.38
   rust-rustls-native-certs-0.8.3
   rust-rustls-pki-types-1.14.0
   rust-rustls-platform-verifier-0.6.2
   rust-rustls-platform-verifier-android-0.1.1
   rust-rustls-webpki-0.103.13
   rust-rustversion-1.0.22
   rust-ryu-1.0.23
   rust-same-file-1.0.6
   rust-schannel-0.1.29
   rust-schemars-1.2.1
   rust-schemars-derive-1.2.1
   rust-scopeguard-1.2.0
   rust-scraper-0.27.0
   rust-scroll-0.11.0
   rust-scroll-derive-0.11.1
   rust-security-framework-3.7.0
   rust-security-framework-sys-2.17.0
   rust-selectors-0.38.0
   rust-self-cell-1.2.2
   rust-semver-1.0.27
   rust-serde-1.0.229
   rust-serde-saphyr-1.0.0
   rust-serde-core-1.0.229
   rust-serde-derive-1.0.229
   rust-serde-derive-internals-0.29.1
   rust-serde-json-1.0.151
   rust-serde-regex-1.2.0
   rust-serde-repr-0.1.20
   rust-serde-spanned-1.1.1
   rust-serde-stacker-0.1.14
   rust-serde-urlencoded-0.7.1
   rust-serde-yaml-0.8.26
   rust-servo-arc-0.4.3
   rust-sha1-0.10.6
   rust-sha1-smol-1.0.1
   rust-sha2-0.10.9
   rust-sha2-0.11.0
   rust-shadow-rs-2.0.0
   rust-sharded-slab-0.1.7
   rust-shlex-1.3.0
   rust-signal-hook-0.3.18
   rust-signal-hook-0.4.3
   rust-signal-hook-mio-0.2.5
   rust-signal-hook-registry-1.4.8
   rust-simd-adler32-0.3.8
   rust-simd-json-0.17.0
   rust-simdutf8-0.1.5
   rust-similar-2.7.0
   rust-similar-3.1.0
   rust-simplelog-0.12.2
   rust-siphasher-1.0.2
   rust-slab-0.4.12
   rust-slotmap-1.1.1
   rust-smallvec-1.15.1
   rust-smol-str-0.3.6
   rust-snap-1.1.1
   rust-socket2-0.5.10
   rust-socket2-0.6.3
   rust-socks-0.3.4
   rust-sqlite-wasm-rs-0.5.5
   rust-sqlparser-0.60.0
   rust-sqlparser-0.61.0
   rust-sqlparser-derive-0.4.0
   rust-sse-stream-0.2.5
   rust-stable-deref-trait-1.2.1
   rust-stacker-0.1.23
   rust-static-assertions-1.1.0
   rust-streaming-decompression-0.1.2
   rust-streaming-iterator-0.1.9
   rust-strength-reduce-0.2.4
   rust-string-cache-0.8.9
   rust-string-cache-0.9.0
   rust-string-cache-codegen-0.5.4
   rust-string-cache-codegen-0.6.1
   rust-strip-ansi-escapes-0.2.1
   rust-strsim-0.11.1
   rust-strum-0.27.2
   rust-strum-0.28.0
   rust-strum-macros-0.27.2
   rust-strum-macros-0.28.0
   rust-subtle-2.6.1
   rust-supports-color-3.0.2
   rust-supports-hyperlinks-3.2.0
   rust-supports-unicode-3.0.0
   rust-sxd-document-0.3.2
   rust-sxd-xpath-0.4.2
   rust-symlink-0.1.0
   rust-syn-1.0.109
   rust-syn-2.0.117
   rust-syn-3.0.2
   rust-sync-wrapper-1.0.2
   rust-synchronoise-1.0.1
   rust-synstructure-0.13.2
   rust-sys-locale-0.3.2
   rust-sysinfo-0.37.2
   rust-sysinfo-0.39.3
   rust-tabled-0.21.0
   rust-tango-bench-0.7.2
   rust-tempfile-3.27.0
   rust-tendril-0.4.3
   rust-tendril-0.5.0
   rust-termcolor-1.4.1
   rust-terminal-size-0.4.3
   rust-termtree-0.5.1
   rust-testing-table-0.3.0
   rust-textwrap-0.16.2
   rust-thiserror-1.0.69
   rust-thiserror-2.0.19
   rust-thiserror-impl-1.0.69
   rust-thiserror-impl-2.0.19
   rust-thread-tree-0.3.3
   rust-thread-local-1.1.9
   rust-tiff-0.11.3
   rust-time-0.3.47
   rust-time-core-0.1.8
   rust-time-macros-0.2.27
   rust-tiny-keccak-2.0.2
   rust-tinystr-0.8.2
   rust-tinyvec-1.10.0
   rust-tinyvec-macros-0.1.1
   rust-titlecase-3.6.0
   rust-tokio-1.53.1
   rust-tokio-macros-2.7.0
   rust-tokio-native-tls-0.3.1
   rust-tokio-rustls-0.26.4
   rust-tokio-stream-0.1.18
   rust-tokio-util-0.7.18
   rust-toml-1.1.2+spec-1.1.0
   rust-toml-datetime-1.1.1+spec-1.1.0
   rust-toml-edit-0.25.11+spec-1.1.0
   rust-toml-parser-1.1.2+spec-1.1.0
   rust-toml-writer-1.1.1+spec-1.1.0
   rust-tower-0.5.3
   rust-tower-http-0.6.8
   rust-tower-layer-0.3.3
   rust-tower-service-0.3.3
   rust-tracing-0.1.44
   rust-tracing-appender-0.2.5
   rust-tracing-attributes-0.1.31
   rust-tracing-core-0.1.36
   rust-tracing-log-0.2.0
   rust-tracing-subscriber-0.3.22
   rust-trash-5.2.6
   rust-tree-magic-mini-3.2.2
   rust-try-lock-0.2.5
   rust-tui-tree-widget-0.24.0
   rust-type-map-0.5.1
   rust-typed-arena-1.7.0
   rust-typed-path-0.12.3
   rust-typeid-1.0.3
   rust-typenum-1.20.1
   rust-typetag-0.2.21
   rust-typetag-impl-0.2.21
   rust-ucd-trie-0.1.7
   rust-umask-2.1.0
   rust-unic-langid-0.9.6
   rust-unic-langid-impl-0.9.6
   rust-unicase-2.9.0
   rust-unicode-id-0.3.6
   rust-unicode-ident-1.0.24
   rust-unicode-linebreak-0.1.5
   rust-unicode-normalization-0.1.25
   rust-unicode-reverse-1.0.9
   rust-unicode-segmentation-1.13.3
   rust-unicode-truncate-2.0.1
   rust-unicode-width-0.1.14
   rust-unicode-width-0.2.2
   rust-unicode-xid-0.2.6
   rust-unit-prefix-0.5.2
   rust-untrusted-0.9.0
   rust-unty-0.0.4
   rust-update-informer-1.3.0
   rust-ureq-3.3.0
   rust-ureq-proto-0.6.0
   rust-url-2.5.8
   rust-urlencoding-2.1.3
   rust-utf-8-0.7.6
   rust-utf8-zero-0.8.1
   rust-utf8-iter-1.0.4
   rust-utf8parse-0.2.2
   rust-uu-cp-0.10.0
   rust-uu-mkdir-0.10.0
   rust-uu-mktemp-0.10.0
   rust-uu-mv-0.10.0
   rust-uu-touch-0.10.0
   rust-uu-uname-0.10.0
   rust-uu-whoami-0.10.0
   rust-uucore-0.10.0
   rust-uucore-procs-0.10.0
   rust-uuid-1.24.0
   rust-v-escape-base-0.1.0
   rust-v-htmlescape-0.17.0
   rust-valuable-0.1.1
   rust-value-trait-0.12.1
   rust-vcpkg-0.2.15
   rust-version-check-0.9.5
   rust-virtue-0.0.18
   rust-vsimd-0.8.0
   rust-vte-0.14.1
   rust-wait-timeout-0.2.1
   rust-walkdir-2.5.0
   rust-want-0.3.1
   rust-wasi-0.11.1+wasi-snapshot-preview1
   rust-wasip2-1.0.2+wasi-0.2.9
   rust-wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06
   rust-wasm-bindgen-0.2.114
   rust-wasm-bindgen-futures-0.4.64
   rust-wasm-bindgen-macro-0.2.114
   rust-wasm-bindgen-macro-support-0.2.114
   rust-wasm-bindgen-shared-0.2.114
   rust-wasm-encoder-0.244.0
   rust-wasm-metadata-0.244.0
   rust-wasm-streams-0.4.2
   rust-wasmparser-0.244.0
   rust-wax-0.7.0
   rust-wayland-backend-0.3.14
   rust-wayland-client-0.31.13
   rust-wayland-protocols-0.32.11
   rust-wayland-protocols-wlr-0.3.11
   rust-wayland-scanner-0.31.9
   rust-wayland-sys-0.31.10
   rust-web-sys-0.3.91
   rust-web-time-1.1.0
   rust-web-atoms-0.2.3
   rust-webpage-2.0.1
   rust-webpki-root-certs-1.0.6
   rust-webpki-roots-1.0.7
   rust-weezl-0.1.12
   rust-which-4.4.2
   rust-which-8.0.2
   rust-widestring-1.2.1
   rust-wild-2.2.1
   rust-win-uds-0.2.4
   rust-winapi-0.3.9
   rust-winapi-i686-pc-windows-gnu-0.4.0
   rust-winapi-util-0.1.11
   rust-winapi-x86-64-pc-windows-gnu-0.4.0
   rust-windows-0.56.0
   rust-windows-0.61.3
   rust-windows-0.62.2
   rust-windows-collections-0.2.0
   rust-windows-collections-0.3.2
   rust-windows-core-0.56.0
   rust-windows-core-0.61.2
   rust-windows-core-0.62.2
   rust-windows-future-0.2.1
   rust-windows-future-0.3.2
   rust-windows-implement-0.56.0
   rust-windows-implement-0.60.2
   rust-windows-interface-0.56.0
   rust-windows-interface-0.59.3
   rust-windows-link-0.1.3
   rust-windows-link-0.2.1
   rust-windows-numerics-0.2.0
   rust-windows-numerics-0.3.1
   rust-windows-result-0.1.2
   rust-windows-result-0.3.4
   rust-windows-result-0.4.1
   rust-windows-strings-0.4.2
   rust-windows-strings-0.5.1
   rust-windows-sys-0.45.0
   rust-windows-sys-0.48.0
   rust-windows-sys-0.52.0
   rust-windows-sys-0.59.0
   rust-windows-sys-0.60.2
   rust-windows-sys-0.61.2
   rust-windows-targets-0.42.2
   rust-windows-targets-0.48.5
   rust-windows-targets-0.52.6
   rust-windows-targets-0.53.5
   rust-windows-threading-0.1.0
   rust-windows-threading-0.2.1
   rust-windows-aarch64-gnullvm-0.42.2
   rust-windows-aarch64-gnullvm-0.48.5
   rust-windows-aarch64-gnullvm-0.52.6
   rust-windows-aarch64-gnullvm-0.53.1
   rust-windows-aarch64-msvc-0.42.2
   rust-windows-aarch64-msvc-0.48.5
   rust-windows-aarch64-msvc-0.52.6
   rust-windows-aarch64-msvc-0.53.1
   rust-windows-i686-gnu-0.42.2
   rust-windows-i686-gnu-0.48.5
   rust-windows-i686-gnu-0.52.6
   rust-windows-i686-gnu-0.53.1
   rust-windows-i686-gnullvm-0.52.6
   rust-windows-i686-gnullvm-0.53.1
   rust-windows-i686-msvc-0.42.2
   rust-windows-i686-msvc-0.48.5
   rust-windows-i686-msvc-0.52.6
   rust-windows-i686-msvc-0.53.1
   rust-windows-x86-64-gnu-0.42.2
   rust-windows-x86-64-gnu-0.48.5
   rust-windows-x86-64-gnu-0.52.6
   rust-windows-x86-64-gnu-0.53.1
   rust-windows-x86-64-gnullvm-0.42.2
   rust-windows-x86-64-gnullvm-0.48.5
   rust-windows-x86-64-gnullvm-0.52.6
   rust-windows-x86-64-gnullvm-0.53.1
   rust-windows-x86-64-msvc-0.42.2
   rust-windows-x86-64-msvc-0.48.5
   rust-windows-x86-64-msvc-0.52.6
   rust-windows-x86-64-msvc-0.53.1
   rust-winnow-0.7.15
   rust-winnow-1.0.0
   rust-winreg-0.56.0
   rust-winresource-0.1.31
   rust-wit-bindgen-0.51.0
   rust-wit-bindgen-core-0.51.0
   rust-wit-bindgen-rust-0.51.0
   rust-wit-bindgen-rust-macro-0.51.0
   rust-wit-component-0.244.0
   rust-wit-parser-0.244.0
   rust-wl-clipboard-rs-0.9.3
   rust-writeable-0.6.2
   rust-x11rb-0.13.2
   rust-x11rb-protocol-0.13.2
   rust-xattr-1.6.1
   rust-xml5ever-0.18.1
   rust-xmlparser-0.13.6
   rust-xxhash-rust-0.8.15
   rust-yaml-rust-0.4.5
   rust-yansi-1.0.1
   rust-yoke-0.8.1
   rust-yoke-derive-0.8.1
   rust-zerocopy-0.7.35
   rust-zerocopy-0.8.42
   rust-zerocopy-derive-0.7.35
   rust-zerocopy-derive-0.8.42
   rust-zerofrom-0.1.6
   rust-zerofrom-derive-0.1.6
   rust-zeroize-1.8.2
   rust-zerotrie-0.2.3
   rust-zerovec-0.11.5
   rust-zerovec-derive-0.11.2
   rust-zip-8.6.0
   rust-zlib-rs-0.6.3
   rust-zmij-1.0.21
   rust-zopfli-0.8.3
   rust-zstd-0.13.3
   rust-zstd-safe-7.2.4
   rust-zstd-sys-2.0.16+zstd.1.5.7
   rust-zune-core-0.5.1
   rust-zune-jpeg-0.5.13
))
