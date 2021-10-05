(defpackage :key-comparison
  (:use :cl)
  (:export
   :key-object-identity
   :key-numbers
   :key-numbers-of-different-types
   :key-characters
   :key-characters-case-insensitively
   :key-strings
   :key-strings-case-insensitively
   :key-conses-of-symbols
   :key-conses-of-characters
   :key-conses-of-numbers
   :key-conses-of-characters-case-insensitively
   :key-conses-of-numbers-of-different-types
   :key-arrays
   :key-arrays-loosely))
(in-package :key-comparison)

(defun key-object-identity (x y)
  (eq x y))
(defun key-numbers (x y)
  (eq x y))
(defun key-numbers-of-different-types (x y)
  (= x y))
(defun key-characters (x y)
  (char= x y))
(defun key-characters-case-insensitively (x y)
  (char-equal x y))
(defun key-strings (x y)
  (string= x y))
(defun key-strings-case-insensitively (x y)
  (string-equal x y))
(defun key-conses-of-symbols (x y)
  (and (eql (car x) (car y))
       (eql (cdr x) (cdr y))))
(defun key-conses-of-characters (x y)
  (and (char= (car x) (car y))
       (char= (cdr x) (cdr y))))
(defun key-conses-of-numbers (x y)
  (and (eq (car x) (car y))
       (eq (cdr x) (cdr y))))
(defun key-conses-of-characters-case-insensitively (x y)
  (and (char-equal (car x) (car y))
       (char-equal (cdr x) (cdr y))))
(defun key-conses-of-numbers-of-different-types (x y)
  (and (= (car x) (car y))
       (= (cdr x) (cdr y))))
(defun key-arrays (x y)
  (equal x y))
(defun key-arrays-loosely (x y)
  (equalp x y))
