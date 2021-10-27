;; languages
(use-package corfu
  :config
  (corfu-global-mode))

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

(use-package verilog-mode)

(use-package yaml-mode)

