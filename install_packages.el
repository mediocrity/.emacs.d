; http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name

; list the packages you want
(setq package-list '(
		     go-mode
		     jedi
		     auto-complete
		     epc
		     ctable
		     concurrent
		     deferred
		     jinja2-mode
		     kivy-mode
		     magit
		     git-rebase-mode
		     git-commit-mode
		     move-text
		     popup
		     rainbow-mode
		     window-numbering
		     yasnippet
		     py-autopep8
		     flymake-jshint
		     helm-pydoc
		     omnisharp
		     csharp-mode
		     ace-jump-mode
		     key-chord
		     ws-butler
		     expand-region
		     multiple-cursors
		     ))


; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
