(defpackage :say
  (:use :cl)
  (:export :say))

(in-package :say)

(defun say (number)
  (when (< -1 number 1e12)
    (format nil "~r" number)))
