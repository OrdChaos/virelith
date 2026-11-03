;;; Offline unit tests for (virelith packages vscode).

(use-modules (ice-9 textual-ports)
             (srfi srfi-64)
             (virelith packages vscode))

(test-runner-current (test-runner-simple))

(test-begin "vscode")

(test-assert "vscode: package launcher preserves runtime wrapper and uses cli.js"
  (let ((source (call-with-input-file "src/virelith/packages/vscode.scm"
                  get-string-all)))
    (and (string-contains source "install-cli-launcher")
         (string-contains source "/.code-real")
         (string-contains source "--wait")
         (string-contains source "ELECTRON_RUN_AS_NODE=1")
         (string-contains source "resources/app/out/cli.js"))))

(test-end "vscode")
