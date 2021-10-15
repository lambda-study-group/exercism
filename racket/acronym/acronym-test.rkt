#lang racket/base

; Tests adapted from `problem-specifications/canonical-data.json v1.7.0
(require "acronym.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define suite
    (test-suite
     "acronym tests"

     (test-equal? "basic"
                  (acronym "Portable Network Graphics")
                  "PNG")

     (test-equal? "lowercase words"
                  (acronym "Ruby on Rails")
                  "ROR")

     (test-equal? "punctuation"
                  (acronym "First In, First Out")
                  "FIFO")

     (test-equal? "all caps word"
                  (acronym "GNU Image Manipulation Program")
                  "GIMP")

     (test-equal? "punctuation without whitespace"
                  (acronym "Complementary metal-oxide semiconductor")
                  "CMOS")

     (test-equal? "very long abbreviation"
                  (acronym "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me")
                  "ROTFLSHTMDCOALM")

     (test-equal? "consecutive delimiters"
                  (acronym "Something - I made up from thin air")
                  "SIMUFTA")

     (test-equal? "apostrophes"
                  (acronym "Halley's Comet")
                  "HC")

     (test-equal? "underscore emphasis"
                  (acronym "The Road _Not_ Taken")
                  "TRNT")))

  (run-tests suite))
