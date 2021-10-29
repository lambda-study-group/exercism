;;; word-count.el --- word-count Exercise (exercism)

;;; Commentary:

;;; Code:

(defun word-count (str)
  (loop
   with acc = nil
   for word in (split-string (downcase str) "\\W+" t)
   for already = (assoc word acc)
   do (if already
	  (incf (cdr already))
	(setf acc (acons word 1 acc)))
   finally (return acc)))

(provide 'word-count)
;;; word-count.el ends here