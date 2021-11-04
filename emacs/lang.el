;; languages
(use-package corfu
  :ensure t
  :config
  (corfu-global-mode))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-enable-snippet nil)
  (setq yaml-indent-offset 2)
  :hook ((yaml-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package verilog-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

