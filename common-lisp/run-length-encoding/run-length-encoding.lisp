(defpackage :run-length-encoding
  (:use :cl)
  (:export :encode
   :decode))

(in-package :run-length-encoding)

(defun encode (plain)
  (loop
    with alist = '()
    for c in (coerce plain 'list)
    if (not (eq (cadar alist) c))
      do (push (list 0 c) alist)
    do (incf (caar alist))
    finally (return (format nil "~{~[~;~:;~:*~d~]~c~}"  (mapcan #'identity (reverse alist))))))

(defun decode (compressed)
  (loop
    with i = 0
    with n = 0
    while (< i (length compressed))
    do (multiple-value-bind (nn ii)
	   (parse-integer compressed :start i :junk-allowed t)
	 (if nn
	     (if (eq (elt compressed i) #\space)
		 (setf n 1)
		 (setf n nn i ii))
	     (setf n 1)))
    collect (cons n (elt compressed i)) into groups
    do (incf i)
    finally (return (with-output-to-string (s)
		      (mapc #'(lambda (g) (princ (make-string (car g) :initial-element (cdr g)) s)) groups)))))
