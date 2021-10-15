(defpackage :log-levels
  (:use :cl)
  (:export :log-message :log-severity :log-format))

(in-package :log-levels)

(defparameter *severity-attributes*
  `(("info" . (:key :everything-ok :format ,#'string-downcase))
    ("warn" . (:key :getting-worried :format ,#'string-capitalize))
    ("ohno" . (:key :run-for-cover :format ,#'string-upcase))))

(defun log-message (log-string)
  (subseq log-string (1+ (position #\space log-string))))

(defun log-severity (log-string)
  (let* ((opening (position #\[ log-string))
	 (closing (position #\] log-string))
	 (severity (string-downcase (subseq log-string (1+ opening) closing)))
	 (sev-attr (cdr (assoc severity *severity-attributes* :test #'string=))))
    (values (getf sev-attr :key)
	    (getf sev-attr :format))))

(defun log-format (log-string)
  (let ((formatting (second (multiple-value-list (log-severity log-string))))
	(msg (log-message log-string)))
    (funcall formatting msg)))
