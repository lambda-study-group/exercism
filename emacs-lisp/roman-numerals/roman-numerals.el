;;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'rst)

(defun to-roman (n)
  (rst-arabic-to-roman n))

(provide 'roman-numerals)
;;; roman-numerals.el ends here