(in-package #:cl-user)
(defpackage #:luhn
  (:use #:cl)
  (:export #:is-valid))

(in-package #:luhn)

(defun %trim-and-validate (input)
  "Trim spaces from INPUT, check if it only contains valid characters
and return a list of digits. Return second value indicating whether
INPUT is valid."
  (loop
    for c across input
    when (char<= #\0 c #\9)
      collect (- (char-code c) (char-code #\0)) into trimmed
    when (not (or (char<= #\0 c #\9)
                  (char= c #\space)))
      do (return (values nil nil))
    finally (return (values trimmed t))))

(defun is-valid (input)
  (multiple-value-bind (digits valid)
      (%trim-and-validate input)
    (when (and valid (> (length digits) 1))
      (loop
        for i from 1
        for d in (reverse digits)
        sum (if (oddp i)
                d
                (let ((2d (* d 2)))
                  (if (> 2d 9) (- 2d 9) 2d))) into s
        finally (return (zerop (mod s 10)))))))
