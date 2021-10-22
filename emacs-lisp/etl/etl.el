;;; etl.el --- etl Exercise (exercism)

;;; Commentary:

;;; Code:

(defun etl (input)
  (let ((hash (make-hash-table :test #'equal)))
    (maphash (lambda (k v)
	       (when (< k 0)
		 (error "negative score"))
	       (mapc (lambda (letter)
		       (unless (stringp letter)
			 (error "not a string"))
		       (setf (gethash (downcase letter) hash) k)) v))
	     input)
    hash))

(provide 'etl)
;;; etl.el ends here