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
  (column-number-mode t)
  :config
  (setq inhibit-splash-screen t))

(use-package which-key
  :config
  (which-key-mode))

(setq bt-work-p (file-directory-p "/arm"))

;; Use /bin/sh instead of fish for the shell because it will work better with most packages
(setq shell-file-name "/bin/sh")

(if bt-work-p
  (progn
    (set-face-attribute 'default nil :font "Triplicate T4c-12")
    (set-face-attribute 'fixed-pitch nil :font "Triplicate T4c-12")
    (set-face-attribute 'variable-pitch nil :font "Valkyrie T4-12")
    (setq bt-org-base "~/OrgMode"))
  (progn
    (set-face-attribute 'default nil :font "Triplicate T4c-14")
    (set-face-attribute 'fixed-pitch nil :font "Triplicate T4c-14")
    (set-face-attribute 'variable-pitch nil :font "Valkyrie T4-14")
    (setq bt-org-base "~/Dropbox/OrgMode")))

;; languages
(use-package company
  :ensure t
  :defer t
  :init (global-company-mode)
  :config
  (progn
    ;; Use Company for completion
    (bind-key [remap completion-at-point] #'company-complete company-mode-map)

    (setq company-tooltip-align-annotations t
          ;; Easy navigation to candidates with M-<n>
          company-show-numbers t)
    (setq company-dabbrev-downcase nil))
  :diminish company-mode)
(use-package yaml-mode)
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-enable-snippet nil)
  (setq yaml-indent-offset 2)
  :hook ((yaml-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)
(setq-default indent-tabs-mode nil)

;; org-mode
(use-package org
  :ensure t)
(use-package org-gtd
  :after org
  :demand t
  :ensure t
  :pin melpa
  :custom
  ;; where org-gtd will put its files. This value is also the default one.
  (org-gtd-directory (expand-file-name "GTD" bt-org-base))
  ;; package: https://github.com/Malabarba/org-agenda-property
  ;; this is so you can see who an item was delegated to in the agenda
  (org-agenda-property-list '("DELEGATED_TO"))
  ;; I think this makes the agenda easier to read
  (org-agenda-property-position 'next-line)
  ;; package: https://www.nongnu.org/org-edna-el/
  ;; org-edna is used to make sure that when a project task gets DONE,
  ;; the next TODO is automatically changed to NEXT.
  (org-edna-use-inheritance t)
  :config
  (org-edna-load)
  :bind
  (("C-c d c" . org-gtd-capture) ;; add item to inbox
   ("C-c d a" . org-agenda-list) ;; see what's on your plate today
   ("C-c d p" . org-gtd-process-inbox) ;; process entire inbox
   ("C-c d n" . org-gtd-show-all-next) ;; see all NEXT items
   ("C-c d s" . org-gtd-show-stuck-projects)) ;; see projects that don't have a NEXT item
  :init
  ;; the keybinding to hit when you're done editing an item in the processing phase
  (bind-key "C-c c" 'org-gtd-clarify-finalize))
(use-package org-agenda
  :ensure nil
  :after org-gtd
  :config
  (setq org-agenda-files `(,org-gtd-directory))
  ;; a useful view to see what can be accomplished today
  (setq org-agenda-custom-commands '(("g" "Scheduled today and all NEXT items" ((agenda "" ((org-agenda-span 1))) (todo "NEXT"))))))
(use-package org-capture
  :ensure nil
  :after org-gtd
  :config
  (setq org-capture-templates
      `(("i" "Inbox"
         entry (file ,(org-gtd-inbox-path))
         "* %?\n%U\n\n  %i"
         :kill-buffer t)
        ("l" "Todo with link"
         entry (file ,(org-gtd-inbox-path))
         "* %?\n%U\n\n  %i\n  %a"
         :kill-buffer t))))
(use-package org-roam
  :ensure t
  :after org
  :init
  (setq org-roam-directory (expand-file-name "OrgRoam" bt-org-base))
  (setq org-roam-v2-ack t))
;;  :config
;;  (org-roam-db-autosync-mode))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(selenized-light))
 '(custom-safe-themes
   '("cf36206431f80f0435bb7461e8be8429d949ba641abaf790b7730423e2e88638" "9bb86bf42ce13b9fce1690024d52238133988555009ac59a2f63ae2df7790c55" "59263e76fcbf0b0f278c27a78e01ad40d1191edf9c55cfcbe1a47e89e25a1893" default))
 '(package-selected-packages
   '(yaml-mode company yasnippet which-key lsp-ui lsp-mode org-roam org-super-agenda org-gtd use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
