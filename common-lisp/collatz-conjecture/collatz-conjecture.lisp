(defpackage #:collatz-conjecture
  (:use #:common-lisp)
  (:export #:collatz))

(in-package #:collatz-conjecture)

;; Naive version
#+nil
(defun collatz-step (n)
  (if (evenp n)
      (/ n 2)
      (1+ (* n 3))))

;; Optimized version
(defun collatz-step (n)
  (if (zerop (logand n 1))
      (ash n -1)
      (1+ (+ n (ash n 1)))))

(defun collatz (n)
  (when (plusp n)
    (loop
       for i = 0 then (1+ i)
       for num = n then (collatz-step num)
       until (= num 1)
       finally (return i))))