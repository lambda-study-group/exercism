;;; raindrops.el --- Raindrops (exercism)

;;; Commentary:

;;; Code:

(require 'cl)



(defun convert (n)
  "Convert integer N to its raindrops string."
  (let ((onomatopoeia
	 (with-output-to-string
	   (when (zerop (mod n 3))
	     (princ "Pling"))
	   (when (zerop (mod n 5))
	     (princ "Plang"))
	   (when (zerop (mod n 7))
	     (princ "Plong")))))
    (if (string-empty-p onomatopoeia)
	(prin1-to-string n)
      onomatopoeia)))



(provide 'raindrops)
;;; raindrops.el ends here