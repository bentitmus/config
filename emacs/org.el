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

