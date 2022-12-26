;;
;; Org mode configuration
;;
;; Enable Org mode
;;
(require 'org)

;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen
(global-set-key (kbd "C-c TAB") 'org-table-create-or-convert-from-region)

;;
;; Basics
;;

;; Indent on StartUp
;;
(setq org-startup-folded nil)
(setq org-startup-indented t)

;; Support Shift Select
;;
(setq org-support-shift-select t)

;; Outline numbering as overlays
;;
(use-package org-num
 :load-path "lisp/"
 :after org
 :hook (org-mode . org-num-mode))

;; Word Wrap
;;
(add-hook 'org-mode-hook #'toggle-word-wrap)

;; Visual Line Mode
;;
(add-hook 'org-mode-hook
 (lambda ()
 (variable-pitch-mode 1)
 visual-line-mode))

;;
;; Support OrG Agenda
;;
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)

;;
;; Convert Stars into Nice Looking Bullets
;;
;; If you want even fancier bullets, add the following 4 lines after first add-hook
;; :custom
;; (org-bullets-bullet-list '("◉" "☯" "○" "☯" "✸" "☯" "✿" "☯" "✜" "☯" "◆" "☯" "▶"))
;; (org-ellipsis "⤵")
;; :hook (org-mode . org-bullets-mode))
(use-package org-bullets
 :ensure t
 :config
 (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(use-package org-superstar ;; Improved version of org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

;;Org Mode for Og files
;;
(font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; Setup bullets
;;
(setq org-hide-emphasis-markers t
      org-fontify-done-headline t
      org-hide-leading-stars t
      org-pretty-entities t
      org-odd-levels-only t)

;; Status Cycles for TODO
;;
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

;;
;; Change List Bullets
;;
(setq org-list-demote-modify-bullet
 (quote (("+" . "-")
 ("-" . "+")
 ("*" . "-")
 ("1." . "-")
 ("1)" . "-")
 ("A)" . "-")
 ("B)" . "-")
 ("a)" . "-")
 ("b)" . "-")
 ("A." . "-")
 ("B." . "-")
 ("a." . "-")
 ("b." . "-"))))

;;
;; Beautify SRC Blocks
;;
(setq-default prettify-symbols-alist '(("#+BEGIN_SRC" . "λ")
				       ("#+END_SRC" . "λ")
				       ("#+begin_src" . "λ")
				       ("#+end_src" . "λ")
				       (">=" . "≥")
				       ("=>" . "⇨")))
(setq prettify-symbols-unprettify-at-point 'right-edge)
(add-hook 'org-mode-hook 'prettify-symbols-mode)

;; Fixed Pitch for SRC Blocks
;;
(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "Source Sans Pro" :height 120 :weight light))))
 '(fixed-pitch ((t ( :family "Consolas" :slant normal :weight normal :height 0.9 :width normal)))))

;; 
;; Custom Themes
;;
(require 'color)
(set-face-attribute 'org-block nil :background
                    (color-darken-name
                     (face-attribute 'default :background) 3))

(custom-theme-set-faces
 'user
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
 '(org-block-begin-line
   ((t (:foreground "#949294" :background "#2B2A2A"))))
 '(org-block
   ((t (:background "#000000"))))
 '(org-block-end-line
   ((t (:foreground "#949294" :background "#2B2A2A")))))

;; Pretty Tags
;;
(use-package org-pretty-tags
 :demand t
 :config
 (setq org-pretty-tags-surrogate-strings
 (quote
 (("TOPIC" . "☆")
 ("PROJEKT" . "💡")
 ("SERVICE" . "✍")
 ("Blog" . "✍")
 ("music" . "♬")
 ("security" . "🔥"))))
 (org-pretty-tags-global-mode))

;; Fancy Priorities
;;
(use-package org-fancy-priorities
 :diminish
 :demand t
 :defines org-fancy-priorities-list
 :hook (org-mode . org-fancy-priorities-mode)
 :config
 (unless (char-displayable-p ?❗)
   (setq org-fancy-priorities-list '("HIGH" "MID" "LOW" "OPTIONAL"))))

;;
;; Orgmode LaTex Setup
;;
(require 'ox-latex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" .
		"\\section*{%s}")))
