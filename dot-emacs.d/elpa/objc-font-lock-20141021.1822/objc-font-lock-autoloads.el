;;; objc-font-lock-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "objc-font-lock" "objc-font-lock.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from objc-font-lock.el

(defvar objc-font-lock-modes '(objc-mode) "\
List of major modes where Objc Font Lock Global mode should be enabled.")

(custom-autoload 'objc-font-lock-modes "objc-font-lock" t)

(autoload 'objc-font-lock-mode "objc-font-lock" "\
Minor mode that highlights Objective-C method calls.

This is a minor mode.  If called interactively, toggle the
`Objc-Font-Lock mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `objc-font-lock-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(put 'objc-font-lock-global-mode 'globalized-minor-mode t)

(defvar objc-font-lock-global-mode nil "\
Non-nil if Objc-Font-Lock-Global mode is enabled.
See the `objc-font-lock-global-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `objc-font-lock-global-mode'.")

(custom-autoload 'objc-font-lock-global-mode "objc-font-lock" nil)

(autoload 'objc-font-lock-global-mode "objc-font-lock" "\
Toggle Objc-Font-Lock mode in all buffers.
With prefix ARG, enable Objc-Font-Lock-Global mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Objc-Font-Lock mode is enabled in all buffers where `(lambda nil (when
\(apply 'derived-mode-p objc-font-lock-modes) (objc-font-lock-mode
1)))' would do it.

See `objc-font-lock-mode' for more information on Objc-Font-Lock
mode.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "objc-font-lock" '("objc-font-lock-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; objc-font-lock-autoloads.el ends here
