;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Ben Bleything's emacs setup
;;; Based on the work of many others. See README.md for credits.
;;;
;;; Git Hubs: http://github.com/bleything/dotemacs
;;; Internet Electronic Mail: ben@bleything.net
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Color Options
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; enable color-theme
(add-to-list 'load-path (concat vendor-dir "color-theme"))
(require 'color-theme)
(color-theme-initialize)

;;; shortcuts for color schemes
(setq colors-dir (concat dotfiles-dir "colors/"))

;;; helper function for loading color themes
(defun use-color-theme (name)
  (load-file (concat colors-dir name ".el"))
  (eval (read (concat "(color-theme-" name ")"))))

;;; ...aaand set our color theme
(use-color-theme "tomorrow-night")
