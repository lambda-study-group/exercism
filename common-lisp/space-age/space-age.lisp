(in-package #:cl-user)
(defpackage #:space-age
  (:use #:common-lisp)
  (:export #:on-earth #:on-mercury #:on-venus #:on-mars #:on-jupiter #:on-saturn #:on-uranus #:on-neptune))

(in-package #:space-age)

(defparameter *earth-year* 31557600)

(defun on-earth (seconds)
  (/ seconds *earth-year*))

(defun on-mercury (seconds)
  (/ seconds *earth-year* 0.2408467))

(defun on-venus (seconds)
  (/ seconds *earth-year* 0.61519726))

(defun on-mars (seconds)
  (/ seconds *earth-year* 1.8808158))

(defun on-jupiter (seconds)
  (/ seconds *earth-year* 11.862615))

(defun on-saturn (seconds)
  (/ seconds *earth-year* 29.447498))

(defun on-uranus (seconds)
  (/ seconds *earth-year* 84.016846))

(defun on-neptune (seconds)
  (/ seconds *earth-year* 164.79132))