(in-package #:cl-user)
(defpackage #:two-fer
  (:use #:cl)
  (:export #:twofer))
(in-package #:two-fer)

(defun twofer (name)
  (format nil "One for ~:[you~;~:*~a~], one for me." name))
