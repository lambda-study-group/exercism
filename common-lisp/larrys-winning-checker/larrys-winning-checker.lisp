(defpackage :larrys-winning-checker
  (:use :cl)
  (:export
   :make-empty-board
   :make-board-from-list
   :all-the-same-p
   :row
   :column))

(in-package :larrys-winning-checker)

(defun make-empty-board ()
  (make-array '(3 3) :initial-element nil))

(defun make-board-from-list (list)
  (make-array '(3 3) :initial-contents list))

(defun all-the-same-p (row-or-col)
  (= 1 (length (delete-duplicates row-or-col))))

(defun row (board row-num)
  (map 'vector #'(lambda (x) (aref board row-num x)) '(0 1 2)))

(defun column (board col-num)
  (map 'vector #'(lambda (x) (aref board x col-num)) '(0 1 2)))
