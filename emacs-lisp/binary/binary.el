;;; binary.el --- Binary exercise (exercism)

;;; Commentary:

;;; Code:

(defun to-decimal (binary)
  (cl-block to-decimal
    (reduce (lambda (acc c) (+ (ash acc 1)
			       (case c
				 (?1 1)
				 (?0 0)
				 (otherwise (return-from to-decimal 0)))))
	    binary
	    :initial-value 0)))

(provide 'binary)
;;; binary.el ends here