#lang racket/base

(require "difference-of-squares.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define suite
    (test-suite
     "difference of squares"

     (test-eqv? "square-of-sum-to-5" (square-of-sum 5) 225)
     (test-eqv? "sum-of-squares-to-5" (sum-of-squares 5) 55)
     (test-eqv? "difference-of-squares-to-5" (difference 5) 170)
     (test-eqv? "square-of-sum-to-10" (square-of-sum 10) 3025)
     (test-eqv? "sum-of-squares-to-10"  (sum-of-squares 10) 385)
     (test-eqv? "difference-of-squares-to-10" (difference 10) 2640)
     (test-eqv? "square-of-sum-to-100" (square-of-sum 100) 25502500)
     (test-eqv? "sum-of-squares-to-100" (sum-of-squares 100) 338350)
     (test-eqv? "difference-of-squares-to-100" (difference 100) 25164150)))

  (run-tests suite))
