(defpackage #:prime-factors
  (:use #:common-lisp)
  (:export :factors-of))

(in-package #:prime-factors)

(defun primep (n)
  "Naive, but certain primality test"
  (loop
     for i from 2 to (isqrt n)
     never (zerop (mod n i))))

(defun next-prime (n)
  (loop
     for i from (1+ n)
     until (primep i)
     finally (return i)))

(defun factors-of (n)
  (loop
     with factors = nil
     with factor = 2
     until (= n 1)
     do (multiple-value-bind (quotient remainder)
	    (truncate n factor)
	  (if (zerop remainder)
	      (progn (push factor factors)
		     (setf n quotient))
	      (setf factor (next-prime factor))))
     finally (return (reverse factors))))