(defpackage :binary-search
  (:use :cl)
  (:export :binary-find :value-error))

(in-package :binary-search)

(defun binary-find (arr el)
  (labels ((recursive-find (lo hi)
	     (unless (= lo hi)
	       (let* ((mid (truncate (+ lo hi) 2))
		      (mid-el (aref arr mid)))
		 (cond ((= el mid-el) mid)
		       ((< el mid-el)
			(recursive-find lo mid))
		       (t
			(recursive-find (1+ mid) hi)))))))
    (recursive-find 0 (length arr))))
