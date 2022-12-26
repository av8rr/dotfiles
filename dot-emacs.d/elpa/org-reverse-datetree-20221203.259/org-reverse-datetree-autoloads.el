;;; org-reverse-datetree-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "org-reverse-datetree" "org-reverse-datetree.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-reverse-datetree.el

(autoload 'org-reverse-datetree-2 "org-reverse-datetree" "\
Jump to the specified date in a reverse date tree.

TIME is the date to be inserted.  If omitted, it will be today.

LEVEL-FORMATS is a list of formats.
See `org-reverse-datetree-level-formats' for the data type.

Depending on the value of RETURN-TYPE, this function returns the
following values:

\"'marker\":
  Returns the marker of the subtree.

\"point\"
  Returns point of subtree.

\"rfloc\"
  Returns a refile location spec that can be used as the third
  argument of `org-refile' function.

\"created\"
  Returns non-nil if and only if a new tree is created.

If ASC is non-nil, it creates a non-reverse date tree.

If OLP is a string or a list of strings, it specifies the parent
tree of the date tree, like a file+olp+datetree target of
`org-capture'.

\(fn TIME LEVEL-FORMATS &optional RETURN-TYPE &key ASC OLP)" nil nil)

(autoload 'org-reverse-datetree-1 "org-reverse-datetree" "\
Jump to the specified date in a reverse date tree.

This function is deprecated.
Use `org-reverse-datetree-2' instead.

A reverse date tree is a reversed version of the date tree in
`org-capture', i.e. a date tree where the newest date is the first.
This is especially useful for a notes archive, because the latest
entry on a particular topic is displayed at the top in
a command like `helm-org-rifle'.

`org-reverse-datetree-find-function' is used to find or insert trees.

TIME is the date to be inserted.  If omitted, it will be today.

If WEEK-TREE is non-nil, it creates week trees.  Otherwise, it
creates month trees.

For RETURN, see the documentation of `org-reverse-datetree-2'.

\(fn &optional TIME &key WEEK-TREE RETURN)" nil nil)

(autoload 'org-reverse-datetree-goto-date-in-file "org-reverse-datetree" "\
Find or create a heading as configured in the file headers.

This function finds an entry at TIME in a date tree as configured
by file headers of the buffer.  If there is no such configuration,
ask the user for a new configuration.  If TIME is omitted, it is
the current date.

RETURN and OLP are the same as in `org-reverse-datetree-2', which
see.

When this function is called interactively, it asks for TIME using
`org-read-date' and go to an entry of the date.

\(fn &optional TIME &key RETURN OLP)" t nil)

(autoload 'org-reverse-datetree-goto-read-date-in-file "org-reverse-datetree" "\
Find or create a heading as configured in the file headers.

This function is like `org-reverse-datetree-goto-date-in-file',
but it always asks for a date even if it is called non-interactively.

ARGS are the arguments to
`org-reverse-datetree-goto-date-in-file' without the time, which
see.

\(fn &rest ARGS)" t nil)

(autoload 'org-reverse-datetree-refile-to-file "org-reverse-datetree" "\
Refile the current Org entry into a configured date tree in a file.

This function refiles the current entry into a date tree in FILE
configured in the headers of the file.  The same configuration as
`org-reverse-datetree-goto-date-in-file' is used.

This function retrieves a timestamp from from the entry. Unless
TIME is specified, `org-reverse-datetree-entry-time' determines
how to pick a timestamp. If the argument is specified, it can
take the same format (i.e. a list of patterns) as
`org-reverse-datetree-entry-time' variable.

Alternatively, you can set TIME to t, in which case a prompt is
shown to let the user choose a date explicitly.

ASK-ALWAYS and PREFER are deprecated.

Unless a region is active in `org-mode' or the bulk mode is
active in `org-agenda-mode', this function returns the effective
time of the destination entry. If either mode is effective, nil
is returned.

\(fn FILE &optional TIME &key ASK-ALWAYS PREFER)" nil nil)

(autoload 'org-reverse-datetree-archive-subtree "org-reverse-datetree" "\
An org-reverse-datetree equivalent to `org-archive-subtree'.

A prefix argument FIND-DONE should be treated as in
`org-archive-subtree'.

\(fn &optional FIND-DONE)" t nil)

(autoload 'org-reverse-datetree-agenda-archive "org-reverse-datetree" "\
Archive the entry or subtree belonging to the current agenda entry." t nil)

(autoload 'org-reverse-datetree-cleanup-empty-dates "org-reverse-datetree" "\
Delete empty date entries in the buffer.

If NOCONFIRM is non-nil, nodes are deleted without confirmation.
In non-interactive mode, you have to explicitly set this
argument.

If both NOCONFIRM and ANCESTORS are non-nil, upper level nodes
are deleted without confirmation as well.

\(fn &key NOCONFIRM ANCESTORS)" t nil)

(register-definition-prefixes "org-reverse-datetree" '("org-reverse-datetree-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-reverse-datetree-autoloads.el ends here
