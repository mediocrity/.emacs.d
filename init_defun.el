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
	(capitalize-region pos1 (+ pos1 1)) (downcase-region pos1 (+ pos1 1)))))

(defun invert-case ()
  (interactive)
  (let (pos1 pos2 bounds (case-fold-search nil))
    (setq bounds (bounds-of-thing-at-point 'word))
    (setq pos1 (car bounds) pos2 (cdr bounds))
    (if (string-match "^[a-z].*" (buffer-substring pos1 pos2))
	(upcase-region pos1 pos2) (downcase-region pos1 pos2))))


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

;; http://docs.pylint.org/ide-integration.html#using-pylint-thru-flymake-in-emacs
(defun show-fly-err-at-point ()
  "If the cursor is sitting on a flymake error, display the message in the minibuffer"
  (require 'cl)
  (interactive)
  (let ((line-no (line-number-at-pos)))
    (dolist (elem flymake-err-info)
      (if (eq (car elem) line-no)
      (let ((err (car (second elem))))
        (message "%s" (flymake-ler-text err)))))))

;; http://www.masteringemacs.org/article/my-emacs-keybindings
(defun revert-this-buffer ()
  (interactive)
  (revert-buffer nil t t)
  (message (concat "Reverted buffer " (buffer-name))))

;; Function for installing Emacs python dependencies
(defun update-python-dependencies ()
    (interactive)
    (shell-command "pip install -r ~/.emacs.d/install/python-req.txt"))


;; https://sites.google.com/site/steveyegge2/my-dot-emacs-file
(defun swap-windows ()
 "If you have 2 windows, it swaps them." (interactive) (cond ((not (= (count-windows) 2)) (message "You need exactly 2 windows to do this."))
 (t
 (let* ((w1 (first (window-list)))
	 (w2 (second (window-list)))
	 (b1 (window-buffer w1))
	 (b2 (window-buffer w2))
	 (s1 (window-start w1))
	 (s2 (window-start w2)))
 (set-window-buffer w1 b2)
 (set-window-buffer w2 b1)
 (set-window-start w1 s2)
 (set-window-start w2 s1)))))

(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
  (let ((name (buffer-name))
	(filename (buffer-file-name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
	  (message "A buffer named '%s' already exists!" new-name)
	(progn (rename-file name new-name 1) (rename-buffer new-name) (set-visited-file-name new-name) (set-buffer-modified-p nil))))))

(defun move-buffer-file (dir)
  "Moves both current buffer and file it's visiting to DIR." (interactive "DNew directory: ")
  (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir
	  (if (string-match dir "\\(?:/\\|\\\\)$")
	      (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (progn (copy-file filename newname 1) (delete-file filename)  (set-visited-file-name newname) (set-buffer-modified-p nil) t))))
