;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)

;;; Commentary:

;;; Code:

(defun factors (n)
  (remove-if-not (lambda (x) (and (zerop (mod n x))
				  (not (= x n))))
		 (number-sequence 1 (ceiling (/ (1+ n) 2)))))

(defun perfect-number-p (n)
  (= n (reduce #'+ (factors n))))

(defun perfect-numbers (n)
  (remove-if-not #'perfect-number-p (number-sequence 1 n)))

(provide 'perfect-numbers)
;;; perfect-numbers.el ends here