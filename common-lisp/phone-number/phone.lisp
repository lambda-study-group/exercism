(in-package #:cl-user)
(defpackage #:phone
  (:use #:common-lisp)
  (:export #:numbers #:area-code #:pretty-print))

(in-package #:phone)

(ql:quickload :cl-ppcre)

(defun numbers (number)
  (let ((digits (cl-ppcre:all-matches-as-strings "[0-9]" number)))
    (cond
      ((and (= (length digits) 11) (string= (car digits) "1"))
       (apply #'concatenate 'string (cdr digits)))
      ((= (length digits) 10)
       (apply #'concatenate 'string digits))
      (t (make-string 10 :initial-element #\0)))))

(defun %area-code (normalized)
  (subseq normalized 0 3))

(defun %exchange-code (normalized)
  (subseq normalized 3 6))

(defun %subscriber-number (normalized)
  (subseq normalized 6))

(defun area-code (number)
  (%area-code (numbers number)))

(defun pretty-print (number)
  (let ((normalized (numbers number)))
    (format nil "(~d) ~d-~d"
            (%area-code normalized)
            (%exchange-code normalized)
            (%subscriber-number normalized))))