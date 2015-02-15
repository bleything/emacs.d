;;; processing-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (processing-mode processing-find-sketch) "processing-mode"
;;;;;;  "processing-mode.el" (21729 2364 0 0))
;;; Generated autoloads from processing-mode.el

(autoload 'processing-find-sketch "processing-mode" "\
Find a processing sketch with NAME in `processing-sketchbook-dir'.
If ARG is non nil or `processing-sketchbook-dir' is nil create new
sketch in current directory.

\(fn NAME &optional ARG)" t nil)

(autoload 'processing-mode "processing-mode" "\
Major mode for Processing.
\\{java-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))

;;;***

;;;### (autoloads nil nil ("processing-mode-pkg.el") (21729 2364
;;;;;;  580818 0))

;;;***

(provide 'processing-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; processing-mode-autoloads.el ends here
