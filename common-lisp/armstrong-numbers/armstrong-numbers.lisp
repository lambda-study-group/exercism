(in-package #:cl-user)
(defpackage #:armstrong-numbers
  (:use #:cl #:alexandria)
  (:export #:armstrong-number-p))
(in-package #:armstrong-numbers)

(defun armstrong-number-p (number)
  (let* ((digits (loop
		   for n = number then (truncate n 10)
		   while (plusp n)
		   collect (mod n 10)))
	 (n-digits (length digits)))
    (= number
       (reduce #'+
	       (mapcar (rcurry #'expt n-digits) digits)))))
