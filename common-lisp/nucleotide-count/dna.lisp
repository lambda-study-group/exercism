(in-package #:cl-user)
(defpackage #:dna
  (:use #:common-lisp)
  (:export #:dna-count #:nucleotide-counts #:invalid-nucleotide))

(in-package #:dna)

(define-condition invalid-nucleotide (error)
  ())

(defun init-hash ()
  (loop
     with hash = (make-hash-table :test #'eql)
     for c in '(#\C #\G #\T #\A)
     do (setf (gethash c hash) 0)
     finally (return hash)))

(defun nucleotide-counts (dna)
  (loop
     with hash = (init-hash)
     for c across dna
     if (member c '(#\C #\G #\T #\A) :test #'char=)
     do (incf (gethash c hash))
     else
     do (error 'invalid-nucleotide)
     finally (return hash)))

(defun dna-count (base dna)
  (if (member base '(#\C #\G #\T #\A) :test #'char=)
      (gethash base (nucleotide-counts dna))
      (error 'invalid-nucleotide)))