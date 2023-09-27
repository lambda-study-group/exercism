(defpackage :sum-of-multiples
  (:use :cl)
  (:export :sum))

(in-package :sum-of-multiples)

(defun sum (factors limit)
  (loop
    for i from 1 below limit
    if (some #'(lambda (f) (ignore-errors (zerop (mod i f)))) factors)
      sum i))
