;;; trinary.el --- Trinary (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun trinary-to-decimal (n)
  (cl-loop
   with result = 0
   for c across n
   if (<= ?0 c ?9)
   do (setf result (+ (* result 3) (- c ?0)))
   else return 0
   finally (return result)))

(provide 'trinary)
;;; trinary.el ends here
