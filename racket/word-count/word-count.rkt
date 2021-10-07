#lang racket

(provide word-count)

(define (word-count str)
  (let ([h (make-hash)])
    (for-each (lambda (w) (hash-update! h (string-downcase w) add1 0))
              (regexp-match* #px"\\w+'\\w+|\\w+" str))
    h))
