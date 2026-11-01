;;; Declarative DeepSeek Harness npm bundle descriptors for Virelith.
;;;
;;; A bundle descriptor is not a complete profile dependency closure.  It
;;; pins the npm tarball, validates the package manifest and DSH bundle patch,
;;; and exposes the bundle identity as package properties.  Profile resolution
;;; (pnpm closure + specs hash) is a separate layer so peer dependencies and
;;; pnpm's virtual-store layout stay profile-wide.
;;;
;;; Versions and hashes are pinned manually; evaluation never queries the npm
;;; registry.  Plugins that need install scripts or native payloads must be
;;; handled by an explicit package derivation, not hidden here.

(define-module (virelith packages dsh-bundles)
  #:use-module (gnu packages base) ;tar
  #:use-module (gnu packages compression) ;gzip
  #:use-module (gnu packages node) ;node
  #:use-module (guix build-system copy)
  #:use-module (guix download) ;url-fetch
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix licenses)
  #:use-module (srfi srfi-1) ;delete-duplicates、last-pair
  #:export (dsh-npm-bundle
            dsh-bundle-package?
            dsh-bundle-package-name
            dsh-bundle-package-version
            validate-dsh-bundle-set))

(define (npm-package-leaf name)
  "Return the tarball leaf name for NPM package NAME (scope stripped)."
  (car (last-pair (string-split name #\/))))

(define (npm-tarball-uri name version)
  "Return the immutable npm registry tarball URL for NAME@VERSION."
  (string-append "https://registry.npmjs.org/" name "/-/"
                 (npm-package-leaf name) "-" version ".tgz"))

(define (npm-package->guix-name name)
  "Return a Guix-safe package name for NPM package NAME."
  (string-append "dsh-bundle-"
                 (list->string
                  (map (lambda (char)
                         (if (or (char-alphabetic? char)
                                 (char-numeric? char))
                             char
                             #\-))
                       (string->list name)))))

(define %validate-bundle-script
  (plain-file
   "validate-dsh-bundle.js"
   "const fs = require('fs');
const path = require('path');
const [root, expectedName, expectedVersion] = process.argv.slice(2);
const manifestPath = path.join(root, 'package.json');
const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
if (manifest.name !== expectedName)
  throw new Error(`bundle name mismatch: ${manifest.name} != ${expectedName}`);
if (manifest.version !== expectedVersion)
  throw new Error(`bundle version mismatch: ${manifest.version} != ${expectedVersion}`);
const patch = manifest.dsh && manifest.dsh.bundle && manifest.dsh.bundle.patch;
if (typeof patch !== 'string' || patch.length === 0)
  throw new Error('missing dsh.bundle.patch');
if (path.isAbsolute(patch) || patch.split(/[\\\\/]+/).includes('..'))
  throw new Error(`unsafe dsh.bundle.patch path: ${patch}`);
const patchPath = path.join(root, patch);
if (!fs.existsSync(patchPath) || !fs.statSync(patchPath).isFile())
  throw new Error(`dsh.bundle.patch does not exist: ${patch}`);
"))

(define* (dsh-npm-bundle name version hash
                         #:key
                         (license
                          (nonfree
                           (string-append "https://www.npmjs.com/package/"
                                          name))))
  "Return a descriptor package for the DSH npm bundle NAME@VERSION.

HASH is the SHA-256 of the npm tarball.  The package installs the bundle
manifest and payload under share/dsh/bundles/NAME/ and validates the name,
version, and dsh.bundle.patch at build time.  It deliberately does not install
the bundle's dependency closure."
  (let* ((bundle-name name)
         (bundle-version version)
         (bundle-hash hash)
         (bundle-license license)
         (guix-name (npm-package->guix-name bundle-name))
         (tarball-name (string-append (npm-package-leaf bundle-name)
                                      "-" bundle-version ".tgz"))
         (install-root (string-append "share/dsh/bundles/"
                                      bundle-name "/")))
    (package
      (name guix-name)
      (version bundle-version)
      (source
       (origin
         (method url-fetch)
         (uri (npm-tarball-uri bundle-name bundle-version))
         (file-name tarball-name)
         (sha256 bundle-hash)))
      (build-system copy-build-system)
      (arguments
       (list
        #:substitutable? #f
        #:install-plan
        #~'(("./" #$(string-append install-root)))
        #:phases
        #~(modify-phases %standard-phases
            (replace 'unpack
              (lambda* (#:key source #:allow-other-keys)
                (invoke "tar" "xzf" source)
                (chdir "package")))
            (add-after 'install 'validate-bundle
              (lambda* (#:key outputs #:allow-other-keys)
                (let ((root (string-append (assoc-ref outputs "out")
                                           "/" #$install-root)))
                  (invoke #$(file-append node "/bin/node")
                          #$%validate-bundle-script
                          root #$bundle-name #$bundle-version)))))))
      (native-inputs (list tar gzip node))
      (properties `((dsh-bundle? . #t)
                    (dsh-bundle-name . ,bundle-name)
                    (dsh-bundle-version . ,bundle-version)))
      (supported-systems '("x86_64-linux" "aarch64-linux"))
      (home-page (string-append "https://www.npmjs.com/package/"
                                bundle-name))
      (synopsis (string-append "DSH bundle " bundle-name))
      (description
       (string-append
        "DeepSeek Harness bundle descriptor for the pinned npm package "
        bundle-name "@" bundle-version ".  It validates the package manifest "
        "and its declared DSH bundle patch; dependency resolution is "
        "performed by the consuming DSH profile."))
      (license bundle-license))))

(define (dsh-bundle-package? object)
  "Return #t when OBJECT is a dsh-npm-bundle descriptor."
  (and (package? object)
       (assoc-ref (package-properties object) 'dsh-bundle?)
       #t))

(define (property name package)
  (and (package? package)
       (assoc-ref (package-properties package) name)))

(define (dsh-bundle-package-name package)
  (property 'dsh-bundle-name package))

(define (dsh-bundle-package-version package)
  (property 'dsh-bundle-version package))

(define (validate-dsh-bundle-set bundles)
  "Validate BUNDLES and return them in declaration order.

Every element must be a dsh-npm-bundle descriptor and bundle names must be
unique.  Order is significant: later DSH bundle patch layers override earlier
ones."
  (for-each
   (lambda (bundle)
     (unless (dsh-bundle-package? bundle)
       (error "not a DSH bundle descriptor" bundle)))
   bundles)
  (let ((names (map dsh-bundle-package-name bundles)))
    (unless (= (length names)
               (length (delete-duplicates names)))
      (error "duplicate DSH bundle name" names)))
  bundles)
