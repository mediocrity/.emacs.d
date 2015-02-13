(column-number-mode t)
(setq inhibit-startup-screen t)
(scroll-bar-mode -1)
(show-paren-mode t)
(size-indication-mode t)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq visible-bell 1)
(setq disabled-command-function nil)
(setq org-src-fontify-natively t)
(electric-pair-mode)


;; Backups and auto-saves
(setq backup-directory-alist 
      `((".*" . ,"~/.saves")))
(setq auto-save-default nil) ; I save too often anyway.


;; IDO mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


(require 'zone)
(zone-when-idle (* 60 20))


;; Loading init files
(setq custom-file "~/.emacs.d/init_custom.el")
(load custom-file)

(load "~/.emacs.d/init_external.el")
(load "~/.emacs.d/init_python.el")
(load "~/.emacs.d/init_hooks.el")
(load "~/.emacs.d/init_defun.el")
(load "~/.emacs.d/init_csharp.el")
(load "~/.emacs.d/init_local.el")
(load "~/.emacs.d/init_chords.el")


;; Global bindings

(global-set-key (kbd "C-c g") (make-search "https://www.google.com/search?q=%s"))
(global-set-key (kbd "C-c t") 'toggle-transparency)
(global-set-key (kbd "M-c") 'invert-capitalization)

(global-set-key (kbd "S-<f4>") 'local-set-key) 
(global-set-key (kbd "C-<f4>") 'global-set-key)

(global-set-key (kbd "C-c q w e ") (lambda () (interactive) (load-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-c i n i t") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-c i n i l") (lambda () (interactive) (find-file "~/.emacs.d/init_local.el")))

(global-set-key (kbd "C-c m d u") 'magit-diff-unstaged)
(global-set-key (kbd "C-c m d s") 'magit-diff-staged)
(global-set-key (kbd "C-c m s") 'magit-status)

(global-set-key (kbd "<f9>") 'eshell)
(global-set-key (kbd "C-<f9>") 'shell)

(global-set-key (kbd "<f10>") 'kill-this-buffer)

(global-set-key (kbd "C-<f7>") 'point-to-register)
(global-set-key (kbd "<f7>") 'jump-to-register)

(global-set-key (kbd "<f5>") 'yas-visit-snippet-file)
(global-set-key (kbd "<C-f5>") 'yas-new-snippet)

(global-set-key (kbd "C-c w e") (lambda () (interactive)
				  (switch-to-buffer "english-writing-buffer")
				  (text-mode)))

(global-set-key (kbd "C-c w s") (lambda () (interactive)
				  (switch-to-buffer "svensk-skrift-buffer")
				  (text-mode)
				  (ispell-change-dictionary "svenska")))

(define-key global-map (kbd "<f8>") 'ace-jump-mode)

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "<f1>") 'revert-this-buffer)
(global-set-key (kbd "<f2>") 'rgrep)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c p r") 'rename-file-and-buffer)
(global-set-key (kbd "C-c p m") 'move-buffer-file)


;; Initial Mode
(setq initial-major-mode 'eshell)

;; Font
(set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 100)
