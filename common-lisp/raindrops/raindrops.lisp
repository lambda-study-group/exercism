(defpackage #:raindrops
  (:use #:common-lisp)
  (:export #:convert))

(in-package #:raindrops)

(defparameter *sounds*
  '((3 . "Pling")
    (5 . "Plang")
    (7 . "Plong")))

(defun convert (n)
  (loop
     for (divisor . sound) in *sounds*
     if (zerop (mod n divisor))
     collect sound into sounds
     finally (return (if sounds
			 (apply #'concatenate 'string sounds)
			 (princ-to-string n)))))