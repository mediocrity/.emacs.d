;; css-mode
(add-hook 'css-mode-hook 'rainbow-mode) ; i know what you are thinking

;; emacs-lisp-mode
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)

;; text-mode
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)

;; html
(add-hook 'html-mode-hook 'turn-off-auto-fill)
