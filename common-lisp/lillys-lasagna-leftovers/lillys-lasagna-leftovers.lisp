(defpackage :lillys-lasagna-leftovers
  (:use :cl)
  (:export
   :preparation-time
   :remaining-minutes-in-oven
   :split-leftovers))

(in-package :lillys-lasagna-leftovers)

(defparameter *cooking-time* 337)

;; Define function preparation-time
(defun preparation-time (&rest ingredients)
  (* 19 (length ingredients)))

;; Define function remaining-minutes-in-oven
(defun remaining-minutes-in-oven (&optional (modifier nil modifier-supplied))
  (print (list modifier modifier-supplied))
  (if modifier-supplied
      (case modifier
	(:normal *cooking-time*)
	(:shorter (- *cooking-time* 100))
	(:very-short (- *cooking-time* 200))
	(:longer (+ *cooking-time* 100))
	(:very-long (+ *cooking-time* 200))
	(t 0))
      *cooking-time*))

;; Define function split-leftovers
(defun split-leftovers (&key (weight nil weight-supplied) (human 10) (alien 10))
  (cond ((null weight-supplied) :just-split-it)
	((null weight) :looks-like-someone-was-hungry)
	(t (- weight human alien))))
