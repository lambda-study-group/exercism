(in-package #:cl-user)
(defpackage #:acronym
  (:use #:common-lisp)
  (:export #:acronym))

(in-package #:acronym)

(defun acronym (string)
  "Find acronym withoud depending on CL-PPCRE."
  (loop
     for prev = nil then c
     for c across string
     when (or (null prev)
              (and (upper-case-p c) (lower-case-p prev))
              (member prev '(#\- #\space)))
     collect (char-upcase c) into acr
     finally (return (coerce acr 'string))))