(defpackage :gigasecond-anniversary
  (:use :cl)
  (:export :from))
(in-package :gigasecond-anniversary)

(defun from (year month day hour minute second)
  (multiple-value-bind (s m h d mm y)
	(decode-universal-time
	 (+ (encode-universal-time second minute hour day month year 0)
	    1000000000) 0)
    (list y mm d h m s)))
