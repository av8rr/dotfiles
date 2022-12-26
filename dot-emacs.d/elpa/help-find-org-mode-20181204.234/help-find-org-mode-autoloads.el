;;; help-find-org-mode-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "help-find-org-mode" "help-find-org-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from help-find-org-mode.el

(defvar help-find-org-mode nil "\
Non-nil if Help-Find-Org mode is enabled.
See the `help-find-org-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `help-find-org-mode'.")

(custom-autoload 'help-find-org-mode "help-find-org-mode" nil)

(autoload 'help-find-org-mode "help-find-org-mode" "\
Advise help functions that find source files to find org babel
source blocks instead of tangled source.

This is a minor mode.  If called interactively, toggle the
`Help-Find-Org mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='help-find-org-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "help-find-org-mode" '("help-find-org-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; help-find-org-mode-autoloads.el ends here
