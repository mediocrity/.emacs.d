(require 'key-chord)
(key-chord-mode 1)

;; Not sure what chords are good for general use.

(key-chord-define-global "JJ" 'ace-jump-mode)
(key-chord-define-global "jj" 'ace-jump-char-mode)
(key-chord-define-global "j`" 'ace-jump-line-mode)
(key-chord-define-global "g\\" 'goto-line)
(key-chord-define-global "q\\" 'query-replace)
(key-chord-define-global "`i" 'ispell-word)
(key-chord-define-global "f\\" 'find-file)
(key-chord-define-global "s\\" 'save-buffer)
