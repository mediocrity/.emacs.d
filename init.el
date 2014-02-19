(column-number-mode t)
(setq inhibit-startup-screen t)
(scroll-bar-mode -1)
(show-paren-mode t)
(size-indication-mode t)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq visible-bell 1)

(electric-pair-mode)

(put 'narrow-to-region 'disabled nil)
(setq org-src-fontify-natively t)
(put 'dired-find-alternate-file 'disabled nil)


;; Backups and auto-saves
(setq backup-directory-alist 
      `((".*" . ,"~/.saves")))
(setq auto-save-default nil) ; I save too often anyway.


;; IDO mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


;; Flymake
; http://stackoverflow.com/questions/11269937/syntax-highlighting-conflicts-with-flymake-errline-color-in-emacs
(custom-set-faces '(flymake-errline ((((class color)) (:background "Black")))) 
'(flymake-warnline ((((class color)) (:background "Gray50")))))



;; Loading init files
(setq custom-file "~/.emacs.d/init_custom.el")
(load custom-file)

(load "~/.emacs.d/init_external.el")
(load "~/.emacs.d/init_python.el")
(load "~/.emacs.d/init_hooks.el")
(load "~/.emacs.d/init_defun.el")



;; Global editing commands

(global-set-key (kbd "C-c t") 'toggle-transparency)

(global-set-key (kbd "<f11>") (make-search "https://www.google.com/search?q=%s"))

(global-set-key (kbd "<f9>") 'local-set-key)
(global-set-key (kbd "C-<f9>") 'global-set-key)

(global-set-key (kbd "M-c") 'invert-capitalization)
(global-set-key (kbd "C-x Q") 'my-macro-query)
(global-set-key (kbd "C-c q w e") 'reload_init_file)

(global-set-key (kbd "C-<f1>") (lambda () (find-file "~/.emacs.d/init.el")))
