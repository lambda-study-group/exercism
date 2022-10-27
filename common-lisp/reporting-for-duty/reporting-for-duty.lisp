(defpackage :reporting-for-duty
  (:use :cl)
  (:export :format-quarter-value :format-two-quarters
           :format-two-quarters-for-reading))

(in-package :reporting-for-duty)

;; Define format-quarter-value function.
(defun format-quarter-value (which value)
  (format nil "The value ~a quarter: ~a" which value))

;; Define format-two-quarters function.
(defun format-two-quarters (stream which1 value1 which2 value2)
  (format stream "~%~a~%~a~%"
	  (format-quarter-value which1 value1)
	  (format-quarter-value which2 value2)))

;; Define format-two-quarters-for-reading function.
(defun format-two-quarters-for-reading (stream which1 value1 which2 value2)
  (format stream "(\"~a\" \"~a\")"
	  (format-quarter-value which1 value1)
	  (format-quarter-value which2 value2)))
