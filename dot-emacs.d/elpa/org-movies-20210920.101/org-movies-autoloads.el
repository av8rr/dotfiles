;;; org-movies-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "org-movies" "org-movies.el" (0 0 0 0))
;;; Generated autoloads from org-movies.el

(autoload 'org-movies-format "org-movies" "\
Get Org node from INFO alist of movie data.

LEVEL specifies Org heading level.

\(fn INFO &optional (LEVEL 2))" nil nil)

(autoload 'org-movies-from-url "org-movies" "\
Get movie org heading from URL.

LEVEL specifies Org heading level.

\(fn URL &optional (LEVEL 2))" t nil)

(autoload 'org-movies-add-url "org-movies" "\
Get movie Org heading from url and insert at point." t nil)

(autoload 'org-movies-import-csv "org-movies" "\
Import IMDb watchlist to Org file.

CSV-FILE specifies the IMDb watchlist file, ORG-FILE specifies the Org file to export to.

\(fn CSV-FILE ORG-FILE)" t nil)

(register-definition-prefixes "org-movies" '("org-movies-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-movies-autoloads.el ends here
