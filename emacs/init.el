;; -*- lexical-binding: t; -*-

;; init.el is the top level main emacs configuration

;; load the theme first to get the colours correct
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(selenized-light))
 '(custom-safe-themes
   '("bce0aec74ba26cb98834493267495f39452261a2e27c8ff7fb227f2fb5213762"
     "cf36206431f80f0435bb7461e8be8429d949ba641abaf790b7730423e2e88638"
     "9bb86bf42ce13b9fce1690024d52238133988555009ac59a2f63ae2df7790c55"
     "59263e76fcbf0b0f278c27a78e01ad40d1191edf9c55cfcbe1a47e89e25a1893"
     default))
 '(package-selected-packages
   '(ace-window consult-flycheck org-roam-ui org-roam-timestamps avy
                embark-consult consult flycheck org-capture org-agenda
                valign dashboard marginalia embark minions
                visual-fill-column org-bullets meow orderless corfu
                verilog-mode vertico magit yaml-mode which-key lsp-ui
                lsp-mode org-roam org-super-agenda org-gtd use-package)))

;; set-up the package system
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(load-file "~/.config/emacs/ui.el")

;; Use /bin/sh instead of fish for the shell because it will work better with most packages
(setq shell-file-name "/bin/sh")

(load-file "~/.config/emacs/lang.el")
(setq-default indent-tabs-mode nil)
(use-package magit
  :ensure t)

(load-file "~/.config/emacs/org.el")

;; mu4e
(if (file-directory-p "/opt/homebrew")
    (progn
      (setq bt-mu-base "/opt/homebrew")
      (setq exec-path (append exec-path '("/opt/homebrew/bin")))
      (setenv "PATH" (concat (getenv "PATH") ":/opt/homebrew/bin")))
    (setq bt-mu-base "/usr/local"))
(if (file-exists-p (expand-file-name "bin/mu" bt-mu-base))
    (let ((default-directory bt-mu-base))
      (progn
	(add-to-list 'load-path (expand-file-name "share/emacs/site-lisp/mu/mu4e"))
	(require 'mu4e)
	(setq mail-user-agent 'mu4e-user-agent)
	(setq mu4e-mu-binary (expand-file-name "bin/mu"))
	(setq
	  mu4e-view-show-images    t
	  mu4e-view-show-addresses t
	  mu4e-date-format         "%y-%m-%d"
	  mu4e-headers-date-format "%Y-%m-%d")
	(setq mu4e-get-mail-command "mbsync -c ~/.config/isync/mbsyncrc -a")

	(setq
	  user-mail-address "ben.titmus@gmail.com"
	  user-full-name    "Benjamin Titmus"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dashboard-banner-logo-title ((t (:font "Heliotrope 4-20"))))
 '(dashboard-heading ((t (:font "Heliotrope 4-16" :foreground "#8762c6")))))

