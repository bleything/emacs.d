;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Ben Bleything's emacs setup
;;; Based on the work of many others. See README.md for credits.
;;;
;;; Git Hubs: http://github.com/bleything/dotemacs
;;; Internet Electronic Mail: ben@bleything.net
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; To install, make this directory live at ~/.emacs.d
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Shortcuts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name))
      vendor-dir (concat dotfiles-dir "vendor/"))

;;; add vendor/misc to load path
(add-to-list 'load-path (concat vendor-dir "misc/"))

;;; helper function to load files from the dotfile path
(defun load-config (file)
  (load-file (concat dotfiles-dir file)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Emacs Lisp Package Archive (aka ELPA)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq elpa-dir (concat dotfiles-dir "elpa/"))
(add-to-list 'load-path elpa-dir)
(require 'package)
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Load Configs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-config "window.el")    ;; window settings (colors, status bars, etc)
(load-config "languages.el") ;; settings for various languages
