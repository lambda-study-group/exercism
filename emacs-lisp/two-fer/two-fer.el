;;; hello-world.el --- Hello World Exercise (exercism)

;;; Commentary:

;;; Code:

(defun two-fer (&optional who)
  (format "One for %s, one for me." (or who "you")))

(provide 'two-fer)
;;; hello-world.el ends here