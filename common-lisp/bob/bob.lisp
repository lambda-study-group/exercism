(in-package #:cl-user)
(defpackage #:bob
  (:use #:cl)
  (:export #:response-for))
(in-package #:bob)

(defun emptyp (input)
  (string= "" (string-trim '(#\space #\tab #\newline) input)))

(defun shoutingp (input)
  (and (string= input (string-upcase input))
       (string/= input (string-downcase input))))

(defun questionp (input)
  (char= (aref input (1- (length input))) #\?))

(defun response-for (input)
  (cond
    ((emptyp input) "Fine. Be that way!")
    ((shoutingp input) "Whoa, chill out!")
    ((questionp input) "Sure.")
    (t "Whatever.")))