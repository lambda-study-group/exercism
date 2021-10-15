#lang racket/base

; Tests adapted from `problem-specifications/canonical-data.json v1.1.0
(require "reverse-string.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (run-tests
   (test-suite "reverse-string tests"
               (test-equal? "an empty string"
                            (my-reverse "")
                            "")
               (test-equal? "a word"
                            (my-reverse "robot")
                            "tobor")
               (test-equal? "a capitalized word"
                            (my-reverse "Ramen")
                            "nemaR")
               (test-equal? "a sentence with punctuation"
                            (my-reverse "I'm hungry!")
                            "!yrgnuh m'I")
               (test-equal? "a palindrome"
                            (my-reverse "racecar")
                            "racecar"))))
