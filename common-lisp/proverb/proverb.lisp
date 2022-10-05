(defpackage :proverb
  (:use :cl)
  (:export :recite))

(in-package :proverb)

(defun recite (strings)
  (loop
    for (cause effect) on strings
    while effect
    collect (format nil "For want of a ~a the ~a was lost."
		    cause effect) into causation
    finally (return (format nil "~{~a~^~%~}"
			    (append causation
				    (when strings
				      (list (format nil "And all for the want of a ~a." (car strings)))))))))
