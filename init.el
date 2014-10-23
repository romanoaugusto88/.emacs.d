; Add config dir to load path
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
; Add local config dir to load path
(add-to-list 'load-path (expand-file-name "local-config" user-emacs-directory))

;;
;; Global functions
;
(require 'init-functions)

;;
;; Custom config
;
; Enable deletion of selected text
(delete-selection-mode 1)
; Disable backup
(setq backup-inhibited t)
; Disable auto saving
(setq auto-save-default nil)
; Default indentation
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(electric-indent-mode t)
; Don't show me the startup screen
(setq inhibit-startup-screen t)
; Disable menu bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
; Disable tool bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
; Disable scroll bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
; Encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
; Aliases
(defalias 'yes-or-no-p 'y-or-n-p)
; imenu
(setq-default imenu-auto-rescan t)
; Parens mode
(show-paren-mode 1)
(setq show-paren-delay 0)
; Fontify current frame
(fontify-frame nil)
; Fontify any future frames
(push 'fontify-frame after-make-frame-functions)
; Set window size
(set-frame-size-according-to-resolution)
; Highlight current line
(global-hl-line-mode t)
; Line spacing
(setq-default line-spacing 3)

;;
;; Custom key bindings
;
; Disable the Ctrl+Z to void put Emacs on background job
; Notice that the evil-mode might override this setting to
; switch between evil/emacs mode
(global-unset-key (kbd "C-z"))
; BOL
(global-set-key (kbd "<home>") 'back-to-indentation)
; Ace Jump Char Mode
(global-set-key (kbd "C-j") 'ace-jump-char-mode)
; Moving line
(global-set-key (kbd "<C-S-down>") 'move-line-down)
(global-set-key (kbd "<C-S-up>") 'move-line-up)
; Opening lines
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)
; Scrolling 1 line
(global-set-key (kbd "<C-down>") 'gcm-scroll-down)
(global-set-key (kbd "<C-up>") 'gcm-scroll-up)


;;
;; Packages
;
(require 'init-elpa)
(require 'init-linum-relative)
(require 'init-smooth-scrolling)
(require 'init-uniquify)
(require 'init-projectile)
(require 'init-evil-mode)
(require 'init-smex)
(require 'init-ido)
(require 'init-helm)
(require 'init-imenu)
(require 'init-company-mode)
(require 'init-expand-region)
(require 'init-smartparens)
(require 'init-flycheck)
(require 'init-ag)
(require 'init-yasnippet)
(require 'init-key-chord)
(require 'init-multiple-cursors)
(require 'init-ace-jump-mode)
; Programming languages modes
(require 'init-php-mode)
(require 'init-go-mode)
(require 'init-javascript-mode)
(add-hook 'python-mode-hook
          (lambda()
            (require 'init-python-mode)))
(add-hook 'java-mode-hook
          (lambda()
            (require 'init-java-mode)))
(require 'init-yaml-mode)

;;
;; Local Config
;
(require 'init-local-config nil 'noerror)
