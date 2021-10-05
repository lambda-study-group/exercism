(defpackage #:school
  (:use #:common-lisp)
  (:export #:make-school #:add #:grade-roster #:grade #:sorted))

(in-package #:school)

(defun make-school ()
  '())

(defmacro add (school student grade)
  `(let ((g (assoc ,grade ,school)))
     (if g
         (push ,student (cdr g))
         (push (list ,grade ,student) ,school))))

(defun grade (school grade)
  (cdr (assoc grade school)))

(defun grade-roster (school &key sort)
  (loop
     for (grade . students)
     in (if sort (sort school #'< :key #'car) school)
     collect (list :grade grade
                   :students (if sort (sort students #'string<) students))))

(defun sorted (school)
  (grade-roster school :sort t))