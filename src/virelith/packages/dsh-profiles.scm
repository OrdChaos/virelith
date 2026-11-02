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

(define (patch-file-name index patch)
  "Return the relative patch path for PATCH at INDEX."
  (string-append "patches/"
                 (number->string index)
                 "-"
                 (sanitize-name (car patch))
                 ".patch"))

(define (package-patch-name index patch)
  "Return (SPEC . RELATIVE-PATCH-PATH) for PATCH at INDEX."
  (cons (car patch) (patch-file-name index patch)))

(define (bundle-dependency bundle bundle-sources)
  "Return (NAME . VERSION-OR-LOCAL-SOURCE) for BUNDLE."
  (let ((name (dsh-bundle-package-name bundle)))
    (cons name
          (if (assoc-ref bundle-sources name)
              (string-append "file:vendor/" (sanitize-name name))
              (dsh-bundle-package-version bundle)))))

(define (profile-package-json name entries extra-dependencies bundle-sources)
  "Return the generated DSH profile package.json text."
  (let* ((dependencies
          (append
           (map (lambda (bundle)
                  (bundle-dependency bundle bundle-sources))
                (profile-dependencies entries))
           extra-dependencies))
         (dependency-text
          (string-join
           (map (lambda (dependency)
                  (format #f "\"~a\": \"~a\""
                          (json-escape (car dependency))
                          (json-escape (cdr dependency))))
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

(define (profile-workspace-yaml package-patches auto-install-peers?)
  "Return pnpm-workspace.yaml with optional patchedDependencies."
  (let ((patches
         (if (null? package-patches)
             ""
             (string-append
              "patchedDependencies:\n"
              (string-join
               (map (lambda (index patch)
                      (let ((named (package-patch-name index patch)))
                        (format #f "  '~a': '~a'"
                                (car named)
                                (cdr named))))
                    (iota (length package-patches))
                    package-patches)
               "\n")
              "\n"))))
    (string-append
     "packages:
  - .
nodeLinker: hoisted
autoInstallPeers: "
     (if auto-install-peers? "true" "false")
     "\n"
     patches)))
(define (patch-copy index patch)
  "Return a gexp copying PATCH to its profile-relative path."
  (let ((destination (patch-file-name index patch)))
    #~(begin
        (mkdir-p (string-append #$output "/patches"))
        (copy-file #$(cdr patch)
                   (string-append #$output "/" #$destination)))))

(define (bundle-source-copy bundle bundle-sources)
  "Return a gexp copying BUNDLE's patched package tree to vendor/."
  (let* ((name (dsh-bundle-package-name bundle))
         (source (assoc-ref bundle-sources name)))
    (and source
         #~(begin
             (mkdir-p (string-append #$output "/vendor"))
             (copy-recursively #$source
                               (string-append #$output "/vendor/"
                                              #$(sanitize-name name))
                               #:follow-symlinks? #f)))))

(define (profile-source name entries package-patches auto-install-peers? extra-dependencies bundle-sources)
  "Return a directory file-like containing the generated profile manifest,
workspace config, and package patches."
  (let* ((package-json (plain-file (string-append "dsh-profile-" name
                                                  "-package.json")
                                   (profile-package-json name entries extra-dependencies bundle-sources)))
         (workspace (plain-file (string-append "dsh-profile-" name
                                               "-pnpm-workspace.yaml")
                                (profile-workspace-yaml package-patches auto-install-peers?))))
    (computed-file (string-append "dsh-profile-" name "-source")
      (with-imported-modules '((guix build utils))
        #~(begin
            (use-modules (guix build utils))
            (mkdir-p #$output)
            (copy-file #$package-json
                       (string-append #$output "/package.json"))
            (copy-file #$workspace
                       (string-append #$output "/pnpm-workspace.yaml"))
            #$@(filter-map (lambda (bundle)
                             (bundle-source-copy bundle bundle-sources))
                           (profile-dependencies entries))
            #$@(map patch-copy
                    (iota (length package-patches))
                    package-patches))))))
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
                      specs-hash
                      (package-patches '())
                      (extra-dependencies '())
                      (bundle-sources '())
                      (runtime-scope #f)
                      (auto-install-peers? #f))
  "Return a profile artifact for NAME.

BUNDLES is the ordered list of in-box bundle name strings and external
dsh-npm-bundle descriptors.  PATCH is the profile cordis.patch.yml.  ROOT is
the fixed pnpm install root (defaults to a name-derived path).  SPECS-HASH is
the recursive sha256 of the fixed-output external closure and is required only
when BUNDLES contains external descriptors.  PACKAGE-PATCHES is an alist of
package spec to patch file-like applied by pnpm during closure installation.
RUNTIME-SCOPE, when supplied, is linked as node_modules/@deepseek-ai so
peer imports share the launching DSH runtime instead of a second copy."
  (validate-profile-entries bundles)
  (when (and (pair? (profile-dependencies bundles)) (not specs-hash))
    (error "dsh-profile: external bundles require #:specs-hash" name))
  (when (and (pair? package-patches)
             (null? (profile-dependencies bundles)))
    (error "dsh-profile: package patches require external bundles" name))
  (let* ((profile-name name)
         (external? (pair? (profile-dependencies bundles)))
         (profile-root (or root (dsh-profile-default-root name)))
         (source-dir (profile-source profile-name bundles package-patches auto-install-peers? extra-dependencies bundle-sources))
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
                  (when #$(if runtime-scope #t #f)
                    (let ((scope (string-append node-modules "/@deepseek-ai")))
                      (when (file-exists? scope)
                        (error "dsh-profile: @deepseek-ai already exists in node_modules" scope))
                      (symlink #$runtime-scope scope)))
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
