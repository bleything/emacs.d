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

(setq make-backup-files nil)    ;; do not create file~ files
(setq inhibit-startup-screen t) ;; do not show startup screen
(column-number-mode t)          ;; show cursor position in status bar
(delete-selection-mode t)       ;; typing over a selection deletes the
                                ;; selected text

;;; enable whitespace-mode for all buffers, showing trailing spaces,
;;; tabs, and lines that extend past 80 characters
(global-whitespace-mode t)
(setq whitespace-style '(face trailing tabs lines-tail tab-mark))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Shortcuts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name))
      vendor-dir (concat dotfiles-dir "vendor/"))

;;; helper functions!

; add path to load-path
(defun add-to-load-path (path)
  (add-to-list 'load-path (concat vendor-dir path "/")))

; load files from the dotfile path
(defun load-config (file)
  (load-file (concat dotfiles-dir file)))

;;; add vendor/misc to load path
(add-to-load-path "misc")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Load Configs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-config "languages.el") ;; settings for various languages
(load-config "tools.el")     ;; settings for various tools
(load-config "window.el")    ;; window settings (colors, status bars, etc)
