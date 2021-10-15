(defpackage :high-scores
  (:use :cl)
  (:export :make-high-scores-table :add-player
           :set-score :get-score :remove-player))

(in-package :high-scores)

;; Define make-high-scores-table function
(defun make-high-scores-table ()
  (make-hash-table))

;; Define add-player function
(defun add-player (hs player)
  (setf (gethash player hs) 0))

;; Define set-score function
(defun set-score (hs player score)
  (setf (gethash player hs) score))

;; Define get-score function
(defun get-score (hs player)
  (gethash player hs 0))

;; Define remove-player function
(defun remove-player (hs player)
  (remhash player hs))
