(defpackage :lucys-magnificent-mapper
  (:use :cl)
  (:export :make-magnificent-maybe :only-the-best))

(in-package :lucys-magnificent-mapper)

;; Define make-magnificent-maybe function
(defun make-magnificent-maybe (func list)
  (mapcar func list))

;; Define only-the-best function
(defun only-the-best (filter list)
  (remove-if #'(lambda (x) (or (= 1 x) (funcall filter x))) list))
