(defpackage #:isogram
  (:use #:cl)
  (:export #:is-isogram))

(in-package #:isogram)

(defun is-isogram (string)
  "Is string an Isogram?"
  (let ((chars (mapcar #'char-downcase
		       (remove-if-not #'alpha-char-p
				      (coerce string 'list)))))
    (equal chars (remove-duplicates chars))))