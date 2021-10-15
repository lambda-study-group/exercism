(in-package #:cl-user)
(defpackage #:pascal
  (:use #:cl)
  (:export #:rows))
(in-package #:pascal)

(defun advance-row (prev)
  (loop
     with nums = '(1)
     for (x . y) on prev while y 
     do (push (+ x (car y)) nums)
     finally (return (cons 1 nums))))

(defun rows (n)
  (labels ((pascal (n acc)
	     (if (zerop n)
		 (reverse acc)
		 (pascal (1- n) (cons (advance-row (car acc)) acc)))))
    (if (<= n 0) nil (pascal (1- n) '((1))))))