(defpackage #:perfect-numbers
  (:use #:common-lisp)
  (:export #:classify))

(in-package #:perfect-numbers)

(defun factors (n)
  (loop
     for i from 1 below (ceiling (/ (1+ n) 2))
     when (zerop (mod n i))
     collect i))

(defun classify (n)
  (when (plusp n)
   (let ((aliquot (reduce #'+ (factors n))))
     (cond
       ((< aliquot n) "deficient")
       ((> aliquot n) "abundant")
       (t "perfect")))))