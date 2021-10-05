(defpackage #:roman
  (:use #:cl)
  (:export #:romanize))

(in-package #:roman)

(defun romanize (n)
  (format nil "~@r" n))