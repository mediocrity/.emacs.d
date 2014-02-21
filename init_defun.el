;; Defined functions


(defun make-search (base-url)
  (lexical-let ((url base-url))
  (lambda (query)
    (interactive "sSearch:")
    (browse-url-firefox (format url query)))))


(defun invert-capitalization ()
  (interactive)
  (let (pos1 pos2 bounds (case-fold-search nil))
    (setq bounds (bounds-of-thing-at-point 'word))
    (setq pos1 (car bounds) pos2 (cdr bounds))
    (if (string-match "^[a-z].*" (buffer-substring pos1 pos2)) 
	(capitalize-region pos1 pos2) (downcase-region pos1 pos2))))


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

