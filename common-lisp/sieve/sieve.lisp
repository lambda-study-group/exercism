(defpackage #:sieve
  (:use #:cl)
  (:export #:primes-to)
  (:documentation "Generates a list of primes up to a given limit."))

(in-package #:sieve)

(defun primes-to (n)
  (loop
     with numbers = (loop for i from 2 to n collect (list i))
     for prime = (car numbers)
     while prime
     collect (car prime) into primes
     do (loop
	   for i in numbers
	   if (zerop (rem (car i) (car prime)))
	   do (setf (cdr i) t))
       (setf numbers (member nil (cdr numbers) :key #'cdr))
     finally (return primes)))