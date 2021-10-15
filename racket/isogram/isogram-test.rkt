#lang racket/base

; Tests adapted from `problem-specifications/canonical-data.json v1.7.0
(require "isogram.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (run-tests
    (test-suite "isogram tests"
                (test-true "empty string"
                           (isogram? ""))
                (test-true "isogram with only lower case characters"
                           (isogram? "isogram"))
                (test-false "word with one duplicated character"
                           (isogram? "eleven"))
                (test-false "word with one duplicated character from the end of the alphabet"
                           (isogram? "zzyzx"))
                (test-true "longest reported english isogram"
                           (isogram? "subdermatoglyphic"))
                (test-false "word with duplicated character in mixed case"
                           (isogram? "Alphabet"))
                (test-false "word with duplicated character in mixed case, lowercase first"
                           (isogram? "alphAbet"))
                (test-true "hypothetical isogrammic word with hyphen"
                           (isogram? "thumbscrew-japingly"))
                (test-false "hypothetical word with duplicated character following hyphen"
                           (isogram? "thumbscrew-jappingly"))
                (test-true "isogram with duplicated hyphen"
                           (isogram? "six-year-old"))
                (test-true "made-up name that is an isogram"
                           (isogram? "Emily Jung Schwartzkopf"))
                (test-false "duplicated character in the middle"
                           (isogram? "accentor"))
                (test-false "same first and last characters"
                           (isogram? "angola")))))

