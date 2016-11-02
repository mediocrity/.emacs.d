;; Python initialization 

;; Flymake with flake8
(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "flake8" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))


(defun jedi-complete-with-isearch ()
  (interactive)
  (epc:sync (jedi:get-epc) (jedi:complete-request))
  (if (> (length (jedi:ac-direct-matches)) 0)
      (let ((completion (popup-menu* (jedi:ac-direct-matches)
				     :width 30
				     :margin-left 1
				     :margin-right 1
				     :scroll-bar t
				     :isearch t
				     :help-delay nil)))
	(insert completion))))

;; autopep8
(setq py-autopep8-options '("--max-line-length=120"))

(defun add-company-jedi-backend ()
  (add-to-list 'company-backends 'company-jedi))


;; hooks
(add-hook 'python-mode-hook 'add-company-jedi-backend)
(add-hook 'python-mode-hook 'flyspell-prog-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'python-mode-hook 'company-mode)
(add-hook 'python-mode-hook '(lambda () (flymake-mode)))
(add-hook 'python-mode-hook
	  '(lambda () (local-set-key (kbd "RET")'newline-and-indent)))

;; bindings
(require 'python)
(define-key python-mode-map (kbd "TAB") 'company-indent-or-complete-common)
(define-key python-mode-map (kbd "C-c c p d b") "import pdb; pdb.set_trace()")
(define-key python-mode-map (kbd "C-c n e") 'flymake-goto-next-error)
(define-key python-mode-map (kbd "C-c c p e p") 'py-autopep8)
(define-key python-mode-map (kbd "C-c h") 'helm-pydoc)
(define-key python-mode-map (kbd "C-c d o c") 'jedi:show-doc)
(define-key python-mode-map (kbd "C-c d e f") 'jedi:goto-definition)
(define-key python-mode-map (kbd "<backtab>") 'jedi-complete-with-isearch)
