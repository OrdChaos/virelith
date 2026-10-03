;;; Declarative VS Code extension packaging for Virelith.
;;;
;;; Model: extensions are immutable Guix packages unpacked from pinned
;;; Marketplace VSIX files into share/vscode/extensions/<publisher>.<name>/.
;;; An extension set is composed into one immutable directory (plus an
;;; extensions.json manifest) and handed to VS Code through its official
;;; --extensions-dir interface by the vscode-with-extensions wrapper.
;;;
;;; There is no activation-time reconcile, no `code --install-extension`,
;;; and no mutable ~/.vscode/extensions involvement: the visible extension
;;; set is structurally equal to the Guix generation's declared set.
;;;
;;; Versions and hashes are pinned manually; this module never queries the
;;; Marketplace at evaluation time.  Native extensions (bundled ELF/.node)
;;; are expected to inherit from the generic package and apply Guix-native
;;; fixes (patchelf, input injection, bundled-binary substitution); the
;;; generic helper deliberately carries no per-extension special cases.

(define-module (virelith packages vscode-extensions)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (nonguix licenses)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:export (system->vscode-target-platform
            vscode-marketplace-vsix
            vscode-marketplace-extension
            vscode-extension-package?
            vscode-extension-package-id
            vscode-extensions-directory
            vscode-with-extensions))

(define (system->vscode-target-platform system)
  "Map a Guix SYSTEM triple to the VS Code Marketplace targetPlatform name.
Return #f when the platform has no Marketplace-specific variant."
  (assoc-ref '(("x86_64-linux" . "linux-x64")
               ("i686-linux" . "linux-x64")
               ("aarch64-linux" . "linux-arm64")
               ("armhf-linux" . "linux-armhf"))
             system))

(define* (vscode-marketplace-vsix publisher name version hash
                                  #:key (target-platform #f))
  "Return a fixed-output <origin> for the Marketplace VSIX of
PUBLISHER.NAME at VERSION.  HASH is the content hash of the VSIX (a base32
string or bytevector, as accepted by the origin sha256 field).
TARGET-PLATFORM, when non-#f, selects the platform-specific variant
recorded by the Marketplace (e.g. \"linux-x64\"); use
system->vscode-target-platform to derive it.

The URL layout (publisher subdomain, assetbyname path, targetPlatform
query) matches what the VS Code gallery serves and what nixpkgs currently
uses; PUBLISHER and NAME keep their Marketplace casing.  The downloaded
file is named with a .zip suffix so that unpack tooling recognizes the
VSIX (a ZIP archive) without extension-based special cases."
  (origin
    (method url-fetch)
    (uri (string-append
          "https://" publisher ".gallery.vsassets.io"
          "/_apis/public/gallery/publisher/" publisher
          "/extension/" name "/" version
          "/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
          (if target-platform
              (string-append "?targetPlatform=" target-platform)
              "")))
    (file-name (string-append publisher "-" name "-" version
                              (if target-platform
                                  (string-append "-" target-platform)
                                  "")
                              ".zip"))
    (sha256 hash)))

(define* (vscode-marketplace-extension publisher name version hash
                                       #:key
                                       (target-platform #f)
                                       (synopsis #f)
                                       (description #f)
                                       (license
                                        (nonfree
                                         "https://marketplace.visualstudio.com/items")))
  "Return a <package> unpacking the Marketplace VSIX of PUBLISHER.NAME at
VERSION into the standard extension filesystem ABI:

    share/vscode/extensions/PUBLISHER.NAME/…

Only the extension/ subtree of the VSIX is installed; the vsixmanifest and
content-type metadata are dropped.  The package records its identity in
the vscode-extension-* properties for validation, duplicate detection and
extensions.json generation; VERSION is the package version.

Extensions carrying native payloads are expected to inherit from this
package and add Guix-native fix phases rather than special-casing here.

VSIX contents are typically non-redistributable; substitutes are disabled
unconditionally, independent of LICENSE."
  ;; Bind under names that do not collide with <package> fields: inside the
  ;; record's thunked field initializers, identifiers like NAME, VERSION or
  ;; SYNOPSIS self-reference the record's own fields.
  (let* ((id (string-append publisher "." name))
         (pub publisher)
         (ext-name name)
         (ext-version version)
         (ext-hash hash)
         (ext-platform target-platform)
         (ext-synopsis (or synopsis
                           (string-append "VS Code extension " id)))
         (ext-description
          (or description
              (string-append
               "VS Code extension " id ", unpacked from the pinned "
               "Marketplace VSIX into an immutable store directory.")))
         (ext-license license)
         (ext-home-page
          (string-append "https://marketplace.visualstudio.com/items?itemName="
                         id)))
    (package
      (name (string-append "vscode-extension-" pub "-" ext-name))
      (version ext-version)
      (source (vscode-marketplace-vsix pub ext-name ext-version ext-hash
                                       #:target-platform ext-platform))
      (build-system copy-build-system)
      (arguments
       (list
        #:substitutable? #f
        #:phases
        #~(modify-phases %standard-phases
            (replace 'unpack
              (lambda* (#:key source #:allow-other-keys)
                ;; A VSIX is a ZIP whose payload lives in the extension/
                ;; top-level directory; do not rely on the generic unpack
                ;; phase's first-subdirectory heuristic.
                (invoke "unzip" "-q" source)
                (chdir "extension"))))
        #:install-plan
        #~'(("./" #$(string-append "share/vscode/extensions/" id "/")))))
      (native-inputs (list unzip))
      (properties `((vscode-extension? . #t)
                    (vscode-extension-id . ,id)
                    (vscode-extension-publisher . ,pub)
                    (vscode-extension-name . ,ext-name)
                    ,@(if ext-platform
                          `((vscode-extension-platform . ,ext-platform))
                          '())))
      (home-page ext-home-page)
      (synopsis ext-synopsis)
      (description ext-description)
      (license ext-license))))

(define (vscode-extension-package? obj)
  "Return #t when OBJ is a package produced by vscode-marketplace-extension
(or an inheritance of one)."
  (and (package? obj)
       (assoc-ref (package-properties obj) 'vscode-extension?)
       #t))

(define (vscode-extension-package-id package)
  "Return the publisher.name identifier of a VS Code extension PACKAGE."
  (assoc-ref (package-properties package) 'vscode-extension-id))

(define (vscode-extension-package-platform package)
  (assoc-ref (package-properties package) 'vscode-extension-platform))

(define (validate-extension-set extensions)
  "Raise an error unless EXTENSIONS is a list of extension packages with
unique (case-insensitive) identifiers.  Return EXTENSIONS sorted by
downcased identifier for deterministic composition."
  (for-each
   (lambda (obj)
     (unless (vscode-extension-package? obj)
       (error "not a VS Code extension package (missing vscode-extension-id property)"
              obj)))
   extensions)
  (let ((sorted (sort extensions
                      (lambda (a b)
                        (string-ci< (vscode-extension-package-id a)
                                    (vscode-extension-package-id b))))))
    (let loop ((rest sorted))
      (match rest
        ((a b . _)
         (when (string-ci=? (vscode-extension-package-id a)
                            (vscode-extension-package-id b))
           (error "duplicate VS Code extension identifier in extension set"
                  (vscode-extension-package-id b)))
         (loop (cdr rest)))
        (_ sorted)))))

(define (json-escape str)
  "Return STR escaped for inclusion in a JSON string literal (without the
surrounding quotes).  Extension identifiers, versions and store paths only
ever contain a benign alphabet, but quote and backslash are handled for
robustness."
  (let loop ((chars (string->list str)) (acc '()))
    (match chars
      (() (list->string (reverse acc)))
      ((#\" . rest) (loop rest (append '(#\" #\\) acc)))
      ((#\\ . rest) (loop rest (append '(#\\ #\\) acc)))
      ((c . rest) (loop rest (cons c acc))))))

(define (extension-json-entry-gexp extension)
  "Return a gexp evaluating to the extensions.json entry for EXTENSION.
The location points at the individual extension's own store directory, not
at the collection being built, so the manifest never references its own
containing store path.  The shape follows what nixpkgs'
vscode-utils.toExtensionJsonEntry currently emits and what VS Code writes
itself."
  (let ((id (vscode-extension-package-id extension))
        (version (package-version extension))
        (publisher (assoc-ref (package-properties extension)
                              'vscode-extension-publisher))
        (platform (or (vscode-extension-package-platform extension)
                      "undefined")))
    #~(string-append
       "{\"identifier\":{\"id\":\"" #$(json-escape id) "\",\"uuid\":\"\"},"
       "\"version\":\"" #$(json-escape version) "\","
       "\"location\":{\"$mid\":1,"
       "\"fsPath\":\"" #$extension "/share/vscode/extensions/" #$(json-escape id) "\","
       "\"path\":\"" #$extension "/share/vscode/extensions/" #$(json-escape id) "\","
       "\"scheme\":\"file\"},"
       "\"relativeLocation\":\"" #$(json-escape id) "\","
       "\"metadata\":{\"id\":\"\",\"publisherId\":\"\","
       "\"publisherDisplayName\":\"" #$(json-escape publisher) "\","
       "\"targetPlatform\":\"" #$(json-escape platform) "\","
       "\"isApplicationScoped\":false,\"updated\":false,"
       "\"isPreReleaseVersion\":false,\"installedTimestamp\":0,"
       "\"preRelease\":false}}")))

(define (vscode-extensions-json-directory extensions)
  "Return a computed directory containing only
share/vscode/extensions/extensions.json describing EXTENSIONS (already
validated and sorted)."
  (computed-file
   "vscode-extensions-json"
   (with-imported-modules '((guix build utils))
     #~(begin
         (use-modules (guix build utils))
         (let ((dir (string-append #$output "/share/vscode/extensions")))
           (mkdir-p dir)
           (call-with-output-file (string-append dir "/extensions.json")
             (lambda (port)
               (display "[" port)
               (let loop ((entries (list #$@(map extension-json-entry-gexp
                                                 extensions)))
                          (first? #t))
                 (when (pair? entries)
                   (unless first? (display "," port))
                   (display (car entries) port)
                   (loop (cdr entries) #f)))
               (display "]\n" port))))))))

(define* (vscode-extensions-directory extensions)
  "Compose EXTENSIONS (a list of extension packages) into one immutable
directory:

    share/vscode/extensions/<publisher>.<name>/…   (one per extension)
    share/vscode/extensions/extensions.json

Duplicate identifiers and non-extension packages are rejected at
evaluation time.  Ordering is deterministic (sorted by identifier)."
  (let ((sorted (validate-extension-set extensions)))
    (directory-union "vscode-extensions"
                     (append sorted
                             (list (vscode-extensions-json-directory sorted))))))

(define* (vscode-with-extensions vscode extensions
                                 #:key
                                 (command-name "code")
                                 (desktop-file-name "vscode.desktop"))
  "Return a lightweight package wrapping VSCODE so that COMMAND-NAME runs
with --extensions-dir pointing at the immutable collection built from
EXTENSIONS.

The wrapper execs the base package's own launcher (preserving its
environment, Electron/Wayland flags and GUI/CLI behaviour) and never
rebuilds VS Code.  The desktop entry of the base package is copied with
its Exec store path rewritten to the wrapper, so menu launches use the
same extension set as terminal launches; icon resources are symlinked.

A profile must contain either VSCODE or this wrapper, not both: their
bin/COMMAND-NAME and desktop entry names intentionally collide so that a
conflict is reported instead of a silently extension-less desktop launch."
  (let ((extensions-dir (vscode-extensions-directory extensions)))
    (package
      (inherit vscode)
      (name (string-append (package-name vscode) "-with-extensions"))
      ;; Record the declared extension identifiers for tests and diagnostics.
      (properties `((vscode-extension-ids
                     . ,(map vscode-extension-package-id
                             (validate-extension-set extensions)))))
      (source #f)
      (build-system trivial-build-system)
      (inputs '())
      (native-inputs '())
      (propagated-inputs '())
      (arguments
       (list
        #:modules '((guix build utils))
        #:builder
        #~(begin
            (use-modules (guix build utils)
                         (ice-9 textual-ports)
                         (srfi srfi-13))
            (let* ((out #$output)
                   (bin (string-append out "/bin"))
                   (command (string-append bin "/" #$command-name)))
              (mkdir-p bin)
              (call-with-output-file command
                (lambda (port)
                  (format port "#!~a~%" #$(file-append bash-minimal "/bin/sh"))
                  (format port "exec '~a' --extensions-dir '~a' \"$@\"~%"
                          #$(file-append vscode
                                         (string-append "/bin/" command-name))
                          #$(file-append extensions-dir
                                         "/share/vscode/extensions"))))
              (chmod command #o555))
            ;; Desktop integration: keep every field of the base entry
            ;; (flags, actions, WMClass, placeholders) and only retarget the
            ;; Exec store path to this wrapper.  Plain substring replacement,
            ;; not substitute*: the pattern is only known at build time.
            (let* ((apps (string-append #$output "/share/applications"))
                   (desktop (string-append apps "/" #$desktop-file-name))
                   (old #$(file-append vscode
                                       (string-append "/bin/" command-name)))
                   (new (string-append #$output "/bin/" #$command-name)))
              (mkdir-p apps)
              (copy-file #$(file-append vscode
                                        (string-append "/share/applications/"
                                                       desktop-file-name))
                         desktop)
              ;; copy-file preserves the read-only store mode.
              (chmod desktop #o644)
              (let ((content (call-with-input-file desktop get-string-all)))
                (call-with-output-file desktop
                  (lambda (port)
                    (let ((at (string-contains content old)))
                      (if at
                          (format port "~a~a~a"
                                  (substring content 0 at)
                                  new
                                  (substring content (+ at (string-length old))))
                          (begin
                            (format (current-error-port)
                                    "warning: ~a not found in ~a; leaving Exec unchanged~%"
                                    old desktop)
                            (display content port))))))))
            ;; Icon resources are referenced by name from the desktop entry;
            ;; reuse the base package's hicolor tree.
            (symlink (string-append #$vscode "/share/icons")
                     (string-append #$output "/share/icons")))))))))

;;; vscode-extensions.scm ends here
