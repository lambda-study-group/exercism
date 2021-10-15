(in-package #:cl-user)
(defpackage #:all-your-base
  (:use #:common-lisp)
  (:export #:rebase))

(in-package #:all-your-base)

(defun rebase (list-digits in-base out-base)
  (ignore-errors
   ;; Check for any of the special conditions
   (assert (> in-base 1))
   (assert (> out-base 1))
   (assert (notany #'minusp list-digits))
   (assert (notany #'(lambda (d) (>= d in-base)) list-digits))
   (unless list-digits
     (return-from rebase '(0)))
   (loop
     with in-number = (reduce #'(lambda (a b)
                                  (+ (* a in-base) b))
                              list-digits)
     with out-digits = nil
     do (multiple-value-bind (rem dig)
            (truncate in-number out-base)
          (setf in-number rem)
          (push dig out-digits))
     until (zerop in-number)
     finally (return out-digits))))
