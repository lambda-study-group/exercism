(defpackage :character-study
  (:use :cl)
  (:export
   :compare-chars
   :size-of-char
   :change-size-of-char
   :type-of-char))
(in-package :character-study)

(defun compare-chars (char1 char2)
  (cond ((char< char1 char2) :less-than)
	((char> char1 char2) :greater-than)
	(t :equal-to)))

(defun size-of-char (char)
  (cond ((char<= #\a char #\z) :small)
	((char<= #\A char #\Z) :big)
	(t :no-size)))

(defun change-size-of-char (char wanted-size)
  (case wanted-size
    (:big (char-upcase char))
    (:small (char-downcase char))))

(defun type-of-char (char)
  (cond ((or (char<= #\a char #\z)
	     (char<= #\A char #\Z))
	 :alpha)
	((char<= #\0 char #\9)
	 :numeric)
	((char= char #\space)
	 :space)
	((char= char #\newline)
	 :newline)
	(t :unknown)))
