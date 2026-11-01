;;; Declarative DeepSeek Harness profile artifacts for Virelith.
;;;
;;; A profile is the dependency-resolution boundary.  Bundle descriptors pin
;;; individual npm tarballs and validate their manifests; this module composes
;;; an ordered bundle list, generates the DSH profile manifest, resolves the
;;; external dependency closure once into a fixed-output tree, and emits an
;;; immutable profile artifact.  In-box bundle names are allowed and are
;;; resolved by DSH itself; only external bundles need profile node_modules.
;;;
;;; There is no committed pnpm lockfile.  The caller pins the complete external
;;; closure with SPECS-HASH; pnpm resolves it at build time and the fixed-output
;;; hash makes the result reproducible.  The generated lockfile stays in the
;;; store artifact for inspection.  If no external descriptors are present, the
;;; entire pnpm path is skipped.

(define-module (virelith packages dsh-profiles)
  #:use-module (gnu packages base) ;coreutils
  #:use-module (gnu packages node) ;node-lts
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (ice-9 format)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-13) ;string-join
  #:use-module (virelith packages dsh-bundles)
  #:use-module (virelith packages pnpm-deps)
  #:export (dsh-profile
            dsh-profile-default-root))

(define (sanitize-name name)
  "Return a path/package-safe spelling of NAME."
  (list->string
   (map (lambda (char)
          (if (or (char-alphabetic? char)
                  (char-numeric? char))
              char
              #\-))
        (string->list name))))

(define (json-escape string)
  "Escape STRING for a JSON string literal."
  (list->string
   (append-map (lambda (char)
                 (cond
                  ((char=? char #\") (list #\\ #\"))
                  ((char=? char #\\) (list #\\ #\\))
                  (else (list char))))
               (string->list string))))

(define (bundle-entry-name entry)
  "Return the DSH bundle name for a string or descriptor ENTRY."
  (cond
   ((string? entry) entry)
   ((dsh-bundle-package? entry) (dsh-bundle-package-name entry))
   (else
    (error "not a DSH bundle entry (string or descriptor)" entry))))

(define (profile-dependencies entries)
  "Return external descriptor dependencies in declaration order."
  (filter dsh-bundle-package? entries))

(define (profile-package-json name entries)
  "Return the generated DSH profile package.json text."
  (let* ((dependencies (profile-dependencies entries))
         (dependency-text
          (string-join
           (map (lambda (bundle)
                  (format #f "\"~a\": \"~a\""
                          (json-escape (dsh-bundle-package-name bundle))
                          (json-escape (dsh-bundle-package-version bundle))))
                dependencies)
           ",\n    "))
         (bundle-text
          (string-join
           (map (lambda (entry)
                  (format #f "\"~a\"" (json-escape (bundle-entry-name entry))))
                entries)
           ",\n        ")))
    (format #f
            "{
  \"name\": \"dsh-profile-~a\",
  \"private\": true,
  \"dependencies\": {
    ~a
  },
  \"dsh\": {
    \"profile\": {
      \"bundles\": [
        ~a
      ]
    }
  }
}
"
            (json-escape name)
            dependency-text
            bundle-text)))

(define (profile-expected-text entries)
  "Return one `NAME<TAB>VERSION` line per external descriptor."
  (string-join
   (map (lambda (bundle)
          (format #f "~a\t~a"
                  (dsh-bundle-package-name bundle)
                  (dsh-bundle-package-version bundle)))
        (profile-dependencies entries))
   "\n"))

(define (validate-profile-entries entries)
  "Validate ENTRY names and types, preserving declaration order."
  (for-each
   (lambda (entry)
     (unless (or (string? entry) (dsh-bundle-package? entry))
       (error "not a DSH bundle entry (string or descriptor)" entry)))
   entries)
  (let ((names (map bundle-entry-name entries)))
    (unless (= (length names)
               (length (delete-duplicates names)))
      (error "duplicate DSH bundle name in profile" names)))
  entries)

(define (profile-source name entries)
  "Return a directory file-like containing the generated profile manifest and
workspace config."
  (let* ((package-json (plain-file (string-append "dsh-profile-" name
                                                  "-package.json")
                                   (profile-package-json name entries)))
         (workspace (plain-file (string-append "dsh-profile-" name
                                               "-pnpm-workspace.yaml")
                                "packages:
  - .
nodeLinker: hoisted
autoInstallPeers: false
")))
    (computed-file (string-append "dsh-profile-" name "-source")
      (with-imported-modules '((guix build utils))
        #~(begin
            (use-modules (guix build utils))
            (mkdir-p #$output)
            (copy-file #$package-json
                       (string-append #$output "/package.json"))
            (copy-file #$workspace
                       (string-append #$output "/pnpm-workspace.yaml")))))))

(define %validate-profile-script
  (plain-file
   "validate-dsh-profile.js"
   "const fs = require('fs');
const path = require('path');
const [root, expectedFile] = process.argv.slice(2);
const lines = fs.readFileSync(expectedFile, 'utf8').split('\\n').filter(Boolean);
for (const line of lines) {
  const tab = line.indexOf('\\t');
  const name = line.slice(0, tab);
  const version = line.slice(tab + 1);
  const dir = path.join(root, name);
  const manifestPath = path.join(dir, 'package.json');
  if (!fs.existsSync(manifestPath))
    throw new Error(`bundle not installed: ${name}`);
  const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
  if (manifest.name !== name)
    throw new Error(`bundle name mismatch: ${manifest.name} != ${name}`);
  if (manifest.version !== version)
    throw new Error(`bundle version mismatch for ${name}: ${manifest.version} != ${version}`);
  const patch = manifest.dsh && manifest.dsh.bundle && manifest.dsh.bundle.patch;
  if (typeof patch !== 'string' || patch.length === 0)
    throw new Error(`missing dsh.bundle.patch for ${name}`);
  if (path.isAbsolute(patch) || patch.split(/[\\\\/]+/).includes('..'))
    throw new Error(`unsafe dsh.bundle.patch for ${name}: ${patch}`);
  if (!fs.existsSync(path.join(dir, patch)))
    throw new Error(`dsh.bundle.patch does not exist for ${name}: ${patch}`);
}
"))

(define* (dsh-profile-default-root name)
  "Return the fixed pnpm install root for profile NAME."
  (string-append "/tmp/guix-dsh-profile-" (sanitize-name name)))

(define* (dsh-profile name
                      #:key
                      (bundles '())
                      patch
                      root
                      specs-hash)
  "Return a profile artifact for NAME.

BUNDLES is the ordered list of in-box bundle name strings and external
dsh-npm-bundle descriptors.  PATCH is the profile cordis.patch.yml.  ROOT is
the fixed pnpm install root (defaults to a name-derived path).  SPECS-HASH is
the recursive sha256 of the fixed-output external closure and is required only
when BUNDLES contains external descriptors."
  (validate-profile-entries bundles)
  (when (and (pair? (profile-dependencies bundles)) (not specs-hash))
    (error "dsh-profile: external bundles require #:specs-hash" name))
  (let* ((profile-name name)
         (external? (pair? (profile-dependencies bundles)))
         (profile-root (or root (dsh-profile-default-root name)))
         (source-dir (profile-source profile-name bundles))
         (closure (and external?
                       (pnpm-closure #:source source-dir
                                     #:workspace "pnpm-workspace.yaml"
                                     #:root profile-root
                                     #:hash specs-hash)))
         (expected (plain-file (string-append "dsh-profile-" profile-name
                                              "-expected.txt")
                               (profile-expected-text bundles)))
         (profile-dir (string-append "share/dsh/profiles/" profile-name)))
    (package
      (name (string-append "dsh-profile-" (sanitize-name profile-name)))
      (version "0.0.0")
      (source #f)
      (build-system trivial-build-system)
      (arguments
       (list
        #:modules '((guix build utils))
        #:builder
        #~(begin
            (use-modules (guix build utils))
            (let* ((out #$output)
                   (dir (string-append out "/" #$profile-dir))
                   (source-dir #$source-dir))
              (mkdir-p dir)
              (copy-file (string-append source-dir "/package.json")
                         (string-append dir "/package.json"))
              (copy-file (string-append source-dir "/pnpm-workspace.yaml")
                         (string-append dir "/pnpm-workspace.yaml"))
              (copy-file #$patch (string-append dir "/cordis.patch.yml"))
              (when #$(if external? #t #f)
                (let ((node-modules (string-append dir "/node_modules"))
                      (installed #$closure))
                  (copy-recursively (string-append installed "/node_modules")
                                    node-modules
                                    #:follow-symlinks? #f)
                  (invoke #$(file-append coreutils "/bin/chmod")
                          "-R" "u+w" node-modules)
                  ;; pnpm shims embed the fixed install root; retarget them
                  ;; to the immutable profile artifact.
                  (for-each
                   (lambda (file)
                     (substitute* file
                       ((#$profile-root) node-modules)))
                   (find-files node-modules
                               (lambda (file stat)
                                 (and (eq? 'regular (stat:type stat))
                                      (string-contains file "/.bin/")))))
                  (invoke #$(file-append node-lts "/bin/node")
                          #$%validate-profile-script
                          node-modules #$expected)))))))
      (native-inputs (list node-lts coreutils))
      (supported-systems '("x86_64-linux" "aarch64-linux"))
      (home-page "https://github.com/deepseek-ai/deepseek-harness")
      (synopsis (string-append "DSH profile " profile-name))
      (description
       (string-append "Immutable DeepSeek Harness profile artifact for "
                      profile-name "."))
      (license license:expat))))
