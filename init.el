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

;;; cmd-enter to fullscreen
(global-set-key [(super return)] 'ns-toggle-fullscreen)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ELPA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq package-archives '(
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("tromey"    . "http://tromey.com/elpa/")))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Load Configs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; load files from the dotfile path
(defun load-config (file)
  (load-file (concat user-emacs-directory file)))

(load-config "functions.el") ;; personal helper functions
(load-config "languages.el") ;; settings for various languages
(load-config "tools.el")     ;; settings for various tools
(load-config "window.el")    ;; window settings (colors, status bars, etc)
