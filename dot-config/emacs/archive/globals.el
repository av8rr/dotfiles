;;
;; Global Setup
;;
(global-display-line-numbers-mode)
(global-visual-line-mode 1)


(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;;
;; Set Auto Save and Backup Directories
;;
(defvar emacs-tmp-dir "~/.emacs.d/bu/") ; name of the backup directory
(defun make-backup-file-name (FILE)                                             
  (let ((dirname (concat emacs-tmp-dir "")))
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

;;
;; Editor Setup
;;
;; Tab Stops
(setq tab-stop-list (number-sequence 4 120 4)) ; Tab stop every 4th column

;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it again, replace the t with 0)
(setq inhibit-slash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;; Split windows vertically
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;;
;; Font and Character Management
;;
(when (member "Symbola" (font-family-list))
 (set-fontset-font "fontset-default" nil
 (font-spec :size 20 :name "Symbola")))
(when (member "Symbola" (font-family-list))
  (set-fontset-font t 'unicode "Symbola" nil 'prepend))
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; 
;; Start (Uncomment)/Stop (Comment-out) Auto Indenting
;;
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

