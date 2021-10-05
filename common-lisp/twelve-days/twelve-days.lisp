(in-package #:cl-user)
(defpackage #:twelve-days
  (:use #:cl)
  (:export #:recite))

(in-package #:twelve-days)

(defparameter *day-to-gift*
  '("a Partridge in a Pear Tree"
    "two Turtle Doves"
    "three French Hens"
    "four Calling Birds"
    "five Gold Rings"
    "six Geese-a-Laying"
    "seven Swans-a-Swimming"
    "eight Maids-a-Milking"
    "nine Ladies Dancing"
    "ten Lords-a-Leaping"
    "eleven Pipers Piping"
    "twelve Drummers Drumming"))

(defun verse (n &key (stream nil))
  (format stream "On the ~:r day of Christmas my true love gave to me: ~{~a~#[~;, and ~:;, ~]~}."
	  n (reverse (subseq *day-to-gift* 0 n))))

(defun recite (&optional begin end)
  (cond ((and (null begin) (null end))
	 (recite 1 12))
	((null end)
	 (verse begin))
	(t
	 (with-output-to-string (s)
	   (loop for i from begin to end
		 do (fresh-line s)
		 (verse i :stream s))))))
