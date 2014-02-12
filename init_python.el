;; Emacs Python initialization 

;; kv-mode improvement
(add-hook 'kivy-mode-hook (lambda () (setq indent-tabs-mode nil)))


;; PYTHON
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'linum-mode)


;; Flymake

;; Pyflakes 
;; (require 'flymake-python-pyflakes)
;; (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
;; (setq flymake-python-pyflakes-executable "flake8")


;; pylint & elintlake8
(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "~/.emacs.d/scripts/elintlake8.py" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))

(add-hook 'python-mode-hook '(lambda () (flymake-mode)))


;; from: http://docs.pylint.org/ide-integration.html#using-pylint-thru-flymake-in-emacs
(defun show-fly-err-at-point ()
  "If the cursor is sitting on a flymake error, display the message in the minibuffer"
  (require 'cl)
  (interactive)
  (let ((line-no (line-number-at-pos)))
    (dolist (elem flymake-err-info)
      (if (eq (car elem) line-no)
      (let ((err (car (second elem))))
        (message "%s" (flymake-ler-text err)))))))

(add-hook 'post-command-hook 'show-fly-err-at-point)


;; Python mode keys and macros
(require 'python)

(define-key python-mode-map (kbd "<f5>") "import pdb; pdb.set_trace()")
(define-key python-mode-map (kbd "<f8>") 'flymake-goto-next-error)

