(require 'package) ;; Emacs builtin

;; set package.el repositories
(setq package-archives
  '(
    ("org" . "https://orgmode.org/elpa/")
    ("gnu" . "https://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.org/packages/")
  ))

;; initialize built-in package management
(package-initialize)

;; update packages list if we are on a new install
(unless package-archive-contents
  (package-refresh-contents))

;; a list of pkgs to programmatically install
;; ensure installed via package.el
(setq my-package-list '(use-package))

;; programmatically install/ensure installed
;; pkgs in your personal list
(dolist (package my-package-list)
  (unless (package-installed-p package)
          (package-install package)))

;; gui
(use-package emacs
  :init
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1)
  (column-number-mode t))
;;  :config
;;  (setq inhibit-splash-screen t))

;;(set-frame-font "Triplicate T4c 12" nil t)
(set-face-attribute 'default nil :font "Triplicate T4c-12")
(set-face-attribute 'fixed-pitch nil :font "Triplicate T4c-12")
(set-face-attribute 'variable-pitch nil :font "Valkyrie T4-12")

;; org-mode
(use-package org
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (selenized-light)))
 '(custom-safe-themes
   (quote
    ("cf36206431f80f0435bb7461e8be8429d949ba641abaf790b7730423e2e88638" "9bb86bf42ce13b9fce1690024d52238133988555009ac59a2f63ae2df7790c55" "59263e76fcbf0b0f278c27a78e01ad40d1191edf9c55cfcbe1a47e89e25a1893" default)))
 '(package-selected-packages (quote (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
