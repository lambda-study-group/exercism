#lang racket

(require srfi/1)

(provide armstrong-number?)

(define (armstrong-number? n)
  (let ([digits (unfold zero?
                        (lambda (x) (remainder x 10))
                        (lambda (x) (quotient x 10))
                        n)])
    (= n (foldl + 0 (map (curryr expt (length digits)) digits)))))
