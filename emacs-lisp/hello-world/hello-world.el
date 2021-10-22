;;; hello-world.el --- Hello World Exercise (exercism)

;;; Commentary:

;;; Code:

(defun hello (&optional name)
  (format "Hello, %s!" (or name "World")))

(provide 'hello-world)
;;; hello-world.el ends here