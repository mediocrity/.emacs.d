(add-hook 'rust-mode-hook 'linum-mode)
(add-hook 'rust-mode-hook 'racer-mode)
(add-hook 'racer-mode-hook 'eldoc-mode)
(add-hook 'racer-mode-hook 'company-mode)
(add-hook 'rust-mode-hook 'flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-rust-setup)


(setq company-tooltip-align-annotations t)

(require 'rust-mode)

(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(define-key rust-mode-map (kbd "C-c f m t") 'rustfmt-format-buffer)
(define-key rust-mode-map (kbd "C-c r d") 'racer-describe)
