#lang racket

(provide leap-year?)

(define (leap-year? year)
  (and (= 0 (remainder year 4))
       (or (not (= 0 (remainder year 100)))
           (= (remainder year 400) 0))))
