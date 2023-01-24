;;     +-----------+-----------+-----------+-----------+-----------+
;;     |     .     | __     __ |    ___    |   ____    |   ____    |
;;     |    / \    | \ \   / / |   ( _ )   |  |  _ \   |  |  _ \   |
;;     |   / _ \   |  \ \ / /  |   / _ \   |  | |_) |  |  | |_) |  |
;;     |  / ___ \  |   \ V /   |  | (_) |  |  |  _ <   |  |  _ <   |
;;     | /_/   \_\ |    \_/    |   \___/   |  |_| \_\  |  |_| \_\  |
;;     |           |           |           |           |           |
;;     +-----------+-----------+-----------+-----------+-----------+
;;     
;;     AV8RR
;;     
;; LICENSE:  [[https://www.gnu.org/licenses/old-licenses/gpl-2.0.html][GNU-GPL-V2]]
;; 
;; TITLE:     Rakesh's Emacs Init File
;; AUTHOR:    "Rakesh Rathod"
;; DATE:      November 19, 2021
;;
;; This is the initial Emacs init file. It is called first after emacs initializes. This file contains all user packages and setting.

;; Garbage collection
;; This line will be repeated at the bottom of this file
(setq gc-cons-threshold (* 50 1000 1000))

;; quickly open some files
(global-set-key (kbd "<f6> i") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "<f6> c") (lambda () (interactive) (find-file "/rdr/projects/linux/emacs/config.org")))

;;
;; User Init Directory
;;
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         use-init-directory)
        ad
        (t "~/.emacs.d/")))

;;
;; User Config Dirctory
;;
(defconst user-config-dir
  (cond ((boundp 'user-config-directory)
         user-config-directory)
        (t "~/.config/emacs/")))
;;-----
;; Disable C-i to jump forward to restore TAB functionality in Org mode.
(setq evil-want-C-i-jump nil)

;;
;; Load the Main Config file
;;
;;(org-babel-load-file "~/.config/emacs/config.org")
(load-file "~/.config/emacs/config.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(custom-safe-themes
	 '("05626f77b0c8c197c7e4a31d9783c4ec6e351d9624aa28bc15e7f6d6a6ebd926" "21cb8510c0f313c0f553d85f1816407ef7cafb7ec9e971eaf2cdaff7f15d1b07" "5b3dc179bf8210b3b2992c442fbd52b2855aa9d4e0a0d755c6e2bebb8fc9377b" "d09955b2fb9b35663dd2e9e9a0d8413d6d860af5751e2215399a1e4cd38f997e" "d6c23e8594123e87e51ff7f92e320e56ee4f192fca6da72e1f3528b3cc1c74e0" "14fb9a86e86ca096c4f8a8eb57c4045a2268ac4b47f1d1294582b3f179f57b44" "c8b90edd7fc7fd7227d140218c85f96dca9517694b7e3be0a9290dfdbfc742ad" "b6dd3aa1d4a87480282c5c674cea62da87e4ac594ea88054650f85470dd47eb3" "511f5beb1fea698f89b9cebeb85adf91cf30de1ee68cd5df69ae0c851308f133" "4af9f097cadaf034a69f6b1458d87a55908caa88a4e423d964b3f5cfb8ace28e" "8a57f342b9cc565276a2456e9bec9f33633afc991179541a928293c050284051" default))
 '(helm-minibuffer-history-key "M-p")
 '(magit-repository-directories '(("/rdr/projects" . 0)))
 '(org-agenda-files
	 '("/rdr/personal/notes/notes.org" "/rdr/personal/notes/journal/journal.org" "/rdr/personal/notes/journal/habits.org" "/rdr/personal/notes/av8rr-oxy.org" "/rdr/personal/notes/av8rr-oxy-projects.org" "/rdr/personal/notes/AV8RR-OXY-PROJ-20220909130235-upon.org" "/rdr/personal/notes/AV8RR-OXY-PROJ-20221006134929-pma.org"))
 '(org-modules
	 '(ol-bbdb ol-bibtex ol-docview ol-doi ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(org-pretty-tags-agenda-unpretty-habits nil)
 '(org-tags-exclude-from-inheritance '("Project"))
 '(org-tree-slide-fold-subtrees-skipped nil)
 '(org-tree-slide-skip-outline-level 4)
 '(package-selected-packages
	 '(dracula-theme xclip org-mime htmlize dired-hacks-utils dired-icon all-the-icons-ibuffer all-the-icons-dired treemacs-magit treemacs-evil treemacs objc-font-lock preproc-font-lock all-the-icons-gnus mu4e-overview mu4e-views pdf-tools org-msg auctex-latexmk auctex dired-single treemacs-icons-dired treemacs-all-the-icons dired-open dired-hide-dotfiles all-the-icons selectric-mode page-break-lines dashboard helm-ispell vertico journal marginalia company-prescient company counsel emms org-sidebar key-chord persp-mode perspective org-tree-slide-pauses ## org-reverse-datetree olivetti beacon help-find-org-mode org-beautify-theme org org-super-agenda org-movies zones org-roam-timestamps org-roam-ui counsel-world-clock zenburn-theme yasnippet-snippets which-key visual-fill-column use-package rebecca-theme rainbow-mode rainbow-delimiters org-tree-slide org-superstar org-roam org-pretty-tags org-fancy-priorities org-bullets ivy-rich hydra helpful helm general forge evil-collection doom-themes doom-modeline-now-playing counsel-projectile command-log-mode autothemer))
 '(smtpmail-smtp-server "mail.av8rr.com")
 '(smtpmail-smtp-service 587))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face0forward :height 3.0))))
 '(doom-modeline-bar ((t (:inherit doom-modeline-highlight :height 8.0))))
 '(mu4e-context-face ((t (:inherit mu4e-title-face :weight bold)))))

;;
;; Garbage collection
;;
(setq gc-cons-threshold (* 50 1000 1000))
(put 'dired-find-alternate-file 'disabled nil)

(put 'narrow-to-region 'disabled nil)
