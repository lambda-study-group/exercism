(defpackage :logans-numeric-partition
  (:use :cl)
  (:export :categorize-number :partition-numbers))

(in-package :logans-numeric-partition)

;; Define categorize-number function
(defun categorize-number (pair number)
  (if (oddp number)
      (cons (cons number (car pair)) (cdr pair))
      (cons (car pair) (cons number (cdr pair)))))

;; Define partition-numbers function
(defun partition-numbers (numbers)
  (reduce #'categorize-number numbers :initial-value '(() . ())))
