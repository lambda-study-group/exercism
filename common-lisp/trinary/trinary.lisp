(defpackage #:trinary
  (:use #:common-lisp)
  (:export #:to-decimal))

(in-package #:trinary)

(defun digit-to-value (digit)
  (ecase digit
    (#\0 0)
    (#\1 1)
    (#\2 2)))

(defun to-decimal (str)
  (or (ignore-errors
	(loop
	   for weight = 1 then (* weight 3)
	   for digit in (reverse (coerce str 'list))
	   sum (* weight (digit-to-value digit))))
      0))