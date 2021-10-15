#lang racket

(provide isogram?)

(define (isogram? s)
  (let ([h (make-hash)])
    (for-each (lambda (c) (when (char-alphabetic? c)
                            (hash-update! h (char-downcase c) add1 0)))
              (string->list s))
    (andmap (lambda (x) (= x 1)) (hash-values h))))
