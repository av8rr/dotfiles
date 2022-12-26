(make-variable-buffer-local)

(defun start-mymail ()
	(interactive)
	(display-line-numbers-mode 1)
	(flyspell-mode)
	(setq mu4e-compose-mode 1)
	)

;;;###autoload
(define-minor-mode mymail-mode
  "Get your mail in the right places."
  :lighter " MyMail"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c j") 'type-journal)
						(define-key map (kbd "C-c k") 'end-journal)
						(define-key map (kbd "C-c o") 'journal-olivetti)
            map)
	)

;;;###autoload
(add-hook 'text-mode-hook 'mymail-mode)

(provide 'mymail-mode)
