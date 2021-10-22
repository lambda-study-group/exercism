;;; hamming.el --- Hamming (exercism)

;;; Commentary:

;;; Code:

(require 'cl)

(defun hamming-distance (s1 s2)
  (if (= (length s1) (length s2))
      (count-if-not #'identity (map 'list #'char-equal s1 s2))
    (error)))

(provide 'hamming)
;;; hamming.el ends here