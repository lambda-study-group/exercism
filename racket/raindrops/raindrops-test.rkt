#lang racket/base

; Tests adapted from `problem-specifications/canonical-data.json v1.1.0
(require "raindrops.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define suite
    (test-suite
     "raindrops tests"

     (test-equal? "the sound for 1 is 1"
                  (convert 1)
                  "1")

     (test-equal? "the sound for 3 is Pling"
                  (convert 3)
                  "Pling")

     (test-equal? "the sound for 5 is Plang"
                  (convert 5)
                  "Plang")

     (test-equal? "the sound for 7 is Plong"
                  (convert 7)
                  "Plong")

     (test-equal? "the sound for 6 is Pling as it has a factor of 3"
                  (convert 6)
                  "Pling")

     (test-equal? "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base"
                  (convert 8)
                  "8")

     (test-equal? "the sound for 9 is Pling as it has a factor 3"
                  (convert 9)
                  "Pling")

     (test-equal? "the sound for 10 is Plang as it has a factor 5"
                  (convert 10)
                  "Plang")

     (test-equal? "the sound for 14 is Plong as it has a factor of 7"
                  (convert 14)
                  "Plong")

     (test-equal? "the sound for 15 is PlingPlang as it has factors 3 and 5"
                  (convert 15)
                  "PlingPlang")

     (test-equal? "the sound for 21 is PlingPlong as it has factors 3 and 7"
                  (convert 21)
                  "PlingPlong")

     (test-equal? "the sound for 25 is Plang as it has a factor 5"
                  (convert 25)
                  "Plang")

     (test-equal? "the sound for 27 is Pling as it has a factor 3"
                  (convert 27)
                  "Pling")

     (test-equal? "the sound for 35 is PlangPlong as it has factors 5 and 7"
                  (convert 35)
                  "PlangPlong")

     (test-equal? "the sound for 49 is Plong as it has a factor 7"
                  (convert 49)
                  "Plong")

     (test-equal? "the sound for 52 is 52"
                  (convert 52)
                  "52")

     (test-equal? "the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7"
                  (convert 105)
                  "PlingPlangPlong")

     (test-equal? "the sound for 3125 is Plang as it has a factor 5"
                  (convert 3125)
                  "Plang")))

  (run-tests suite))
