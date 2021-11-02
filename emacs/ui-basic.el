(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

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
