(require-package 'evil)
(require-package 'evil-nerd-commenter)
(require-package 'evil-jumper)
(require-package 'evil-visualstar)
(require 'evil-jumper)
(require 'evil-visualstar)

; Config
(setq evil-search-module 'evil-search)
; Enable evil mode
(evil-mode t)
; Enable evil-nerd-commenter
(evilnc-default-hotkeys)

(provide 'init-evil-mode)
