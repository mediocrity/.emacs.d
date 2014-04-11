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

(when (not(string-equal system-type "windows-nt"))
  (setq ; http://www.emacswiki.org/emacs/PythonProgrammingInEmacs
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
  )

;; autopep8
(setq py-autopep8-options '("--max-line-length=120"))

;; hooks
(add-hook 'python-mode-hook 'flyspell-prog-mode)
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'python-mode-hook '(lambda () (flymake-mode)))

;; bindings
(require 'python)
(define-key python-mode-map (kbd "C-c p d b") "import pdb; pdb.set_trace()")
(define-key python-mode-map (kbd "C-c n e") 'flymake-goto-next-error)
(define-key python-mode-map (kbd "C-c p e p") 'py-autopep8)
(define-key python-mode-map (kbd "C-c h") 'helm-pydoc)
