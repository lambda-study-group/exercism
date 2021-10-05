(in-package #:cl-user)
(defpackage #:dna
  (:use #:cl)
  (:export #:to-rna))
(in-package #:dna)

(defparameter transcriber '(#\C #\G
			    #\G #\C
			    #\A #\U
			    #\T #\A))

(defun to-rna (str)
  "Transcribe a string representing DNA nucleotides to RNA."
  (loop
     for c across str
     for tr = (or (getf transcriber c) (error 'error))
     collect tr into out
     finally (return (coerce out 'string))))