#lang racket

(provide sum-of-squares square-of-sum difference)

(define (sum-of-squares n)
  (foldl + 0 (map (curryr expt 2) (range 1 (add1 n)))))

(define (square-of-sum n)
  (expt (foldl + 0 (range 1 (add1 n))) 2))

(define (difference n)
  (- (square-of-sum n) (sum-of-squares n)))
