;;; crypto-square.el --- Crypto Square (exercism)

;;; Commentary:

;;; Code:

(defun group (list n)
  (cl-loop
   with list = list
   while list
   collect (cl-loop
	    repeat n
	    while list
	    collect (pop list) into row
	    finally (return (append row (make-list (- n (length row)) ? ))))))

(defun encipher (text)
  (if (string-empty-p text)
      ""
    (let* ((normalized
	    (cl-loop
	     for c across (downcase text)
	     if (or (<= ?0 c ?9) (<= ?a c ?z))
	     collect c))
	   (col-count (ceiling (sqrt (length normalized))))
	   (rows (group normalized col-count)))
      (string-join (apply #'cl-mapcar #'string rows) " "))))

(provide 'crypto-square)
;;; crypto-square.el ends here
