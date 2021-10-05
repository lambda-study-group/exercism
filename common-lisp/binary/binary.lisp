(defpackage #:binary
  (:use #:cl)
  (:export #:to-decimal))

(in-package #:binary)

(defun to-decimal (n)
  (or (parse-integer (coerce (remove-if-not #'(lambda (c) (member c '(#\0 #\1)))
					    (coerce n 'list)) 'string)
		     :radix 2
		     :junk-allowed t)
      0))