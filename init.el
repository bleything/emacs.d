;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Ben Bleything's emacs setup
;;; Based on the work of many others. See README.md for credits.
;;;
;;; Git Hubs: http://github.com/bleything/dotemacs
;;; Internet Electronic Mail: ben@bleything.net
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; To install, make this directory live at ~/.emacs.d
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; basic configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)                   ;; common lisp compatibility
(server-start)                  ;; start server so clients can attach
(setq make-backup-files nil)    ;; do not create file~ files
(setq inhibit-startup-screen t) ;; do not show startup screen
(column-number-mode t)          ;; show cursor position in status bar
(global-auto-revert-mode t)     ;; automatically update files that have
                                ;; changed on disk
(delete-selection-mode t)       ;; typing over a selection deletes the
                                ;; selected text

;;; make emacs ignore the right-side option key so it can be used for accented
;;; characters and other OS-level stuff
(setq ns-right-alternate-modifier 'none)

;;; enable whitespace-mode for all buffers, showing trailing spaces,
;;; tabs, and lines that extend past 80 characters
(global-whitespace-mode t)
(setq whitespace-style '(face trailing tabs lines-tail tab-mark))

;;; no tabs.
(setq-default indent-tabs-mode nil)

;;; fill to 80 columns
(setq-default fill-column 80)

;;; add ~/.emacs.d/vendor to load path
(add-to-list 'load-path (concat user-emacs-directory "vendor"))

;;; add /usr/local/[s]bin to exec-path
(add-to-list 'exec-path "/usr/local/sbin")
(add-to-list 'exec-path "/usr/local/bin")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ELPA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq package-archives '(
                         ("gnu"          . "http://elpa.gnu.org/packages/")
                         ("marmalade"    . "http://marmalade-repo.org/packages/")
                         ("tromey"       . "http://tromey.com/elpa/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; sanify paths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Load Configs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; load files from the dotfile path
(defun load-config (file)
  (load-file (concat user-emacs-directory file)))

;;; set our customize file to custom.el and load it
(setq custom-file (concat user-emacs-directory "custom.el"))
(load-config "custom.el")

;;; and the rest of our configs
(load-config "functions.el") ;; personal helper functions
(load-config "languages.el") ;; settings for various languages
(load-config "tools.el")     ;; settings for various tools
(load-config "window.el")    ;; window settings (colors, status bars, etc)

;;; if we have an encrypted secrets file, load it on up
(if (file-exists-p (concat user-emacs-directory "secrets.el.gpg"))
    (load-config "secrets.el.gpg"))
