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


(defun invert-capitalization ()
  "This is a test" ; Really?
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

