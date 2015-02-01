(require-package 'go-mode)
(require-package 'company-go)
(require-package 'go-eldoc)
(require-package 'go-snippets)
(require 'go-mode)

(setq company-go-insert-arguments t)
(setq gofmt-command "goimports")

(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook 'go-company)
(add-hook 'before-save-hook #'gofmt-before-save)

(defun go-company ()
  (set (make-local-variable 'company-backends) '((company-go company-yasnippet))))

(evil-define-key 'normal go-mode-map (kbd "C-]") 'godef-jump)
(evil-define-key 'normal go-mode-map (kbd "K") 'godef-describe)

(evil-define-key 'normal go-mode-map (kbd "<SPC> g o i") 'go-oracle-implements)
(evil-define-key 'normal go-mode-map (kbd "<SPC> g o c") 'go-oracle-callers)
(evil-define-key 'normal go-mode-map (kbd "<SPC> g o s") 'go-oracle-callstack)

(evil-define-key 'normal go-mode-map (kbd "<SPC> g r") 'save-buffer-and-go-rename)

; Saves buffer before going to go-rename
(defun save-buffer-and-go-rename ()
  (interactive)
  ; Disable gofmt before saving to avoid missing the point of thing
  (remove-hook 'before-save-hook #'gofmt-before-save)
  (save-buffer)
  (add-hook 'before-save-hook #'gofmt-before-save)
  (call-interactively 'go-rename))

; Go oracle
(let ((file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el"))
  (when (file-exists-p (substitute-in-file-name file))
    (progn (load file))
    (go-oracle-mode)))

; Go rename
(let ((file "$GOPATH/src/golang.org/x/tools/refactor/rename/rename.el"))
  (when (file-exists-p (substitute-in-file-name file))
    (progn (load file))))

(provide 'init-go-mode)
