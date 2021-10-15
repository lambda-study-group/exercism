#lang racket/base

(require "perfect-numbers.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define suite
    (test-suite
     "perfect numbers tests"

     (test-equal? "Smallest perfect number"
                  (classify 6)
                  'perfect)

     (test-equal? "Medium perfect number"
                  (classify 28)
                  'perfect)

     (test-equal? "Large perfect number"
                  (classify 33550336)
                  'perfect)

     (test-equal? "Smallest prime deficient number"
                  (classify 2)
                  'deficient)

     (test-equal? "Smallest non-prime deficient number"
                  (classify 4)
                  'deficient)

     (test-equal? "Medium deficient number"
                  (classify 33550337)
                  'deficient)

     (test-equal? "Large deficient number"
                  (classify 33550337)
                  'deficient)

     (test-equal? "Edge case (no factors other than itself)"
                  (classify 1)
                  'deficient)

     (test-equal? "Smallest abundant number"
                  (classify 12)
                  'abundant)

     (test-equal? "Medium abundant number"
                  (classify 30)
                  'abundant)

     (test-equal? "Large abundant number"
                  (classify 33550335)
                  'abundant)))

  (run-tests suite))
