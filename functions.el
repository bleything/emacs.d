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

;;; get the face at the point
(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

;;; textmate-style comment/uncomment cmd-/ for toggling comments
(global-set-key (kbd "s-/") 'comment-or-uncomment-region-or-line)
(defun comment-or-uncomment-region-or-line () (interactive)
  ;; redefining deactivate-mark prevents the region from disappearing
  ;; after commenting
  (let ((deactivate-mark nil))
    (if mark-active
        ;; save-excursion resets the mark and point
        ;; after the command runs
        (save-excursion
          ;; support selecting from the top down (if) and from the
          ;; bottom up (unless)
          (if (> (point) (mark))
              (comment-or-uncomment-region (mark) (point))
            (comment-or-uncomment-region (point) (mark))))

      ;; in this case, save-excursion is used to temporarily define a
      ;; region so that our previous selection (if any) isn't lost
      (save-excursion
        (comment-or-uncomment-region
         (line-beginning-position)
         (line-end-position))))))

;;; align on assignment or hashrocket
(defun bb-align-assignment-or-hashrocket (beg end)
  (interactive "r")
  (align-regexp beg end "\\( \\)=>?"))
(global-set-key (kbd "C-c [") 'bb-align-assignment-or-hashrocket)

;;; opens a new 80-column split with my org file in it
(defun bb-org () (interactive)
  (split-window-right -82) ;; +2 for the sidebars
  (switch-window)
  (find-file "~/Dropbox/todo.org"))

;;; converts org-mode tables to github-flavored markdown
(defun bb-org-tables-to-gfm ()
  (save-excursion
    (goto-char (point-min))
    (replace-string "-+-" "-|-")))
