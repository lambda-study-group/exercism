(in-package #:cl-user)

(ql:quickload :cl-ppcre)

(defpackage #:crypto-square
  (:use #:cl #:cl-ppcre)
  (:export #:encipher))
(in-package #:crypto-square)

(defun normalize (text)
  (string-downcase (cl-ppcre:regex-replace-all "[^a-zA-z]" text "")))

(defun rectangle-columns (n)
  "Return rectangle dimensions (ROWS COLUMNS)."
  (ceiling (sqrt n)))

(defun to-chunks (str chunk-length)
  (loop
     for len = (min chunk-length (length str))
     for chunk = (subseq str 0 len)
     until (string= str "")
     do (setf str (subseq str len))
     collect (format nil "~va" chunk-length chunk)))

(defun encipher (plaintext)
  (let* ((normalized (normalize plaintext))
	 (chunk-length (rectangle-columns (length normalized)))
	 (chunks (mapcar #'(lambda (s) (coerce s 'list))
			 (to-chunks normalized chunk-length)))
	 (transposed (apply #'mapcar #'list chunks))
	 (reassembled (mapcar #'(lambda (s)
				  (string-trim '(#\space)
					       (coerce s 'string))) transposed)))
    (format nil "~{~a~^ ~}" reassembled)))