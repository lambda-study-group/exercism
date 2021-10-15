(defpackage #:scrabble-score
  (:use #:cl)
  (:export #:score-word))

(in-package #:scrabble-score)

(defun score-letter (letter)
  (case letter
    ((#\A #\E #\I #\O #\U #\L #\N #\R #\S #\T) 1)
    ((#\D #\G) 2)
    ((#\B #\C #\M #\P) 3)
    ((#\F #\H #\V #\W #\Y) 4)
    ((#\K) 5)
    ((#\J #\X) 8)
    ((#\Q #\Z) 10)
    (otherwise 0)))

(defun score-word (word)
  "Word scoring using LOOP"
  (loop
     for c across word
     sum (score-letter (char-upcase c))))

#+nil
(defun score-word (word)
  "Equivalent implementation with MAPCAR and REDUCE"
  (reduce #'+
	  (mapcar #'score-letter
		  (coerce (string-upcase word) 'list))))