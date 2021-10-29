;;; acronym.el --- Acronym (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun acronym (s)
  (cl-loop
   with 1st = t
   with acro = nil
   for c across (upcase s)
   do
   (cond ((and (<= ?A c ?Z) 1st)
	  (push c acro)
	  (setf 1st nil))
	 ((<= ?A c ?Z)
	  (setf 1st nil))
	 (t (setf 1st t)))
   finally (return (apply #'string (nreverse acro)))))

(provide 'acronym)
;;; acronym.el ends here
