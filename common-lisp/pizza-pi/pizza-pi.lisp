(defpackage :pizza-pi
  (:use :cl)
  (:export :dough-calculator :pizzas-per-cube
           :size-from-sauce :fair-share-p))

(in-package :pizza-pi)

(defparameter *dough-per-cm* 2.25)
(defparameter *dough-constant* 200)
(defparameter *sauce-per-cm2* 0.3)
(defparameter *cheese-g-per-cm3* 0.5)
(defparameter *cheese-g-per-cm2* 3.0)
(defparameter *slices-per-pizza* 8)

(defun square (x)
  (* x x))

(defun cube (x)
  (* x x x))

(defun dough-calculator (pizzas diameter)
  (round (* pizzas (+ *dough-constant*
		      (* pi diameter *dough-per-cm*)))))

(defun size-from-sauce (sauce)
  (sqrt (/ (* 40 sauce) (* 3 pi))))

(defun pizzas-per-cube (cube-size diameter)
  (floor (/ (* 2 (cube cube-size))
	    (* 3 pi (square diameter)))))

(defun fair-share-p (pizzas friends)
  (zerop (mod (* pizzas *slices-per-pizza*) friends)))
