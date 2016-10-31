; http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name

; list the packages you want
(setq package-list '(
		     ace-jump-mode
		     auto-complete
		     company
		     csharp-mode
		     expand-region
		     flycheck-rust
		     flymake-jshint
		     go-mode
		     haskell-mode
		     helm-pydoc
		     jedi
		     jinja2-mode
		     key-chord
		     kivy-mode
		     magit
		     move-text
		     multiple-cursors
		     omnisharp
		     popup
		     projectile
		     py-autopep8
		     racer
		     rainbow-mode
		     rust-mode
		     rustfmt
		     window-numbering
		     ws-butler
		     yasnippet
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
