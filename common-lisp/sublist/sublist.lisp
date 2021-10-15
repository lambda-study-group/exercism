(defpackage #:sublist
  (:use #:common-lisp)
  (:export #:sublist))

(in-package #:sublist)

(defun sublist (list1 list2)
  "what is list1 of list2 (sublist, superlist, equal or unequal)"
  (let ((1in2 (search list1 list2))
        (2in1 (search list2 list1)))
    (cond
      ((and 1in2 2in1) "equal")
      (1in2 "sublist")
      (2in1 "superlist")
      (t "unequal"))))