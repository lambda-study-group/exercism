#lang racket

; Tests adapted from `problem-specifications/canonical-data.json v1.4.0
(require "word-count.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define-binary-check (hashes-equal? actual expected)
    (equal? (sort (hash->list actual) string<? #:key car)
            (sort (hash->list expected) string<? #:key car)))

  (define suite
    (test-suite
     "For each word in the input, count the number of times it appears in the entire sentence."

     (hashes-equal? (word-count "word")
                    '#hash(("word" . 1))
                    "count one word")

     (hashes-equal? (word-count "one of each")
                    '#hash(("one" . 1) ("of" . 1) ("each" . 1))
                    "count one of each word")

     (hashes-equal? (word-count "one fish two fish red fish blue fish")
                    '#hash(("one" . 1) ("fish" . 4) ("two" . 1) ("red" . 1) ("blue" . 1))
                    "multiple occurrences of a word")

     (hashes-equal? (word-count "one,two,three")
                    '#hash(("one" . 1) ("two" . 1) ("three" . 1))
                    "handles cramped lists")

     (hashes-equal? (word-count "one,\ntwo,\nthree")
                    '#hash(("one" . 1) ("two" . 1) ("three" . 1))
                    "handles expanded lists")

     (hashes-equal? (word-count "car : carpet as java : javascript!!&@$%^&")
                    '#hash(("car" . 1) ("carpet" . 1) ("as" . 1) ("java" . 1) ("javascript" . 1))
                    "ignore punctuation")

     (hashes-equal? (word-count "testing, 1, 2, testing")
                    '#hash(("testing" . 2) ("1" . 1) ("2" . 1))
                    "include numbers")

     (hashes-equal? (word-count "go Go GO Stop stop")
                    '#hash(("go" . 3) ("stop" . 2))
                    "normalize case")

     (hashes-equal? (word-count "Joe can't tell between 'large' and large.")
                    '#hash(("joe" . 1) ("can't" . 1) ("tell" . 1) ("between" . 1) ("large" . 2)
                                       ("and" . 1))
                    "with quotations")

     (hashes-equal? (word-count "Joe can't tell between app, apple and a.")
                    '#hash(("joe" . 1) ("can't" . 1) ("tell" . 1) ("between" . 1) ("app" . 1)
                                       ("apple" . 1) ("and" . 1) ("a" . 1))
                    "substrings from the beginning")


     (hashes-equal? (word-count " multiple   whitespaces")
                    '#hash(("multiple" . 1) ("whitespaces" . 1))
                    "multiple spaces not detected as a word")

     (hashes-equal? (word-count ",\n,one,\n ,two \n 'three'")
                    '#hash(("one" . 1) ("two" . 1) ("three" . 1))
                    "alternating word separators not detected as a word")))

  (run-tests suite))
