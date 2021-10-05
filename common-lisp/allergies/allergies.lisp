(in-package #:cl-user)
(defpackage #:allergies
  (:use #:common-lisp)
  (:shadow #:list)
  (:export #:allergic-to-p #:list))

(in-package #:allergies)

(defun allergic-to-p (score item)
  (member item (list score) :test #'string-equal))

(defun number-to-revbits (n)
  "Convert number N to a list of T/NIL switches starting from LSB."
  (loop
     with num = n
     with rem = nil
     do (multiple-value-setq (num rem) (truncate num 2))
     collect (not (zerop rem)) into bits
     until (zerop num)
     finally (return bits)))

(defun list (n)
  (loop
     for present in (number-to-revbits n)
     for item in '("eggs" "peanuts" "shellfish" "strawberries" "tomatoes"
		   "chocolate" "pollen" "cats")
     when present
     collect item))