;;; grains.el --- Grains exercise (exercism)

;;; Commentary:

;;; Code:

(require 'calc)

(defun square (n)
  (ash 1 (1- n)))

(defun total ()
  (1- (square 65)))

(provide 'grains)
;;; grains.el ends here
