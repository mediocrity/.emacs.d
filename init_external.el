;; External package settings

;; Melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )


(window-numbering-mode)

(require 'move-text)
(move-text-default-bindings)

;; yasnippet
(add-to-list 'load-path
	     "~/.emacs.d/elpa/yasnippet-20140106.1009")
(require 'yasnippet)
(yas-global-mode 1)
(setq yas/indent-line nil)
