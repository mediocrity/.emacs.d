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


;; Flymake
(custom-set-faces '(flymake-errline ((((class color)) (:background "Black")))) 
'(flymake-warnline ((((class color)) (:background "Gray50")))))


;; Loading init files
(setq custom-file "~/.emacs.d/init_custom.el")
(load custom-file)

(load "~/.emacs.d/init_external.el")
(load "~/.emacs.d/init_python.el")
(load "~/.emacs.d/init_hooks.el")
(load "~/.emacs.d/init_defun.el")


;; Global bindings

(global-set-key (kbd "C-c g") (make-search "https://www.google.com/search?q=%s"))
(global-set-key (kbd "C-c t") 'toggle-transparency)
(global-set-key (kbd "M-c") 'invert-capitalization)

(global-set-key (kbd "S-<f4>") 'local-set-key) 
(global-set-key (kbd "C-<f4>") 'global-set-key)

(global-set-key (kbd "C-c q w e ") (lambda () (interactive) (load-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-c i n i t") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

(global-set-key (kbd "C-c d") 'magit-diff-unstaged)
(global-set-key (kbd "C-c s") 'magit-status)

(global-set-key (kbd "<f9>") 'eshell)
(global-set-key (kbd "C-<f9>") 'shell)
