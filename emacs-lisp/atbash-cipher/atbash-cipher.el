;;; atbash-cipher.el --- Atbash-Cipher (exercism)

;;; Commentary:




;;; Code:

(defvar *key* "abcdefghijklmnopqrstuvwxyz")

(defun subst (char)
  (let ((pos (position char *key*)))
    (if pos
	(elt *key* (- (length *key*) pos 1))
      char)))

(defun encode (plaintext)
  "Encode PLAINTEXT to atbash-cipher encoding."
  (let ((encoded (map 'string #'subst
		      (replace-regexp-in-string "\\W" ""
						(downcase plaintext)))))
    (with-output-to-string
      (loop
       for c across encoded
       for i from 1
       do (princ (char-to-string c))
       when (and (zerop (mod i 5))
		 (not (= i (length encoded))))
       do (princ " ")))))


(provide 'atbash-cipher)
;;; atbash-cipher.el ends here