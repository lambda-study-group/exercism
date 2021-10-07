#lang racket

(require math/number-theory)

(provide classify)


(define (classify n)
  (let ([aliquot (foldl + 0 (drop-right (divisors n) 1))])
    (cond [(< aliquot n) 'deficient]
          [(> aliquot n) 'abundant]
          [#t 'perfect])))
