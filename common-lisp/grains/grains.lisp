(in-package #:cl-user)
(defpackage #:grains
  (:use #:cl)
  (:export :square :total))
(in-package #:grains)

(defun square (n)
  (expt 2 (1- n)))

(defun total ()
  (1- (expt 2 64)))