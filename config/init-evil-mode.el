(require-package 'evil)
(require-package 'evil-nerd-commenter)
(require-package 'evil-jumper)
(require-package 'evil-visualstar)
(require-package 'evil-matchit)

(setq evil-want-C-u-scroll t)
; Enable evil mode
(evil-mode t)
; Enable evil-nerd-commenter
(evilnc-default-hotkeys)

(global-evil-jumper-mode t)
(global-evil-visualstar-mode t)
(global-evil-matchit-mode t)

(provide 'init-evil-mode)
