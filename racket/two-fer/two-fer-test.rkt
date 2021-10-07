#lang racket

; Tests adapted from `problem-specifications/canonical-data.json v1.2.0
(require "two-fer.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define suite
    (test-suite
     "two fer tests"

     (test-equal? "no name given"
                  (two-fer)
                  "One for you, one for me.")
     (test-equal? "a name given"
                  (two-fer "Alice")
                  "One for Alice, one for me.")
     (test-equal? "another name given"
                  (two-fer "Bob")
                  "One for Bob, one for me.")))

  (run-tests suite))
