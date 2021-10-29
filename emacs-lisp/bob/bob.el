;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:

(defun shouting? (line)
  (and (string= line (upcase line))
       (not (string= line (downcase line)))))

(defun alt-shouting? (line)
  "Alternative implementation of SHOUTING?, using regex character
classes (suitable for Unicode)."
  (let ((case-fold-search nil))
    (and (string-match "[[:upper:]]" line)
	 (not (string-match "[[:lower:]]" line)))))

(defun question? (line)
  (equal (last (string-to-list line)) '(??)))

(defun silence? (line)
  (string-empty-p line))

(defun response-for (line)
  (let ((line (string-trim line)))
    (cond ((alt-shouting? line) "Whoa, chill out!")
	  ((question? line) "Sure.")
	  ((silence? line) "Fine. Be that way!")
	  (t "Whatever."))))

(provide 'bob)
;;; bob.el ends here