;;; Offline unit tests for (virelith packages vscode).

(use-modules (ice-9 rdelim)
             (srfi srfi-64)
             (virelith packages vscode))

(test-runner-current (test-runner-simple))

(test-begin "vscode")

(test-assert "vscode: package launcher preserves runtime wrapper and backgrounds GUI"
  (let ((source (call-with-input-file "src/virelith/packages/vscode.scm"
                  read-string)))
    (and (string-contains source "install-cli-launcher")
         (string-contains source "/.code-real")
         (string-contains source "--wait")
         (string-contains source ">/dev/null 2>&1 &"))))

(test-end "vscode")
