(column-number-mode t)
(setq inhibit-startup-screen t)
(scroll-bar-mode nil)
(show-paren-mode t)
(size-indication-mode t)
(tool-bar-mode nil)
(tooltip-mode nil)
(menu-bar-mode -1)
(setq visible-bell 1)


(put 'narrow-to-region 'disabled nil)
(setq org-src-fontify-natively t)
(put 'dired-find-alternate-file 'disabled nil)


;; Backups and auto-saves
(setq backup-directory-alist 
      `((".*" . ,"~/.saves")))
(setq auto-save-default nil) ; I save too often anyway.


;; Melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )



;; IDO mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; yasnippet
(add-to-list 'load-path
	     "~/.emacs.d/elpa/yasnippet-20140106.1009")
(require 'yasnippet)
(yas-global-mode 1)
(setq yas/indent-line nil)

;; Flymake
; http://stackoverflow.com/questions/11269937/syntax-highlighting-conflicts-with-flymake-errline-color-in-emacs
(custom-set-faces '(flymake-errline ((((class color)) (:background "Black")))) 
'(flymake-warnline ((((class color)) (:background "Gray50")))))

(window-numbering-mode)

(require 'move-text)
(move-text-default-bindings)



;; Defined functions

(defun my-macro-query (arg) ; http://www.emacswiki.org/emacs/KeyboardMacros#toc5
  "Prompt for input using minibuffer during kbd macro execution.
    With prefix argument, allows you to select what prompt string to use.
    If the input is non-empty, it is inserted at point."
  (interactive "P")
  (let* ((prompt (if arg (read-from-minibuffer "PROMPT: ") "Input: "))
	 (input (minibuffer-with-setup-hook (lambda () (kbd-macro-query t))
		  (read-from-minibuffer prompt))))
    (unless (string= "" input) (insert input))))


(defun make-search (base-url)
  (lexical-let ((url base-url))
  (lambda (query)
    (interactive "sSearch:")
    (browse-url-firefox (format url query)))))


(defun make-browse (base-url)
  (lexical-let ((url base-url))
  (lambda (query)
    (interactive "P")
    (browse-url-firefox url))))


(defun invert-capitalization ()
  "This is a test"
  (interactive)
  (setq case-fold-search nil) ;; Is there a better way
  (let (pos1 pos2 bounds word)
    (setq bounds (bounds-of-thing-at-point 'word))
    (setq pos1 (car bounds))
    (setq pos2 (cdr bounds))
    (setq word (buffer-substring pos1 pos2))
    (if (string-match "^[a-z].*" word) 
	(capitalize-region pos1 pos2) (downcase-region pos1 pos2) 
	)
    )
  (setq case-fold-search 1)
  )


(defun reload_init_file () 
  (interactive) 
  (load-file "~/.emacs.d/init.el"))


(defun alarm (minutes)
  "Play preset sound in X minutes."
  (interactive "sHow may minutes to alarm?")
  (run-at-time (format "%s min" minutes) nil (lambda ()
					       (play-sound-file "/path/to/sound/file"))))



;; Emacs Tranparency: http://www.emacswiki.org/emacs/TransparentEmacs
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(100 100))
(add-to-list 'default-frame-alist '(alpha 100 100))

(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(85 50))))


;; Global editing commands

(global-set-key (kbd "C-c t") 'toggle-transparency)

(global-set-key (kbd "C-c b k") (make-browse "https://duckduckgo.com"))
(global-set-key (kbd "C-c b g") (make-search "https://www.google.com/search?q=%s"))
(global-set-key (kbd "<f11>") (make-search "https://www.google.com/search?q=%s"))

(global-set-key (kbd "<f9>") 'local-set-key)
(global-set-key (kbd "C-<f9>") 'global-set-key)

(global-set-key (kbd "M-c") 'invert-capitalization)
(global-set-key (kbd "C-x Q") 'my-macro-query)
(global-set-key (kbd "C-c q w e") 'reload_init_file)

(global-set-key (kbd "C-<f1>") (lambda () (find-file "~/.emacs.d/init.el")))


;; CSS
(add-hook 'css-mode-hook 'rainbow-mode) ; i know what you are thinking

;; GOLANG
(require 'go-mode)

;; Emacs lisp
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)

;; TEXT
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)


;; Loading init files
(setq custom-file "~/.emacs.d/init_custom.el")
(load custom-file)

(load "~/.emacs.d/init_python.el")


