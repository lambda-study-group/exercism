(defpackage :isbn-verifier
  (:use :cl)
  (:export :validp))

(in-package :isbn-verifier)

(define-condition invalid-character (error)
  ())

(defun char-to-number (c i)
  (cond
    ((char<= #\0 c #\9)
     (- (char-code c) (char-code #\0)))
    ((and (char-equal c #\x) (= i 10)) 10)
    ((char-equal c #\-) nil)
    (t (error 'invalid-character))))

(defun validp (isbn)
  (handler-case (loop
		  with i = 1
		  for c in (coerce isbn 'list)
		  for cc = (char-to-number c i)
		  if cc
		    do (incf i)
		    and collect cc into digits
		  finally (return (and (= 10 (length digits))
				       (zerop (mod (loop
						     for d in digits
						     for i from 10 downto 1
						     sum (* d i)) 11)))))
    (invalid-character ()
      nil)))
