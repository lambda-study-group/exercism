;;; pangram.el --- Pangram (exercism)

;;; Commentary:

;;; Code:

(defun is-pangram (str)
  (let ((str-lst (remove-if-not #'(lambda (c) (<= ?a c) ?z)
		  (coerce (downcase str) 'list)))
	(alphabet (loop for c from ?a to ?z collect c)))
    (null (set-difference alphabet str-lst))))

(provide 'pangram)
;;; pangram.el ends here