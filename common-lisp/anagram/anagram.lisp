(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun anagrams-for (word list)
  (flet ((sorted-chars (w)
           (sort (coerce (string-downcase w) 'list) #'char<=)))
    (let ((word-sorted (sorted-chars word)))
      (remove-if
       #'(lambda (s) (or (mismatch word-sorted (sorted-chars s))
                         (string-equal word s)))
       list))))