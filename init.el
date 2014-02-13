(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes (quote ("f80f1e6ce6b9459f72caa92fa111abc629fa7c828617ba5d4c51f2b063c1a1eb" "d22444a942334d9b40baefefbd92644e4c9c9d0268f91dfc3aac7edb2f9cdea0" "e0bebff05b9b0bc478087dfe5173104f3ea105a767e9712d7fad3cc33c141c2f" "17d68ab9e3562df397e5f1837c1161473c74c78869547f27d810936b0ae2cb48" "fe0a47cc3952fede574527a1c28ddf3a1af381fc1fb5843ca60d22e4c841011a" default)))
 '(inhibit-startup-screen t)
 '(preview-gs-options (quote ("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4")))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))


(menu-bar-mode -1)
(setq visible-bell 1)
(put 'narrow-to-region 'disabled nil)
(setq org-src-fontify-natively t)
(put 'dired-find-alternate-file 'disabled nil)


;; Loading Files
(load "~/.emacs.d/init_python.el")


(add-to-list 'load-path
	     "~/.emacs.d/elpa/yasnippet-20140106.1009")
(require 'yasnippet)
(yas-global-mode 1)
(setq yas/indent-line nil)


;; Emacs modification
(defun open-emacs-file (args):
  (interactive "P")
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-<f1>") 'open-emacs-file)

;; Flymake
; http://stackoverflow.com/questions/11269937/syntax-highlighting-conflicts-with-flymake-errline-color-in-emacs
(custom-set-faces '(flymake-errline ((((class color)) (:background "Black")))) 
'(flymake-warnline ((((class color)) (:background "Gray50")))))

;; Melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )


;; TEXT
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)


;; Macro queries:   http://www.emacswiki.org/emacs/KeyboardMacros#toc5
(defun my-macro-query (arg)
  "Prompt for input using minibuffer during kbd macro execution.
    With prefix argument, allows you to select what prompt string to use.
    If the input is non-empty, it is inserted at point."
  (interactive "P")
  (let* ((prompt (if arg (read-from-minibuffer "PROMPT: ") "Input: "))
	 (input (minibuffer-with-setup-hook (lambda () (kbd-macro-query t))
		  (read-from-minibuffer prompt))))
    (unless (string= "" input) (insert input))))

;; Google Search
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


(global-set-key (kbd "C-c b k") (make-browse "https://duckduckgo.com"))
(global-set-key (kbd "C-c b g") (make-search "https://www.google.com/search?q=%s"))
(global-set-key (kbd "<f11>") (make-search "https://www.google.com/search?q=%s"))



;; Defined functions
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


;; Global editing commands

(global-set-key (kbd "<f9>") 'local-set-key)
(global-set-key (kbd "C-<f9>") 'global-set-key)
(global-set-key (kbd "M-c") 'invert-capitalization)
(global-set-key "\C-xQ" 'my-macro-query)


(window-numbering-mode)
(require 'move-text)
(move-text-default-bindings)


;; Reloading the init file
(defun reload_init_file () 0(interactive) (load-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-c q w e") 'reload_init_file)


;; CSS
(add-hook 'css-mode-hook 'rainbow-mode) ; i know what you are thinking


;; Activating IDO mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


;; Desktop 
;(desktop-save-mode 1)


;; Backups and auto-saves
(setq backup-directory-alist 
      `((".*" . ,"~/.saves")))
;(setq auto-save-file-name-transforms
;      `((".*" ,"~/.saves" t)))
(setq auto-save-default nil) ; I save too often anyway.


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
(global-set-key (kbd "C-c t") 'toggle-transparency)



;; GOLANG
(require 'go-mode)


;; (defun alarm (minutes)
;;   "Play preset sound in X minutes."
;;   (interactive "sHow may minutes to alarm?")
;;   (run-at-time (format "%s min" minutes) nil (lambda ()
;; 					       (play-sound-file "/path/to/sound/file"))))


