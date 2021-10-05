(in-package #:cl-user)
(defpackage #:phrase
  (:use #:cl)
  (:export #:word-count))
(in-package #:phrase)

(ql:quickload :cl-ppcre)

(defun word-count (str)
  (loop
     with freq = nil
     for s in (cl-ppcre:all-matches-as-strings "\\w+" str)
     for lookup = (assoc (string-downcase s) freq :test #'string=)
     if lookup do (incf (cdr lookup))
     else do (push (cons (string-downcase s) 1) freq)
     finally (return freq)))