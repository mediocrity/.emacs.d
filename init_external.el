;; External package settings


;; Package Archives
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)


(window-numbering-mode)


(move-text-default-bindings)


(ws-butler-global-mode)


(projectile-global-mode)


;; yasnippet
(yas-global-mode 1)
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
