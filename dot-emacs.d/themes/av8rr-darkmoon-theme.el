;; av8rr-darkmoon-theme.el --- An AV8RR Theme
;;; Version: 1.0
;;; Commentary:
;;; A theme called AV8RR Dark Moon
;;; Code:

(deftheme av8rr-darkmoon "DOCSTRING for av8rr-darkmoon")
(custom-theme-set-faces 'av8rr-darkmoon
												'(default ((t (:foreground "#fcfcea" :background "#202020" :inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :foundry "ADBO" :font "Comic Mono-12"))))
												'(fixed-pitch ((t (:font "Ubuntu Mono-12"))))
												'(variable-pitch ((t (:font "Arial-12"))))
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
                        '(font-lock-type-face ((t (:foreground "#3B9DFB" ))))
                        '(font-lock-constant-face ((t (:foreground "#d3869b" ))))
                        '(font-lock-variable-name-face ((t (:foreground "#83a598" ))))
                        '(minibuffer-prompt ((t (:foreground "#f8e1f6" :bold t ))))
                        '(font-lock-warning-face ((t (:foreground "red" :bold t ))))
                        '(org-block ((t (:foreground "#ffffff" :background "#000000"))))
                        '(org-block-begin-line ((t (:foreground "#181818" :background "#555555"))))
                        '(org-block-background ((t (:foreground "#ffffff" :background "#000000"))))
                        '(org-block-end-line ((t (:foreground "#181818" :background "#555555"))))
	                      '(org-drawer ((t (:foreground "#8E8E8E" ))))
	                      '(org-special-keyword ((t (:foreground "#5F95E4" ))))
	                      '(org-date ((t (:foreground "#5F95E4" ))))
	                      '(org-meta-line ((t (:foreground "#8E8E8E"))))
                        '(org-level-1 ((t (:foreground "#fa86f8" ))))
                        '(org-level-2 ((t (:foreground "#77BAFB"))))
                        '(org-level-3 ((t (:foreground "#f970f7"))))
                        '(org-level-4 ((t (:foreground "#6cbdfb"))))
                        '(org-level-5 ((t (:foreground "#fb52f9"))))
                        '(org-link ((t (:foreground "#00ff00"))))
	                      '(org-meta-line ((t (:foreground "#7c6f64" :height 120))))
 	                      '(org-table ((t (:inherit default :foreground "#42a2f3" :background "#000000"))))
												'(org-priority ((t (:foreground "#6cbdfb"))))
	                      '(mu4e-title-face ((t (:inherit doom-modeline-spc :foreground "#ffffff"))))
												'(mu4e-context-face ((t (:inherit mu4e-title-face :weight bold))))
												)

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))

;; Automatically add this theme to the load path
(provide-theme 'av8rr-darkmoon)

;;; av8rr-darkmoon-theme.el ends here

