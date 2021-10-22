;;; run-length-encoding.el --- run-length-encoding Exercise (exercism)

;;; Commentary:

;;; Code:

(defun run-length-encode (x)
  (with-output-to-string
    (cl-loop
     with prev = nil
     with count = 0
     for c across x
     do (cond ((eq c prev)
	       (incf count))
	      ((null prev)
	       (setf prev c))
	      (t
	       (when (> count 0)
		 (princ (1+ count)))
	       (princ (string prev))
	       (setf prev c)
	       (setf count 0)))
     finally
     (when (> count 0)
       (princ (1+ count)))
     (when c
       (princ (string prev))))))

(defun run-length-decode (x)
  (with-output-to-string
    (cl-loop
     with count = 0
     for c across x
     do (cond ((<= ?0 c ?9)
	       (setf count (+ (* count 10) (- c ?0))))
	      (t
	       (princ (make-string (max 1 count) c))
	       (setf count 0))))))

(provide 'run-length-encoding)
;;; run-length-encoding.el ends here
