;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)

;;; Commentary:

;;; Code:

(defun armstrong-p (n)
  (let ((digit-count (ceiling (log10 n)))
	(digits (cl-loop
		 for nn = n then (truncate nn 10)
		 while (> nn 0)
		 collect (mod nn 10))))
    (= n (seq-reduce #'+ (mapcar #'(lambda (x) (expt x digit-count)) digits) 0))))

(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
