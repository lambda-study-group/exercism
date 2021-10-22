;;; luhn.el --- Luhn exercise (exercism)

;;; Commentary:

;;; Code:
(require 'cl)

(defun luhn-p (s)
  (let ((digits (nreverse (cl-loop
			   for d across s
			   if (<= ?0 d ?9)
			   collect (- d ?0)
			   else if (not (char-equal d ? ))
			   do (error "")))))
    (if (<= (length digits) 1)
	nil
      (zerop (mod (cl-reduce #'+
			     (cl-loop
			      for i from 1
			      for d in digits
			      collect (if (evenp i)
					  (let ((twice (* 2 d)))
					    (if (> twice 9) (- twice 9) twice))
					d)))
		  10)))))

(provide 'luhn)
;;; luhn.el ends here
