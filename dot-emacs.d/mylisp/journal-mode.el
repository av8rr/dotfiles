(make-variable-buffer-local
 (defvar journal-count 0
   "Number of journals inserted into the current buffer."))
(make-variable-buffer-local
 (defvar current-journal-mode 1
	 "Current Journal Mode"))

(defun journal-olivetti ()
	(interactive)
	(olivetti-mode)
	(olivetti-set-width 0.65)
	(display-line-numbers-mode 01)
	(flyspell-mode)
)

(defun type-journal ()
	(interactive)
	(set-face-attribute 'default nil :font "Arial")
	(set-face-attribute 'fixed-pitch nil :font "Arial")
	(set-face-attribute 'variable-pitch nil :font "Arial") 
	(display-line-numbers-mode 0)
	(org-sidebar-tree)	
	(journal-olivetti)
	(setq current-journal-mode -1)
	)
(defun end-journal ()
	(interactive)
	(org-sidebar-tree-toggle)
	(display-line-numbers-mode 1)
	(olivetti-mode)
	(olivetti-set-width 1.0)
	(flyspell-mode)
	(org-mode)
	(setq current-journal-mode 1)
	(dolist (theme custom-enabled-themes)
		(enable-theme theme))
	)

;;;###autoload
(define-minor-mode journal-mode
  "Get your journals in the right places."
  :lighter " Journal"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c j") 'type-journal)
						(define-key map (kbd "C-c k") 'end-journal)
						(define-key map (kbd "C-c o") 'journal-olivetti)
            map)
	)

;;;###autoload
(add-hook 'text-mode-hook 'journal-mode)

(provide 'journal-mode)
