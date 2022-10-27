(defpackage :diamond
  (:use :cl)
  (:export :rows))

(in-package :diamond)

(defun row (letter offset middle)
  (format nil "~a~a~a"
	  (make-string offset :initial-element #\space)
	  (if (plusp middle)
	      (format nil "~c~a~c" letter (make-string middle :initial-element #\space) letter)
	      (string letter))
	  (make-string offset :initial-element #\space)))

(defun rows (letter)
  (let* ((a-code (char-code #\A))
	 (l-code (char-code letter))
	 (n (- l-code a-code))
	 (half (loop for i from 0 to n collect (row (code-char (+ a-code n (- i)))
						    i
						    (1- (* 2 (- n i)))))))
    (append (reverse (cdr half)) half)))
