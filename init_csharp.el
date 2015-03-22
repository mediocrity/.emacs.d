
;; Some tab resultion code
;; http://www.emacswiki.org/emacs/CompanyMode
(add-hook 'csharp-mode-hook 'linum-mode)
(add-hook 'csharp-mode-hook (lambda () (setq indent-tabs-mode nil)))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
	(backward-char 1)
	(if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
	    (null (do-yas-expand)))
	(if (check-expansion)
	    (omnisharp-auto-complete)
	  (indent-for-tab-command)))))

;; hooks
(add-hook 'csharp-mode-hook 'linum-mode)
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(add-hook 'csharp-mode-hook 'flyspell-prog-mode)
(add-hook 'omnisharp-mode-hook (lambda ()
				 (flycheck-mode)
				 (flycheck-select-checker 'csharp-omnisharp-curl)))

;; keys
(require 'csharp-mode)
(define-key csharp-mode-map [tab] 'tab-indent-or-complete)
(define-key csharp-mode-map (kbd "C-c r") 'omnisharp-rename)
(define-key csharp-mode-map (kbd "C-c a") 'omnisharp-run-code-action-refactoring)
(define-key csharp-mode-map (kbd "C-c d") 'omnisharp-go-to-definition)
(define-key csharp-mode-map (kbd "C-c q") 'omnisharp-code-format)
(define-key csharp-mode-map (kbd "C-c i") 'helm-imenu)
(define-key csharp-mode-map (kbd "C-c f") 'omnisharp-navigate-to-solution-file)

;; Aliases
(defalias 'usages 'omnisharp-find-usages)
(defalias 'information 'omnisharp-current-type-information)
