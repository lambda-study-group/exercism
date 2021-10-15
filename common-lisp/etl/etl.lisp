(in-package #:cl-user)
(defpackage #:etl
  (:use #:common-lisp)
  (:export #:transform))

(in-package #:etl)

(defun transform (hash)
  (loop
     with hash-out = (make-hash-table :test 'equalp)
     for k being the hash-keys in hash
     using (hash-value vs)
     append (loop
               for v in vs
               do (setf (gethash v hash-out) k))
     finally (return hash-out)))