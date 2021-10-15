#lang racket/base

; Tests adapted from canonical-data.json v1.1.0
(require "armstrong-numbers.rkt")

(module+ test
  (require rackunit rackunit/text-ui)
  (run-tests
   (test-suite "armstrong-numbers tests"
               (test-true "Zero is an Armstrong number"
                          (armstrong-number? 0))
               (test-true "Single digit numbers are Armstrong numbers"
                          (armstrong-number? 5))
               (test-false "There are no 2 digit Armstrong numbers"
                           (armstrong-number? 10))
               (test-true "Three digit number that is an Armstrong number"
                          (armstrong-number? 153))
               (test-false "Three digit number that is not an Armstrong number"
                           (armstrong-number? 100))
               (test-true "Four digit number that is an Armstrong number"
                          (armstrong-number? 9474))
               (test-false "Four digit number that is not an Armstrong number"
                           (armstrong-number? 9475))
               (test-true "Seven digit number that is an Armstrong number"
                          (armstrong-number? 9926315))
               (test-false "Seven digit number that is not an Armstrong number"
                          (armstrong-number? 9926314)))))