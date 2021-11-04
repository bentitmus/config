;; org-mode
(defun bt/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))
(defun bt/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.0)
                  (org-level-6 . 1.0)
                  (org-level-7 . 1.0)
                  (org-level-8 . 1.0)))
          (set-face-attribute (car face) nil :font "Valkyrie T4" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))
(use-package org
  :ensure t
  :hook (org-mode . bt/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
        org-hide-emphasis-markers t)
  (bt/org-font-setup))
(use-package org-bullets
  :after org
  :ensure t
  :hook (org-mode . org-bullets-mode))
(use-package valign
  :ensure t
  :custom
  (valign-fancy-bar t)
  :hook (org-mode . valign-mode))
(use-package org-gtd
  :after org
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
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (expand-file-name "OrgRoam" bt-org-base))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-db-autosync-mode))
(defun bt/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))
(use-package visual-fill-column
  :ensure t
  :hook (org-mode . bt/org-mode-visual-fill))

