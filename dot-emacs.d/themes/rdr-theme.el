;;; rdr-theme.el --- RDR Theme
;;; Version: 1.0
;;; Commentary:
;;; A theme called rdr
;;; Code:

(deftheme rdr "DOCSTRING for rdr")
  (custom-theme-set-faces 'rdr
   '(default ((t (:foreground "#fcfcea" :background "#262126" ))))
   '(cursor ((t (:background "#c109c4" ))))
   '(fringe ((t (:background "#282828" ))))
   '(mode-line ((t (:foreground "#ffffff" :background "#af00a9" ))))
   '(region ((t (:background "#981f97" ))))
   '(secondary-selection ((t (:background "#b406b3" ))))
   '(font-lock-builtin-face ((t (:foreground "#9058a2" ))))
   '(font-lock-comment-face ((t (:foreground "#7c6f64" ))))
   '(font-lock-function-name-face ((t (:foreground "#fc9d00" ))))
   '(font-lock-keyword-face ((t (:foreground "#b0a8fe" ))))
   '(font-lock-string-face ((t (:foreground "#b585c3" ))))
   '(font-lock-type-face ((t (:foreground "#b77200" ))))
   '(font-lock-constant-face ((t (:foreground "#d3869b" ))))
   '(font-lock-variable-name-face ((t (:foreground "#83a598" ))))
   '(minibuffer-prompt ((t (:foreground "#f8e1f6" :bold t ))))
   '(font-lock-warning-face ((t (:foreground "red" :bold t ))))
   '(org-block ((t (:foreground "#ffffff" :background "#000000"))))
   '(org-block-begin-line ((t (:foreground "#181818" :background "#404040"))))
   '(org-block-background ((t (:foreground "#ffffff" :background "#000000"))))
   '(org-block-end-line ((t (:foreground "#181818" :background "#404040"))))
	 '(org-drawer ((t (:foreground "#8E8E8E" ))))
	 '(org-special-keyword ((t (:foreground "#6765CB" ))))
	 '(org-date ((t (:foreground "#5B58F7" ))))
	 '(org-meta-line ((t (:foreground "#8E8E8E"))))
   '(org-level-1 ((t (:foreground "#ec01e9"))))
   '(org-level-2 ((t (:foreground "#cc1fca"))))
   '(org-level-3 ((t (:foreground "#cc1fca"))))
   '(org-level-4 ((t (:foreground "#027ff6"))))
   '(org-level-5 ((t (:foreground "#2a74bc"))))
	 '(org-meta-line ((t (:foreground "#7c6f64" :height 120))))
 	 '(org-table ((t (:inherit default :foreground "#42a2f3" :background "#000000"))))
	 '(mu4e-title-face ((t (:inherit doom-modeline-spc :foreground "#ffffff"))))
b  '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "ADBO" :family "Source Code Pro"))))
)

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'rdr)

;;; rdr-theme.el ends here
