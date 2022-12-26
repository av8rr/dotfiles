;; -*- lexical-binding: t; -*-
;; -*- mode: elisp -*-

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
													("elpa" . "https://elpa.gnu.org/packages/")
													("mu4e" . "~/.emacs.d/elpa/mu4e")
													)
			)

(package-initialize)

(unless package-archive-contents
	(package-refresh-contents))
(package-install-selected-packages)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(set-face-attribute 'default nil :font "Ubuntu Mono")
(set-face-attribute 'fixed-pitch nil :font "SourceCodePro")
(set-face-attribute 'variable-pitch nil :font "Times New Roman") 


(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'av8rr-darkmoon t)

;; (use-package doom-themes
;;  :ensure t)
;; (setq doom-themes-enable-bold t
;;      doom-themes-enable-italic t)
;; (load-theme 'doom-city-lights t)	


;;
;; Use Doom Modeline
;;
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :hook (after-init . doom-modeline-mode)
  :custom    
  (doom-modeline-height 25)
  (doom-modeline-bar-width 1)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project)
  (doom-modeline-buffer-state-icon t)
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-minor-modes nil)
  (doom-modeline-enable-word-count t)
  (doom-modeline-buffer-encoding t)
  (doom-modeline-indent-info nil)
  (doom-modeline-checker-simple-format t)
  (doom-modeline-vcs-max-length 12)
  (doom-modeline-env-version t)
  (doom-modeline-irc-stylize 'identity)
  (doom-modeline-github-timer nil)
  (doom-modeline-gnus-timer nil)
	)

	(menu-bar-mode -1) ; Disable the menu bar
	(tool-bar-mode -1); Disable the toolbar
	(scroll-bar-mode -1); Disable the scrollbar
	(tooltip-mode -1); Disable tooltips
	(set-fringe-mode 10) ; Give some breathing room
	(setq blink-cursor-mode nil) ; Stop cursor from blinking

	;; Disable the splash screen (to enable it again, replace the t with 0)
	;; (setq inhibit-slash-screen t)
	(setq inhibit-startup-message t)        ; Disable startup message 

	(global-visual-line-mode 1)
	(setq line-spacing '0.25)

	;; Change prompt from 'yes' or 'no' to 'y' or 'n'
	(set 'yes-or-no-p 'y-or-n-p)

	(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
	(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
	(global-set-key (kbd "S-C-<down>") 'shrink-window)
	(global-set-key (kbd "S-C-<up>") 'enlarge-window)

	(setq x-select-enable-clipboard t)
	(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

	;; Set text centered and wrapped
	(setq visual-fill-column-width 120)
	(setq visual-fill-column-center-text t)

	;; Give a little bit of whitespace around the edges of emacs. Delete this line if you
	;; don't care for it.
	(set-frame-parameter nil 'internal-border-width 10)

	(require 'key-chord)
	(key-chord-mode 1)

	(defun redisplay-command ()
		(interactive)
		(redisplay)
		)

	(global-set-key [f5] #'redisplay-command)
	(load-file "~/.emacs.d/mylisp/journal-mode.el")

;;
;; Enable transient mark mode
;;
(transient-mark-mode 1)

;;
;; Setup Line Numbers
;;
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; 
;; Split windows vertically
;;
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;;
;; Resize split windows
;;
(defun reduce-other-window-width ()
  "Expand current window to use 25% more of the other window's columns."
  (interactive)
  (enlarge-window-horizontally (/ (window-width (next-window)) 4)))

;;
;; Set Scroll Up and Scroll Down key bindings
;;   S-Space : Scroll Up
;;   M-Space : Scroll Down
;; Set the screen sizing
;;
(global-set-key (kbd "S-SPC") 'scroll-up-command)
(global-set-key (kbd "M-SPC") 'scroll-down-command)
(global-set-key (kbd "C-c v") 'reduce-other-window-width)

;;
;; Bufer Setup
;;
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

(defun run-buffer ()
  (interactive)
  (shell-command "xmodmap /home/av8rr/.Xmodmap >& /dev/null"))
(global-set-key (kbd "C-<escape>") 'run-buffer)

;;
;; Paren mode matches parens
;;
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)

;;
; Enable beacon mode to highlight the cursor position
;;
(beacon-mode 1) 
(setq beacon-color "#a30098") ; Medium Magenta
(setq beacon-blink-when-buffer-changes t)
(setq beacon-blink-duration 0.7)
(setq beacon-blink-wen-focued t)
(setq beacon-size 80)

;;
;; comments
;;
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

;;
;; yay rainbows!
;;
;;(global-rainbow-delimiters-mode t)

;;
(require 'neotree)
(global-set-key [f9] 'neotree-toggle)

(add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; Tab width to preference
(setq tab-width 3) ; or any other preferred value
(setq-default tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width) 

;;; Tab Stops
(setq tab-stop-list (number-sequence 4 120 4)) ; Tab stop every 4th column

; 
;; Start (Uncomment)/Stop (Comment-out) Auto Indenting
;;

(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

(use-package ace-window
	:ensure t
	:bind 
	("M-o" . ace-window)
	:delight
	:config 
	(ace-window-display-mode 1)
	(custom-set-faces
	 '(aw-leading-char-face
		 ((t (:inherit ace-jump-face0forward :foreground "#ff00ff" :height 2.0)))))
	)

;; 
;; Specify completin frameworks to use
;;

(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(global-set-key (kbd "M-x") 'helm-M-x)

;; increase and decrease text size
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;; First, Control-S is an ASCII control character -- ^s and ^S are the same character.
;; Keys are something different from characters, however, and if you are using Emacs with a window manager then you can distinguish the keys C-s and C-S-s. The latter is Control-Shift-s.
;; The problem you are hitting is that if you do not explicitly bind the shifted version of a letter key, then the shifted letter key uses the binding of the unshifted key. This is a "feature".
;; So you need to bind both C-s and C-S-s.
;;(global-unset-key (kbd "C-s"))
;; (global-unset-key (kbd "C-S-s"))
;;(global-set-key (kbd "C-s") 'save-buffer)
;; (global-set-key (kbd "C-S-s") 'another-command)


(setq helm-buffers-fuzzy-matching t
			helm-recentf-fuzzy-match    t)
(setq recentf-max-menu-items 1000)
(setq helm-minibuffer-history-key "M-p")

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z


(setq helm-split-window-in-side-p          -1 ; t ; open helm buffer inside current window, not occupy whole other window
			helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
			helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
			helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
			helm-ff-file-name-history-use-recentf t)
(ivy-mode 1)
(helm-mode nil)

(use-package company
	:ensure t)

(defvar emacs-tmp-dir "~/.emacs.d/bu/") ; name of the backup directory
(defun make-backup-file-name (FILE)                                             
  (let  ((dirname (concat emacs-tmp-dir "")))
    (if (not (file-exists-p dirname))                                           
       	(make-directory dirname t))                                             
    (concat dirname (file-name-nondirectory FILE))))

(setq make-backup-files t)      ; enable backups
(setq backup-by-copying t)      ; method used to create the backup is a copy
(setq version-control t)        ; enable version control of backups
(setq delete-old-versions t)    ; if there are too many, delete old versions
(setq kept-new-versions 10)     ; keep 10 versions before deleting old versions
(setq backup-directory-alist `((".*" . ,emacs-tmp-dir)))  ; location of the backup dir

(setq auto-save-list-file-prefix
      (concat emacs-tmp-dir ".auto-saves-"))  ; auto save name
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))             ; which files to autosave and where

(setq vc-follow-symlinks nil)

(require 'calendar)
(defun calendar-insert-date ()
  "Capture the date at point, exit the Calendar, insert the date."
  (interactive)
  (seq-let (day month year) (save-match-data (calendar-cursor-to-date))
    (calendar-exit)
    (insert (format "%02d/%02d/%d" day month year))))

(define-key calendar-mode-map (kbd "\C-c i") 'calendar-insert-date)

(load-file "~/.emacs.d/mylisp/journal-mode.el")

(defun toggle-window-transparency ()
   "Cycle the frame transparency from default to transparent."
   (interactive)
   (let ((transparency 90)
         (opacity 100))
     (if (and (not (eq (frame-parameter nil 'alpha) nil))
              (< (frame-parameter nil 'alpha) opacity))
         (set-frame-parameter nil 'alpha opacity)
       (set-frame-parameter nil 'alpha transparency))))
;turn on transparency by default
(add-hook 'after-init-hook 'toggle-window-transparency)
;theme loads deferred through cycle-theme config
;default theme in cycle-themes init (and customizations.el)

(use-package undo-tree
  :init
  (global-undo-tree-mode 1))

(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/bu/")))

(use-package evil
  :ensure t  ;; install evil if not installed
  :init      ;; tweal evil's configuration before loading it
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default
  (setq evil-want-keybinding nil)
	(setq evil-want-C-i-jump nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
	(setq evil-undo-system 'undo-tree)
	(evil-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)


(defun evil-org-insert-state-in-edit-buffer (fun &rest args)
  "Bind `evil-default-state' to `insert' before calling FUN with ARGS."
  (let ((evil-default-state 'insert)
				;; Force insert state
				evil-emacs-state-modes
				evil-normal-state-modes
				evil-motion-state-modes
				evil-visual-state-modes
				evil-operator-state-modes
				evil-replace-state-modes)
    (apply fun args)
    (evil-refresh-cursor)))

  (advice-add 'org-babel-do-key-sequence-in-edit-buffer
	      :around #'evil-org-insert-state-in-edit-buffer)

  ;; Use keychord to press 'jj' to go into Normal mode after editing - this prevets you from pressing the ESC key
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

(use-package evil-leader ; ----------------------------------- Set your VIM leader key
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>") ; ------------------------- Spacebar as leader key
  (evil-leader/set-key
    "f" 'helm-find-files
    "b" 'helm-mini
    "w" 'persp-switch
    "-" 'text-scale-decrease
    "+" 'text-scale-increase
    "d" 'neotree-toggle
    "x" 'helm-M-x
    "r" 'helm-M-x
    "k" 'kill-buffer
   ))

 ;; leader maps for org mode
  (evil-leader/set-key-for-mode 'org-mode
    "t"  'org-show-todo-tree
    "a"  'org-agenda
    "c"  'org-archive-subtree
    "l"  'evil-org-open-links
    "o"  'org-open-at-point
    "e"  'show-branches
    )

(use-package xclip 
	:ensure t 
	:config
	(xclip-mode 1)
	)

(use-package dired
		:ensure nil
		:commands (dired dired-jump)
		:bind (("C-x C-j" . dired-jump))
		:custom ((dired-listing-switches "-agho --group-directories-first"))
		:config
		(evil-collection-define-key 'normal 'dired-mode-map
			"h" 'dired-single-up-directory
			"l" 'dired-single-buffer))

(use-package dired-single)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package all-the-icons-dired
	 :hook (dired-mode . treemacs-icons-dired-mode)
	;; :hook (dired-mode . all-the-icons-dired-mode)
	:config (setq all-the-icons-dired-monochrome nil))

;; Enable trash can
(setq delete-by-moving-to-trash t)

(use-package dired-open
		:config
		;; Doesn't work as expected!
		;; (add-to-list 'dired-open-functions #'dired-open-xdg t)
		(setq dired-open-extensions '(
																	("htm" . "nyxt")
																	("html" . "nyxt")
																	("odt" . "soffice")
																	("ods" . "soffice")
																	("docx" . "soffice")
																	("xls" . "soffice")
																	("xlsx" . "soffice")
																	("csv" . "soffice")
																	("pptx" . "soffice")
																	("png" . "sxiv")
																	("gif" . "sxiv")
																	("jpg" . "sxiv")
																	("jpeg" . "sxiv")
																	("svg" . "inkscape")
																	("xcf" . "gimp")
																	("mkv" . "mpv")
																	("mp4" . "mpv")
																	("pdf" . "/usr/bin/zathura")
																	("ps" . "/usr/bin/zathura")
																	)
					)
		)

(use-package dired-hide-dotfiles
	:hook (dired-mode . dired-hide-dotfiles-mode)
	:config
	(evil-collection-define-key 'normal 'dired-mode-map
		"H" 'dired-hide-dotfiles-mode))

;; 	;;(load-file "~/.emacs.d/mylisp/image-dired.el")

(use-package swiper
	:ensure t
	:bind ("\C-s" . swiper)
	)

(setq ispell-program-name "/usr/bin/hunspell")
(setq ispell-personal-dictionary "/home/av8rr/.config/dict/standard.dic")
(setq ispell-hunspell-dict-paths '("/home/av8rr/.config/dict"))

(define-key ctl-x-map "\C-i"
  #'endless/ispell-word-then-abbrev)

(defun endless/simple-get-word ()
  (car-safe (save-excursion (ispell-get-word nil))))

(defun endless/ispell-word-then-abbrev (p)
  "Call `ispell-word', then create an abbrev for it.
With prefix P, create local abbrev. Otherwise it will
be global.
If there's nothing wrong with the word at point, keep
looking for a typo until the beginning of buffer. You can
skip typos you don't want to fix with `SPC', and you can
abort completely with `C-g'."
  (interactive "P")
  (let (bef aft)
    (save-excursion
      (while (if (setq bef (endless/simple-get-word))
                 ;; Word was corrected or used quit.
                 (if (ispell-word nil 'quiet)
                     nil ; End the loop.
                   ;; Also end if we reach `bob'.
                   (not (bobp)))
               ;; If there's no word at point, keep looking
               ;; until `bob'.
               (not (bobp)))
        (backward-word)
        (backward-char))
      (setq aft (endless/simple-get-word)))
    (if (and aft bef (not (equal aft bef)))
        (let ((aft (downcase aft))
              (bef (downcase bef)))
          (define-abbrev
            (if p local-abbrev-table global-abbrev-table)
            bef aft)
          (message "\"%s\" now expands to \"%s\" %sally"
                   bef aft (if p "loc" "glob")))
      (user-error "No typo at or before point"))))

(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)

(require 'which-key)
(which-key-mode)

(use-package yasnippet
  :config
  (setq yas-snippet-dirs '("~/.config/emacs/yasnippets"))
  (yas-global-mode 1))

	(let ((bookmarkplus-dir "~/.emacs.d/custom/bookmark+/")
	             (emacswiki-base "https://www.emacswiki.org/emacs/download/")
	             (bookmark-files '("bookmark+.el" "bookmark+-mac.el" "bookmark+-key.el" "bookmark+-lit.el" "bookmark+-doc.el")))
	         (require 'url)
	         (add-to-list 'load-path bookmarkplus-dir)
	         (make-directory bookmarkplus-dir t)
	         (mapcar (lambda (arg)
	                   (let ((local-file (concat bookmarkplus-dir arg)))
	                     (unless (file-exists-p local-file)
	                       (url-copy-file (concat emacswiki-base arg) local-file t))))
	                   bookmark-files)
	         (byte-recompile-directory bookmarkplus-dir 0)
	         (require 'bookmark+))

(load-file "$HOME/dotfiles/dot-emacs.d/elpa/gnugol.el")

(defalias 'insert-string 'insert)
(global-set-key (kbd "C-c s") 'gnugol)

(use-package pdf-tools
	:ensure t
	:config
	(pdf-tools-install)
	 )

;; (use-package org-pdfview	
;; 	:ensure t)

(global-set-key (kbd "C-c nn") 'org-noter)
(global-set-key (kbd "C-c nq") 'org-noter-kill-session)

(require 'org)
(require 'evil-org)
(require 'evil-leader)

;; Make Org mode work with files ending in .org
;;
;;Org Mode for Org files
;;
(font-lock-add-keywords 'org-mode
			'(("^ *\\([-]\\) "
			   (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

;;
;; Begin Org Indet Mode
;;
(org-indent-mode)

(setq org-src-preserve-indentation t)
(setq org-adapt-indentation nil)
 
;; Indent on StartUp
;;
(setq org-startup-folded t)
(setq org-startup-indented t)

;; Set TAB Behavior
;;
(add-hook 'org-tab-first-hook
	  (lambda ()
	    (when (org-in-src-block-p t)
	      (let* ((elt (org-element-at-point))
		     (lang (intern (org-element-property :language elt)))
		     (langs org-babel-load-languages))
		(unless (alist-get lang langs)
		  (insert (make-string 4 ?\s)))))))

(setq org-src-tab-acts-natively t)

(define-key org-mode-map (kbd "C-c TAB") 'org-cycle-list-bullet)
(global-set-key (kbd "C-c C-x r") 'org-clock-report)

;; 
;; Support Shift Select
;;
(setq org-support-shift-select t)

;; 
;; Outline numbering as overlays
;;
;;use-package org-num
;; :load-path "~/.config/emacs/org-roam/lisp/"
;; :after org
;; :hook (org-mode . org-num-mode))

;; 
;; Word Wrap
;;
(add-hook 'org-mode-hook #'toggle-word-wrap)

;;
;; Visual Line Mode
;;
(add-hook 'org-mode-hook
	  (lambda ()
	    (variable-pitch-mode 0)))
;;	    visual-line-mode))

;; 
;; Support Headline Folding
;;
(setq org-ellipsis "  ▾"
      org-hide-emphasis-markers t)
(set-face-underline 'org-ellipsis nil)

;;
;; Setup bullets
;;
(setq org-hide-emphasis-markers t
      org-fontify-done-headline t
      org-hide-leading-stars t
      org-pretty-entities t)

;;
;; Convert Stars into Nice Looking Bullets
;;
(use-package org-bullets
  :ensure t
  :custom
  (org-bullets-bullet-list '("◉" "☯" "○" "☯" "✸" "☯" "✿" "☯" "✜" "☯" "◆" "☯" "▶"))
  :hook (org-mode . org-bullets-mode)
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

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
;; Setup Variable Fonts
;;
(dolist (face 
	 '((org-level-1 . 1.2)
	   (org-level-2 . 1.1)
	   (org-level-3 . 1.1)
	   (org-level-4 . 1.0)
	   (org-level-5 . 1.0))))
;;  (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

;;
;; Beautify SRC Blocks
;;
(setq-default prettify-symbols-alist 
							'(
								("#+BEGIN_SRC" . "λ")
								("#+END_SRC" . "λ")
								("#+begin_src" . "λ")
								("#+end_src" . "λ")
								("#+BEGIN_QUOTE" . "")
								("#+END_QUOTE" . "")
								("#+BEGIN: clocktable" . "")
								("#+END:" . "")
								(">=" . "≥")
								("=>" . "⇨")
								)
							)

(setq prettify-symbols-unprettify-at-point 'right-edge)
(add-hook 'org-mode-hook 'prettify-symbols-mode)

;; Allow inline images for Org Mode
(setq org-startup-with-inline-images t); Inline images
(org-toggle-inline-images)

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

;;
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
;; Org Babel and Source Blocks
;;
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
	 (shell . t)
	 (css . t))
 )

(setq org-confirm-babel-evaluate nil)

(require 'org-tempo)

;;(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
;;(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))

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

;; Default applications for org
(add-to-list 'org-file-apps '("\\.pdf" . "zathura %s"))

;; The following code adds a hook to auto-tangle this file.
(defun rdr/tangle-on-save-org-mode-file()
	(when (string-equal (buffer-file-name)
											(expand-file-name "/rdr/projects/linux/emacs/config.org"))
		;; dynamic scoping
		(let ((org-confirm-babel-evaluate nil))
			(org-babel-tangle))
		)
	)

;; This was added to auto tangle code
;; This may not work properly.
(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook  'rdr/tangle-on-save-org-mode-file)))

;; Make sure sertain tags are not inherited
(setq org-tags-exclude-from-inheritance '("Project"))

(use-package org-auto-tangle
	:defer t
	:hook (org-mode . org-auto-tangle-mode)
	:config
	(setq org-auto-tangle-default t)
)


;;(add-hook 'org-mode-hook 'org-auto-tangle-mode)

(use-package auctex
	:ensure t
	:defer t
	:hook (LaTeX-mode .
										(lambda ()
											(push (list 'output-pdf "Zathura")
														(TeX-view-program-selection)))))

(with-eval-after-load 'ox-latex
	(add-to-list 'org-latex-classes
							 '("org-moderncv"
								 "\\documentclass{moderncv}"
								 ("\\section{%s}" . "\\section*{%s}")
								 ("\\subsection{%s}" . "\\subsection*{%s}")
								 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
								 ("\\paragraph{%s}" . "\\paragraph*{%s}")
								 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(setq org-latex-listings 't)

;;
;; Support Org Agenda
;;
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-c C-c" 'org-capture-finalize)

(setq org-agenda-start-with-log-mode t)
(setq org-log-done 'time)
(setq org-log-into-drawer t)
(setq org-agenda-span '5)
(setq org-treat-insert-todo-headings-as-state-change t)
(setq org-todo-repeat-to-state "TODO")
(setq org-treat-S-cursor-todo-selection-as-state-change t)

(setq org-agenda-notes-dir "/rdr/personal/notes/")
(setq org-agenda-journal-dir (concat org-agenda-notes-dir "journal/"))
(setq org-templates-directory "~/.config/emacs/org/templates/")

(setq org-columns-default-format "%45ITEM %TODO %PRIORITY %SCHEDULED %TAGS %CLOSED")

;;
;; Setup Notes Filenames
;;
(setq notes-filename (concat org-agenda-notes-dir "notes.org"))
(setq personal-filename (concat org-agenda-notes-dir "personal.org"))
(setq journal-filename (concat org-agenda-journal-dir "journal.org"))
(setq habits-filename (concat org-agenda-journal-dir "habits.org"))
(setq r2-filename (concat org-agenda-notes-dir "R2.org"))
(setq av8rr-notes-filename (concat org-agenda-notes-dir "av8rr-notes.org"))
(setq av8rr-oxy-filename (concat org-agenda-notes-dir "av8rr-oxy.org"))
(setq av8rr-oxy-projects-filename (concat org-agenda-notes-dir "av8rr-oxy-projects.org"))
			
;;
;; Set up templates
;;
(setq av8rr-oxy-template (concat org-templates-directory "av8rr-template.org"))
(setq av8rr-oxy-projects-template (concat org-templates-directory "av8rr-projects-template.org"))

(setq org-agenda-files (append (list
												notes-filename
												personal-filename
												journal-filename
												habits-filename
												r2-filename
												av8rr-notes-filename
												av8rr-oxy-filename
												av8rr-oxy-projects-filename)
															 (file-expand-wildcards "/rdr/personal/notes/*-PROJ-*"))
			)

(setq org-capture-templates
			`(
				("q" "Quick Note" entry (file notes-filename)
				 "* %U \n\n %?\n\n%a\n %i\n" :empty-lines 1)
				("t" "Task" entry (file tasks-filename)
				 "* TODO  %?\nSCHEDULED: %^T\n%i\n" :empty-lines 1)
				("i" "Idea" entry (file ideas-filename)
				 "* IDEAS  %? %^G \n\n  %U\n  %a\n  %i\n\n" :empty-lines 1)
				("p" "Personal File" entry (file+datetree+prompt personal-filename)
				 "* %U  %? %^G \n\n %i\n\n %a\n" :tree-type day :empty-lines 1)
				("j" "Journal File" entry (file+datetree+prompt journal-filename)
				 "* %U  %? %^G \n\n%i" :tree-type day :empty-lines 1)
				("h" "Habit" entry (file habits-filename)
				 "* TODO %? %^G\n:PROPERTIES:\n:STYLE: habit\n:END:\n\n" :empty-lines 1)
				("r" "R2 Kitchens")
				("r2" "R2 Kitchens Organization" entry (file+datetree+prompt r2-filename)
				 "* %U  %? %^G \n\n %i\n %a\n" :tree-type day :empty-lines 1) 
				("a" "AV8RR")
				("ag" "General")
				("agn" "Notes" entry (file+datetree+prompt av8rr-notes-filename)
				 "* %U \n\n %?\n\n%a\n %i\n" :empty-lines 1)
				("ao" "Oxy")
				("aos" "Status" entry (file+datetree+prompt av8rr-oxy-filename)
				 (file, av8rr-oxy-template))
				("aop" "Project" entry (file av8rr-oxy-projects-filename)
				 (file, av8rr-oxy-projects-template))
				)
			)

(define-key org-mode-map (kbd "C-S-h") 'org-shiftleft)
(define-key org-mode-map (kbd "C-S-l") 'org-shiftright)

(setq org-todo-keywords
      '(
				(sequence "TODO(t!)" "ACTIVE(a)" "|" "DONE(d!)" "ON HOLD(h@/!)")
				(sequence "IDEAS(i)" "SCHEDULED(s)" "IN PROGRESS(p)" "|" "COMPLETE(c!)" "WAIT(w@/!)" "CANCEL(x@)")
				)
			)
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "red")) 
				("ACTIVE" . (:foreground "green"))
				("DONE" . (:foreground "grey"))
				("ON HOLD" . (:foreground "yellow"))
				("IDEAS" . (:foreground "magenta"))
				("SCHEDULED" . (:foreground "red"))
				("IN PROGRESS" . (:foreground "green"))
				("COMPLETE" . (:foreground "grey"))
				("WAIT" . (:foreground "yellow"))
        ("CANCEL" . (:foreground "blue" :weight bold)))
			)

(setq todo-action-head "To Dos:")
(setq ideas-action-head "Next Actions:")
(setq plan-action-head "Planning Phase:")
(setq active-action-head "Active / In Process:")
(setq waiting-head  "On Hold / Waiting:")
(setq complete-head "Completed Items / Cancelled:")

(setq 
 org-agenda-custom-commands 
 '(
   ("n" "Agenda and all TODOs" 
		(
		 (agenda "" nil) 
		 (alltodo "" nil)) 
		nil)
   ("g" "GTD View"
    (
		 (agenda ""       ((org-deadline-warning-days 7)) )
		 (todo "TODO"     ((org-agenda-overriding-header todo-action-head)))
		 (todo "IDEAS"    ((org-agenda-overriding-header ideas-action-head)))
		 (todo "PLAN"     ((org-agenda-overriding-header plan-action-head)))
		 (todo "ACTIVE"   ((org-agenda-overriding-header active-action-head)))
		 (todo "WAIT"     ((org-agenda-overriding-header waiting-head)))
		 (todo "COMPLETE" ((org-agenda-overriding-header complete-head)))
		 nil)
    )
   )
 )

(add-to-list 'org-agenda-custom-commands
             '("W" "Weekly review"
               agenda ""
               ((org-agenda-start-day "-14d")
                (org-agenda-span 28)
								(org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp))
								(org-agenda-start-on-weekday 1))))

;;
;; Habit Tracker
;; 
;; Setup habit tracker with Org-mode
(add-to-list 'org-modules 'org-habit t)
(require 'org-habit)
(setq org-habit-show-habits-only-for-today t)
(setq org-habit-graph-column 60)
(setq org-habit-today-glyph ?‖)
(setq org-habit-completed-glyph ?✓)


(custom-set-variables
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-doi ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(org-pretty-tags-agenda-unpretty-habits nil))

(setq org-archive-location "archive/%s_archive::")

(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

(setq org-roam-completion-system 'ivy)

(add-to-list 'load-path "~/.emacs.d/private")
(load-library "org-roam-ui")

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "/rdr/personal/notes")
  (org-roam-dailies-directory "/rdr/personal/notes/journal")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(
     ("d" "default" plain
      "* %?"
      :if-new (file+head "DEFT%<%Y%m%d%H%M%S>-${slug}.org" "#+Title: ${title}\n#+Date:  %U\n\n")
      :unnarrowed t)
		 ("a" "AV8RR")
		 ("ao" "Oxy" plain
      "* %U  %^GProject:\n\n%?\n%a"
      :if-new (file+head "AV8RR-OXY-PROJ-%<%Y%m%d%H%M%S>${slug}.org" "#+Title: ${title}\n\n")
      :unnarrowed t)
     ("n" "Note" plain 
      "* %?"
      :if-new (file+head "NOTE%<%Y%m%d%H%M%S>-${slug}.org" "#+Title: ${title}\nCategory: ${title}\n")
      :unnarrowed t)
     ("p" "project" plain 
      (file "~/.config/emacs/org/templates/project-idea-template.org")
      :if-new (file+head "PROJ%<%Y%m%d%H%M%S>-${slug}.org" "#+Title: ${title}\nCategory: ${title}\n#+Filetags: Project")
      :unnarrowed t)
		 ("r" "R2")
		 ("r2" "R2 Kitchens" plain
      (file "~/.config/emacs/org-roam/templates/r2kitchens-template.org")
      :if-new (file+head "R2%<%Y%m%d%H%M%S>-${slug}.org" "#+Title: ${title}\nCategory: ${title}\n\n")
      :unnarrowed t)
 		 ("r6" "R2 Kitchens Ohio" plain
      (file "~/.config/emacs/org-roam/templates/r2kitchens-template.org")
      :if-new (file+head "R2@614%<%Y%m%d%H%M%S>-${slug}.org" "#+Title: ${title}\nCategory: ${title}\n\n")
      :unnarrowed t)
 		 ("r7" "R2 Kitchens Pennsylvania" plain
      (file "~/.config/emacs/org-roam/templates/r2kitchens-template.org")
      :if-new (file+head "R2@724%<%Y%m%d%H%M%S>-${slug}.org" "#+Title: ${title}\nCategory: ${title}\n\n")
      :unnarrowed t)
		 )
	 )

	(org-roam-dailies-capture-templates
   (let ((head
          (concat
           "#+title: %<%A, %d %B %Y>\nCategory: ${title}\n#+roam_tags: Dailies\n* Inbox\n* Journal\n"
           "* [/] Tasks\n\n")))
     `(("d" "default" entry
        "* %?"
        :if-new (file+head+olp "/rdr/personal/notes/journal/JRNL%<%Y-%m-%d>.org" ,head ("Inbox"))
        :unnarrowed t)
       ("j" "journal" entry
        "* %U: %?"
        :if-new (file+head+olp "/rdr/personal/notes/journal/JRNL%<%Y-%m-%d>.org" ,head ("Journal"))
				:unnarrowed t)
       ("t" "Tasks" item
        "[ ] %^{Task: }"
        :if-new (file+head+olp "/rdr/personal/notes/journal/JRNL%<%Y-%m-%d>.org" ,head ("Tasks"))
        :immediate-finish t :unnarrowed t)
       )))
	;;  (org-roam-dailies-capture-templates
	;;   '(
	;;		 ("d" "default" entry 
	;;      "* %<%I:%M %p>: %?" 
	;;      :if-new (file+head "%<%Y-%m-%d>.org" "#+Title: %<%Y-%m-%d>\n")
	;;      :unnarrowed t)
	;;		 ("j" "journal entry" entry 
	;;			"* %<%I:%M %p>: %?" 
	;;			:if-new (file+head "JRNL%<%Y%m%d>.org" "#+Title: %<%Y-%m-%d>\n")
	;;			:unnarrowed t)
	;;		 )
	;;	 )
	;;
  :bind (
				 ("\C-cnc" . org-roam-capture)
         ("\C-cnl" . org-roam-buffer-toggle)
         ("\C-cnf" . org-roam-node-find)
         ("\C-cng" . org-roam-graph)
         ("\C-cni" . org-roam-node-insert)
         ("\C-cnI" . org-roam-node-insert-immediate)
         :map org-mode-map
         ("\C-ci"   . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow)
         )
  :bind-keymap ("\C-cnd" . org-roam-dailies-map)
																				; \C-c n d Y (org-roam-dailies-capture-yesterday) - 89
																				; \C-c n d n (org-roam-dailies-capture-today) - 110
																				; \C-c n d T (org-roam-dailies-capture-tomorrow) - 84
																				; \C-c n d v (org-roam-dailies-capture-date) - 118 
																				; \C-c n d . (org-roam-dailies-find-directory) - 46
																				; \C-c n d c (org-roam-dailies-goto-date) - 99
																				; \C-c n d b (org-roam-dailies-goto-previous-note) - 98
																				; \C-c n d f (org-roam-dailies-goto-next-note) - 102
																				; \C-c n d y (org-roam-dailies-goto-yesterday) - 121
																				; \C-c n d d (org-roam-dailies-goto-today)) - 100 
																				; \C-c n d t (org-roam-dailies-goto-tomorrow) - 116
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode)
  (org-roam-setup)
	)

(global-set-key (kbd "<f8>") 'org-tree-slide-mode)
(global-set-key (kbd "<XF86AudioPlay>") 'org-tree-slide-mode)
(global-set-key (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)
(global-set-key (kbd "S-<XF86AudioPlay>") 'org-tree-slide-skip-done-toggle)
(define-key org-mode-map (kbd "<f8>") 'org-tree-slide-mode)
(define-key org-mode-map (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)

(use-package org-tree-slide
  :custom
  (org-tree-slide-slide-in-effect t)
  (org-tree-slide-activate-message "Presentation started!")
  (org-tree-slide-deactivate-message "Presentation finished!")
  (org-tree-slide-header t)
  (org-tree-slide-breadcrumbs " > ")
  (org-tree-slide-skip-outline-level 0)
  (org-image-actual-width nil))

(require 'ox-publish)
;; M-: (org-publish "project name" t)  <== use this to force publish all files
(setq org-publish-project-alist
      '(
				("av8rrhome"
				 :base-directory "/rdr/projects/av8rr"
				 :base-extension "org"
				 :publishing-directory "/rdr/projects/prod/public_html_av8rr/"
				 :publishing-directory "/rdr/projects/av8rr/public_html/"
				 :publishing-function org-html-publish-to-html
				 :recursive t
				 :headline-levels 4             ; Just the default for this project.
				 :auto-preamble t
				 )
				("css"
				 :base-directory "/rdr/projects/av8rr/css/"
				 :base-extension "css"
				 :publishing-directory "/rdr/projects/prod/public_html_av8rr/css/"
				 :publishing-directory "/rdr/projects/av8rr/public_html/css/"
				 :publishing-function org-publish-attachment
				 :recursive t
				 :auto-preamble t
				 )

				("images"
				 :base-directory "/rdr/projects/av8rr/img/"
				 :base-extension "jpg\\|png"
				 :publishing-directory "/rdr/projects/prod/public_html_av8rr/img/"
				 :publishing-directory "/rdr/projects/av8rr/public_html/img/"
				 :publishing-function org-publish-attachment
				 :recursive t
				 :auto-preamble t
				 )
				("src"
				 :base-directory "/rdr/projects/av8rr/src/"
				 :base-extension "css\\|js\\|setup"
				 :publishing-directory "/rdr/projects/prod/public_html_av8rr/src/"
				 :publishing-directory "/rdr/projects/av8rr/public_html/src/"
				 :publishing-function org-publish-attachment
				 :recursive t
				 :auto-preamble t
				 )
				("AV8RR-Site" :components("src" "css" "images" "av8rrhome"))
				)
			)


(global-set-key "\C-cpa" 'org-publish-all)
(global-set-key "\C-cpc" 'org-publish-current-project)
(global-set-key "\C-cpp" 'org-publish-project)

(use-package projectile
	:ensure t
	:config
	(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
	(projectile-mode +1))

(use-package dashboard
	:ensure t
	:config
	(dashboard-setup-startup-hook)
	(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
	;;	(setq dashboard-startup-banner "/rdr/Pictures/misc/ironman-1.png")
	(setq dashboard-startup-banner "/rdr/projects/av8rr/img/av8rr-logo.png")
	;; Content is not centered by default. To center, set
	(setq dashboard-center-content t)

	;; To disable shortcut "jump" indicators for each section, set
	(setq dashboard-show-shortcuts t)
	(setq dashboard-items '((recents  . 3)
													(bookmarks . 5)
													(projects . 2)
													(agenda . 5)
													(registers . 3)))

	(setq dashboard-item-names '(("Recent Files:" . "Recently opened files:")
															 ("Agenda for today:" . "Today's agenda:")
															 ("Agenda for the coming week:" . "Agenda:")))
	(setq dashboard-set-heading-icons t)
	(setq dashboard-set-file-icons t)
	(setq dashboard-footer-messages '("Dashboard is pretty cool!")))

;; Remap Open Dashboard
(defun new-dashboard ()
  "Jump to the dashboard buffer, if doesn't exists create one."
  (interactive)
  (switch-to-buffer dashboard-buffer-name)
  (dashboard-mode)
  (dashboard-insert-startupify-lists)
  (dashboard-refresh-buffer))

(global-set-key (kbd "C-<f1>") 'new-dashboard)

(use-package magit
	:ensure t)
(setq magit-refresh-status-buffer nil)

(global-set-key (kbd "C-c m") 'magit)

(add-to-list 'load-path "~/.config/mu4e")
(require 'mu4e)
(require 'smtpmail)
(setq mail-user-agent 'mu4e-user-agent)

(setq mu4e-get-mail-command "mbsync -c ~/.config/mu4e/.mbsyncrc -a"
      mu4e-maildir (expand-file-name "~/av8rr-mail")
      mu4e-update-interval 180
      message-kill-buffer-on-exit t
      mu4e-headers-skip-duplicates t
      mu4e-compose-signature-auto-include nil
      mu4e-view-show-images t
      mu4e-view-show-addresses t
      mu4e-attachment-dir "~/Downloads"
      mu4e-use-fancy-chars t
      mu4e-headers-auto-update t
      message-signature-file "~/av8rr-mail/.signature"
      mu4e-compose-signature-auto-include nil
      mu4e-view-prefer-html t
      mu4e-compose-in-new-frame t
      mu4e-change-filenames-when-moving t
      message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-stream-type 'starttls
      ;;mu4e-html2text-command "w3m -T text/html"
      )

(setq mu4e-context-policy 'pick-first)
(setq mu4e-compose-context-policy 'always-ask)
(setq mu4e-contexts
      (list
       (make-mu4e-context
				:name "personnel"
				:enter-func (lambda () (mu4e-message "Entering personal context"))
				:leave-func (lambda () (mu4e-message "Leaving personal context"))
				:match-func (lambda (msg)
											(when msg
												(mu4e-message-contact-field-matches
												 msg '(:from :to :cc :bcc) "rakesh@av8rr.com")))
				:vars '((user-mail-address . "rakesh@av8rr.com")
								(user-full-name . "Rakesh D. Rathod")
								(mu4e-sent-folder . "/rakesh/Sent")
								(mu4e-drafts-folder . "/rakesh/Drafts")
								(mu4e-trash-folder . "/rakesh/Trash")
								(mu4e-refile-folder . "/rakesh/Archives")
								(smtpmail-queue-dir . "~/av8rr-mail/queue/cur")
								(smtpmail-smtp-user . "rakesh@av8rr.com")
								(smtpmail-starttls-credentials . (("rakesh@av8rr.com" 587 nil nil)))
								(smtpmail-auth-credentials . (expand-file-name "~/.authinfo.gpg"))
								(smtpmail-default-smtp-server . "rakesh@av8rr.com")
								(smtpmail-smtp-server . "mail.av8rr.com")
								(smtpmail-smtp-service . 587)
								(mu4e-sent-messages-behavior . sent)
								(mu4e-maildir-shortcuts . ( ("/rakesh/INBOX"    . ?i)
																						("/rakesh/Sent"     . ?s)
																						("/rakesh/Trash"    . ?t)
																						("/rakesh/Archives" . ?a)
																						("/rakesh/Drafts"   . ?d)
																						))))

       (make-mu4e-context
				:name "career"
				:enter-func (lambda () (mu4e-message "Entering Career context"))
				:leave-func (lambda () (mu4e-message "Leaving Career context"))
				:match-func (lambda (msg)
											(when msg
												(mu4e-message-contact-field-matches
												 msg '(:from :to :cc :bcc) "career@av8rr.com")))
				:vars '((user-mail-address . "career@av8rr.com")
								(user-full-name . "AV8RR Career")
								(mu4e-sent-folder . "/career/Sent")
								(mu4e-drafts-folder . "/career/Drafts")
								(mu4e-trash-folder . "/career/Trash")
								(mu4e-refile-folder . "/career/Archives")
								(smtpmail-queue-dir . "~/av8rr-mail/queue/cur")
								(smtpmail-smtp-user . "rakesh@av8rr.com")
								(smtpmail-starttls-credentials . (("mail.av8rr.com" 587 nil nil)))
								(smtpmail-auth-credentials . (expand-file-name "~/.authinfo.gpg"))
								(smtpmail-default-smtp-server . "mail.av8rr.com")
								(smtpmail-smtp-server . "mail.av8rr.com")
								(smtpmail-smtp-service . 587)
								(mu4e-sent-messages-behavior . delete)
								(mu4e-maildir-shortcuts . ( ("/career/INBOX" . ?i)
																						("/career/Sent" . ?s)
																						("/career/Trash" . ?t)
																						("/career/Archives" . ?a)
																						("/career/Drafts" . ?d)
																						("/career/Apex" . ?A)
																						))))
       (make-mu4e-context
				:name "temp2022"
				:enter-func (lambda () (mu4e-message "Entering Temp2022 context"))
				:leave-func (lambda () (mu4e-message "Leaving Temp2022 context"))
				:match-func (lambda (msg)
											(when msg
												(mu4e-message-contact-field-matches
												 msg '(:from :to :cc :bcc) "temp2022@av8rr.com")))
				:vars '((user-mail-address . "temp2022@av8rr.com")
								(user-full-name . "AV8RR Temp2022")
								(mu4e-sent-folder . "/temp2022/Sent")
								(mu4e-drafts-folder . "/temp2022/Drafts")
								(mu4e-trash-folder . "/temp2022/Trash")
								(mu4e-refile-folder . "/temp2022/Archives")
								(smtpmail-queue-dir . "~/av8rr-mail/queue/cur")
								(smtpmail-smtp-user . "rakesh@av8rr.com")
								(smtpmail-starttls-credentials . (("mail.av8rr.com" 587 nil nil)))
								(smtpmail-auth-credentials . (expand-file-name "~/.authinfo.gpg"))
								(smtpmail-default-smtp-server . "mail.av8rr.com")
								(smtpmail-smtp-server . "mail.av8rr.com")
								(smtpmail-smtp-service . 587)
								(mu4e-sent-messages-behavior . delete)
								(mu4e-maildir-shortcuts . ( ("/temp2022/INBOX" . ?i)
																						("/temp2022/Sent" . ?s)
																						("/temp2022/Trash" . ?t)
																						("/temp2022/Archives" . ?a)
																						("/temp2022/Drafts" . ?d)
																						))))))

(setq mu4e-bookmarks
      `(
				("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
				("flag:unread" "new messages" ?n)
        ("date:today..now" "Today's messages" ?t)
        ("date:7d..now" "Last 7 days" ?w)
        ("mime:image/*" "Messages with images" ?p)
        ))

(require 'org-mu4e)
(setq org-mu4e-convert-to-html t)

(use-package org-mime
  :ensure t)

(use-package org-msg
	:ensure t
  :init (org-msg-mode 1))

;;(require 'org-msg)
(setq org-msg-options "html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \\n:t"
			org-msg-startup "hidestars indent inlineimages"
			org-msg-greeting-fmt "\nHi%s,\n\n"
			org-msg-recipient-names '(("rakesh@av8rr.com" . "Rakesh Rathod"))
			org-msg-greeting-name-limit 3
			org-msg-default-alternatives '((new		. (text html))
																		 (reply-to-html	. (text html))
																		 (reply-to-text	. (text)))
			org-msg-convert-citation t
			org-msg-signature "

 Regards,

 #+begin_signature

 
 *Rakesh Rathod*

AV8RR

NOTICE: This message is intended for the exclusive use of its intended recipient and may contain information that is privileged or confidential or otherwise legally exempt from disclosure.  If you are not the intended recipient or an employee or agent responsible for delivering this message to the intended recipient you are not authorized to read, print, retain, copy or disseminate this message or any part thereof.  In the event that you have received this message in error please notify the sender immediately by e-mail, discard any paper copies and delete all electronic files of the above message.  In the event that you are not sure as to whether you are the intended recipient,please respond to the above e-mail message immediately.

 #+end_signature")
;; (org-msg-mode)

(global-set-key (kbd "C-c e") 'mu4e)
(global-set-key (kbd "C-<tab>") 'forward-button)

;; Set the Elfeed DB Directory
(setq elfeed-db-directory "~/.emacs.d/elfeeddb")

;; Load elfeed-org
(use-package elfeed
	:ensure t
	:bind (
				( "C-c w" . elfeed) 	
				( "C-c C-q" . delete-window)
	:map elfeed-search-mode-map
	("j" . (lambda () (interactive) (next-line) (call-interactively 'elfeed-search-show-entry)))
	("k" . (lambda () (interactive) (previous-line) (call-interactively 'elfeed-search-show-entry)))
	("m" . (lambda () (interactive) (apply 'elfeed-search-toggle-all '(star)))))
	:config
	(setq elfeed-show-entry-switch 'display-buffer)
	(setq elfeed-search-remain-on-entry t)
	)

(use-package elfeed-org
   :ensure t
		:config
		(elfeed-org)
		(setq rmh-elfeed-org-files (list "/rdr/projects/linux/emacs/elfeed.org")))

(require 'elfeed-goodies)
(elfeed-goodies/setup)

(setq elfeed-goodies/entry-pane-size 0.5)
(setq elfeed-goodies/feed-source-column-width 20)

(defface elfeed-face-tag-news
  '((t :foreground "#x48B4D4"))
  "This is a custom font face for the news tag in Elfeed.")

(setq shr-use-fonts nil)
(setq shr-use-colors nil) 
(push '(news elfeed-face-tag-news)
      elfeed-search-face-alist)
