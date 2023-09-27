(defpackage :matching-brackets
  (:use :cl)
  (:export :pairedp))

(in-package :matching-brackets)

(defvar *matching-pairs* '((#\[ . #\]) (#\( . #\)) (#\{ . #\})))

(defun pairedp (value)
  (loop
    with stack = '()
    with closing = (mapcar #'cdr *matching-pairs*)
    for c in (coerce value 'list)
    do (cond
	 ((assoc c *matching-pairs*) (push c stack))
	 ((member c closing)
	  (if (and stack (eq (cdr (assoc (car stack) *matching-pairs*)) c))
	      (pop stack)
	      (return-from pairedp nil))))
    finally (return (null stack))))
