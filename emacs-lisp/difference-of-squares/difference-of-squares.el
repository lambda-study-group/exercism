;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:

(defun square-of-sums (n)
  (expt (reduce #'+ (number-sequence 1 n)) 2))

;; Alternative - using LOOP
;; (defun square-of-sums (n)
;;   (loop
;;    for i from 1 to n
;;    sum i into i-sum
;;    finally (return (expt i-sum 2))))

(defun sum-of-squares (n)
  (reduce #'+
	  (mapcar (lambda (x) (* x x))
		  (number-sequence 1 n))))

;; Alternative - using LOOP
;; (defun sum-of-squares (n)
;;   (loop
;;    for i from 1 to n
;;    summing (expt i 2)))

(defun difference (n)
  (- (square-of-sums n)
     (sum-of-squares n)))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here