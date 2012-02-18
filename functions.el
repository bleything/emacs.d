;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Ben Bleything's emacs setup
;;; Based on the work of many others. See README.md for credits.
;;;
;;; Git Hubs: http://github.com/bleything/dotemacs
;;; Internet Electronic Mail: ben@bleything.net
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; draw a comment box around the given string
(defun boxify (string)
  (interactive "sString to boxify: ")
  (insert-char ?\; 80)
  (insert "\n")
  (insert ";;; " string)
  (insert "\n")
  (insert-char ?\; 80)
  (insert "\n"))
