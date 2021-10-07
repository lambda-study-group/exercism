#lang racket

(provide two-fer)

(define (two-fer [name "you"])
  (format "One for ~a, one for me." name))
