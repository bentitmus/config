;; early-init.el is loaded earlier than init.el and used to setup the cache

; use XDG cache path for the emacs cache
(require 'xdg)
(startup-redirect-eln-cache (expand-file-name "emacs/eln-cache" (xdg-cache-home)))
(setq package-user-dir (expand-file-name "emacs/elpa" (xdg-cache-home)))

; no title bar
(add-to-list 'default-frame-alist '(undecorated . t))
(setq frame-resize-pixelwise t)

