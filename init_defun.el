;; Defined functions


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

