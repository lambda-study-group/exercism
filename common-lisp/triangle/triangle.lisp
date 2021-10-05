(in-package #:cl-user)
(defpackage #:triangle
  (:use #:cl)
  (:export #:triangle))

(in-package #:triangle)

#+nil
(defun trianglep-sort (a b c)
  "Check triangle inequality - sorting"
  (let ((sorted (sort (list a b c) #'>)))
    (< (car sorted) (apply #'+ (cdr sorted)))))

;; 3x faster than the sorting approach above
(defun trianglep (a b c)
  "Check triangle inequality - cyclic permutations."
  (flet ((ineq (a b c)
	   (< a (+ b c))))
    (and (ineq a b c)
	 (ineq b c a)
	 (ineq c a b))))

(defun triangle (a b c)
  "Return type of triangle based on sides A, B and C."
  (if (trianglep a b c)
      (case (length (remove-duplicates (list a b c)))
	(1 :equilateral)
	(2 :isosceles)
	(3 :scalene))
      :illogical))