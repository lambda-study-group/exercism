;;; phone-number.el --- phone-number Exercise (exercism)

;;; Commentary:

;;; Code:

(defun numbers (str)
  (let* ((trimmed (replace-regexp-in-string "[- ().\\+]+" "" str))
         (match (string-match "^1?\\([0-9]\\{10\\}\\)$" trimmed)))
    (if match
        (match-string 1 trimmed)
      "0000000000")))

(defun area-code (str)
  (substring (numbers str) 0 3))

(defun pprint (str)
  (let ((trimmed (numbers str)))
    (string-match "\\([0-9]\\{3\\}\\)\\([0-9]\\{3\\}\\)\\([0-9]\\{4\\}\\)" trimmed)
    (format "(%s) %s-%s"
            (match-string 1 trimmed)
            (match-string 2 trimmed)
            (match-string 3 trimmed))))

(provide 'phone-number)
;;; phone-number.el ends here