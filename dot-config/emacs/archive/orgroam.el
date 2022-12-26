;;
;; Org Roam Setup
;;
;(setq org-roam-directory (file-truename ;"~/.config/emacs/org-roam"))

;;(org-roam-db-autosync-mode)

;; Add key-bindings
;;
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/.config/emacs/org-roam")
  (org-roam-dailies-directory "~/.config/emacs/org-roam/journal/")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "DEFT%<%Y%m%d%H%M%S>-${slug}.org" "#+Title: ${title}\n#+Date:  %U\n")
      :unnarrowed t)
   ("6" "R2 @ Columbus - 614" plain
    (file "~/.config/emacs/org-roam/templates/r2kitchens-template.org")
    :if-new (file+head "R2@614%<%Y%m%d%H%M%S>-${slug}.org" "#+Title: ${title}\n")
    :unnarrowed t)
   ("7" "R2 @ Cranberry - 724" plain
    (file "~/.config/emacs/org-roam/templates/r2kitchens-template.org")
    :if-new (file+head "R2@724%<%Y%m%d%H%M%S>-${slug}.org" "#+Title: ${title}\n")
    :unnarrowed t)
   ("l" "programming language" plain
    (file "~/.config/emacs/org-roam/templates/programming-languages-template.org")
    :if-new (file+head "PGML%<%Y%m%d%H%M%S>-${slug}.org" "#+Title: ${title}\n")
    :unnarrowed t)
   ("b" "book notes" plain
    (file "~/.config/emacs/org-roam/templates/booknoe-template.org")
    :if-new (file+head "BKNT%<%Y%m%d%H%M%S>-${slug}.org" "#+Title: ${title}\n")
    :unnarrowed t)
   ("p" "project" plain 
    (file "~/.config/emacs/org-roam/templates/project-idea-template.org")
    :if-new (file+head "PROJ%<%Y%m%d%H%M%S>-${slug}.org" "#+Title: ${title}\nCategory: ${title}\n#+Filetags: Project")
    :unnarrowed t)))
  (org-roam-dailies-capture-templates
      '(("d" "default" entry 
	 "* %<%I:%M %p>: %?"
         :if-new (file+head "%<%Y-%m-%d>.org" "#+Title: %<%Y-%m-%d>\n"))))
   :bind (("C-c n l" . org-roam-buffer-toggle)
	  ("C-c n f" . org-roam-node-find)
	  ("C-c n i" . org-roam-node-insert)
	  ("C-c n I" . org-roam-node-insert-immediate)
	  :map org-mode-map
	  ("C-M-i"   . completion-at-point)
          :map org-roam-dailies-map
          ("Y" . org-roam-dailies-capture-yesterday)
          ("T" . org-roam-dailies-capture-tomorrow))
   :bind-keymap
   ("C-c n d" . org-roam-dailies-map)
   :config
   (require 'org-roam-dailies) ;; Ensure the keymap is available
   (org-roam-db-autosync-mode)
   (org-roam-setup))

(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))
