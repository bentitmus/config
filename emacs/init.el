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

(use-package minions
  :config
  (minions-mode 1))

(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-dvorak)
  (meow-leader-define-key
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("<" . meow-beginning-of-thing)
   '(">" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("C" . meow-change-save)
   '("d" . meow-C-d)
   '("D" . meow-backward-delete)
   '("e" . meow-line)
   '("E" . meow-kmacro-lines)
   '("f" . meow-find)
   '("F" . meow-find-expand)
   '("g" . meow-cancel)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-join)
   '("k" . meow-kill)
   '("l" . meow-till)
   '("L" . meow-till-expand)
   '("m" . meow-mark-word)
   '("M" . meow-mark-symbol)
   '("n" . meow-next)
   '("N" . meow-next-expand)
   '("o" . meow-block)
   '("O" . meow-block-expand)
   '("p" . meow-prev)
   '("P" . meow-prev-expand)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-search)
   '("S" . meow-pop-search)
   '("t" . meow-right)
   '("T" . meow-right-expand)
   '("u" . undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("V" . meow-kmacro-matches)
   '("w" . meow-next-word)
   '("W" . meow-next-symbol)
   '("x" . meow-save)
   '("X" . meow-sync-grab)
   '("y" . meow-yank)
   '("Y" . meow-yank-pop)
   '("z" . meow-pop-selection)
   '("Z" . meow-pop-all-selection)
   '("&" . meow-query-replace)
   '("%" . meow-query-replace-regexp)
   '("<escape>" . meow-last-buffer)))

(use-package meow
  :demand t
  :init
  (meow-global-mode 1)
  :config
  (meow-setup)
  (meow-setup-indicator))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   ("M-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package which-key
  :config
  (which-key-mode))

(use-package dashboard
  :ensure t
  :custom
  (dashboard-items '((recents . 5)
;;                     (projects . 5)
                     (agenda . 5)))
  (dashboard-center-content t)
  (dashboard-set-footer nil)
  (dashboard-set-init-info nil)
  (dashboard-startup-banner 'logo)
  (dashboard-banner-logo-title "Emacs")
  :custom-face
  (dashboard-banner-logo-title ((t (:font "Valkyrie T4-20"))))
  (dashboard-heading ((t (:font "Valkyrie T4-16" :foreground "#8762c6"))))
  :config
  (dashboard-setup-startup-hook))

(setq bt-work-p (file-directory-p "/arm"))
(if (file-directory-p "/opt/homebrew")
    (progn
      (setq bt-mu-base "/opt/homebrew")
      (setq exec-path (append exec-path '("/opt/homebrew/bin")))
      (setenv "PATH" (concat (getenv "PATH") ":/opt/homebrew/bin")))
    (setq bt-mu-base "/usr/local"))

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

(load-file "~/.config/emacs/lang.el")
(setq-default indent-tabs-mode nil)
(use-package magit)
(use-package vertico
  :defer t
  :init
  (vertico-mode))
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

(load-file "~/.config/emacs/org.el")

;; mu4e
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
   '(dashboard marginalia embark minions keycast visual-fill-column org-bullets meow orderless corfu verilog-mode vertico magit yaml-mode which-key lsp-ui lsp-mode org-roam org-super-agenda org-gtd use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
