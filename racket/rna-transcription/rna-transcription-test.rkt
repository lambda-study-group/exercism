#lang racket/base

; Tests adapted from `problem-specifications/canonical-data.json v1.3.0
(require "rna-transcription.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define suite
    (test-suite
     "RNA transcription tests"
     (test-equal? "Empty RNA sequence"
                  (to-rna "")
                  "")

     (test-equal? "RNA compliment of cytosine is guanine"
                  (to-rna "C")
                  "G")

     (test-equal? "RNA compliment of guanine is cytosine"
                  (to-rna "G")
                  "C")

     (test-equal? "RNA compliment of thymine is adenine"
                  (to-rna "T")
                  "A")

     (test-equal? "RNA compliment of adenine is uracil"
                  (to-rna "A")
                  "U")

     (test-equal? "RNA compliment"
                  (to-rna "ACGTGGTCTTAA")
                  "UGCACCAGAAUU")))

  (run-tests suite))
