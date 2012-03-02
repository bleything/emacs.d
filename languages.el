;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Ben Bleything's emacs setup
;;; Based on the work of many others. See README.md for credits.
;;;
;;; Git Hubs: http://github.com/bleything/dotemacs
;;; Internet Electronic Mail: ben@bleything.net
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CSS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'css-mode-hook 'rainbow-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; enable paredit for (e)lisp
(autoload 'paredit-mode "paredit")
(add-hook 'lisp-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))

;;; enable rainbow-delimiters for (e)lisp
(autoload 'rainbow-delimiters-mode "rainbow-delimiters")
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;;; disable automatic newlines in paredit
;; (eval-after-load 'paredit
;;   '(progn
;;      (define-key paredit-mode-map (kbd ")")
;;        'paredit-close-parenthesis)
;;
;;      (define-key paredit-mode-map (kbd "M-)")
;;        'paredit-close-parenthesis-and-newline)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Markdown
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'markdown-mode "markdown-mode")
(add-to-list 'auto-mode-alist '("\\.mk?d$" . markdown-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolog
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq prolog-system 'swi)
(add-to-list 'auto-mode-alist '("\\.plg$" . prolog-mode))
(add-to-list 'auto-mode-alist '("\\.m$" . mercury-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ruby
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.irbrc$" . ruby-mode))

;;; disable inserting encoding comments in utf-8 files
(setq ruby-insert-encoding-magic-comment nil)

;;; indent arg lists like anything else
(setq ruby-deep-arglist nil)
(setq ruby-deep-indent-paren nil)
(setq ruby-deep-indent-paren-style nil)

;;; fix closing paren indentation. Stolen from
;;; https://gist.github.com/1274520
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;;; enable rvm support
(rvm-use-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; YAML
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'yaml-mode "yaml-mode")
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
