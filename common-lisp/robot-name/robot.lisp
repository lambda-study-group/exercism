(in-package #:cl-user)
(defpackage #:robot
  (:use #:common-lisp)
  (:export #:build-robot #:robot-name #:reset-name))

(in-package #:robot)

(defparameter *used-names* nil)

(defun fresh-name ()
  (let* ((base (char-code #\A))
	 (name (format nil "~c~c~3,'0d"
		       (code-char (+ base (random 26)))
		       (code-char (+ base (random 26)))
                       (random 1000))))
    (if (member name *used-names* :test #'string=)
	(fresh-name)
	(progn
	  (push name *used-names*)
	  name))))

(defstruct robot
  (name (fresh-name)))

(defun build-robot ()
  (make-robot))

(defun reset-name (robot)
  (setf (robot-name robot)
	(fresh-name)))