(defpackage #:leap
  (:use #:common-lisp)
  (:export #:leap-year-p))
(in-package #:leap)

(defun leap-year-p (year)
  (cond
    ((zerop (mod year 400)) t)
    ((zerop (mod year 100)) nil)
    ((zerop (mod year 4)) t)
    (t nil)))