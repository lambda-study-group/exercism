#lang racket

(provide encode decode)

;;; Both of these should expect to take a variable number of arguments.
;;; You may wish to make a version that accepts a single argument first
;;; as that will make debugging easier.
(define (encode . nums))

(define (decode . nums))
