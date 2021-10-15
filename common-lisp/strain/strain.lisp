(defpackage #:strain
  (:use #:common-lisp)
  (:export #:keep #:discard))

(in-package #:strain)

#+nil
(defun keep (pred seq)
  "Head-recursive implementation"
  (cond ((null seq) nil)
	((funcall pred (car seq))
	 (cons (car seq) (keep pred (cdr seq))))
	(t (keep pred (cdr seq)))))

#+nil
(defun discard (pred seq)
  "Head-recursive implementation"
  (cond ((null seq) nil)
	((funcall pred (car seq))
	 (discard pred (cdr seq)))
	(t (cons (car seq) (discard pred (cdr seq))))))

(defun keep (pred seq)
  "Tail-recursive implementation"
  (labels ((tail-keep (pred seq acc)
	     (cond ((null seq) (nreverse acc))
		   ((funcall pred (car seq))
		    (tail-keep pred (cdr seq) (cons (car seq) acc)))
		   (t (tail-keep pred (cdr seq) acc)))))
    (tail-keep pred seq nil)))

(defun discard (pred seq)
  "Tail-recursive implementation"
  (labels ((tail-discard (pred seq acc)
	     (cond ((null seq) (nreverse acc))
		   ((funcall pred (car seq))
		    (tail-discard pred (cdr seq) acc))
		   (t (tail-discard pred (cdr seq) (cons (car seq) acc))))))
    (tail-discard pred seq nil)))