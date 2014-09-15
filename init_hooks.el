;; css-mode
(add-hook 'css-mode-hook 'rainbow-mode) ; i know what you are thinking

;; emacs-lisp-mode
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)

;; text-mode
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)

;; html-mode
(add-hook 'html-mode-hook 'turn-off-auto-fill)

;; kv-mode 
(add-hook 'kivy-mode-hook (lambda () (setq indent-tabs-mode nil)))

;; javascript-mode
(add-hook 'js-mode-hook (lambda ()
			  (setq indent-tabs-mode nil)
			  (flymake-jshint-load)
			  (linum-mode)))

;; flymake
(add-hook 'post-command-hook 'show-fly-err-at-point)

;; c language
(add-hook 'c-mode-hook 'linum-mode)

