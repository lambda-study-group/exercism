#lang racket/base

; Tests adapted from `problem-specifications/canonical-data.json v1.1.0
(require "scrabble-score.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define suite
    (test-suite
     "scrabble tests"

     (test-eqv? "lowercase letter"
                (score "a")
                1)

     (test-eqv? "uppercase letter"
                (score "A")
                1)

     (test-eqv? "valuable letter"
                (score "f")
                4)

     (test-eqv? "short word"
                (score "at")
                2)

     (test-eqv? "short, valuable word"
                (score "zoo")
                12)

     (test-eqv? "medium word"
                (score "street")
                6)

     (test-eqv? "medium, valuable word"
                (score "quirky")
                22)

     (test-eqv? "long, mixed-case word"
                (score "OxyphenButazone")
                41)

     (test-eqv? "english-like word"
                (score "pinata")
                8)

     (test-eqv? "empty input"
                (score "")
                0)

     (test-eqv? "entire alphabet available"
                (score "abcdefghijklmnopqrstuvwxyz")
                87)

     ))

  (run-tests suite))
