(defpackage #:atbash-cipher
  (:use #:common-lisp)
  (:export #:encode))

(in-package #:atbash-cipher)

(defun encode (plaintext)
  (let* ((alphabet (loop
		      for c from (char-code #\a) to (char-code #\z)
		      collect (code-char c)))
	 (digits (loop
		    for d from (char-code #\0) to (char-code #\9)
		      collect (code-char d)))
	 (dict (loop
		  for k in (append alphabet digits)
		  for v in (append (reverse alphabet) digits)
		  collect (cons k v))))
    (loop
       with i = 0
       for k across (string-downcase plaintext)
       for v = (assoc k dict)
       when v
       append (cons (cdr v) (when (zerop (rem (incf i) 5))
			      (list #\space))) into chars
       finally (return (string-trim '(#\space) (coerce chars 'string))))))