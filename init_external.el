;; External package settings


;; Package Archives
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)


(window-numbering-mode)


(move-text-default-bindings)


;; yasnippet
(yas-global-mode 1)
(setq yas/indent-line nil)
