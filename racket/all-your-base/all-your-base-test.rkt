#lang racket

(require "all-your-base.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define suite
    (test-suite
     "all-your-base tests"

      (test-equal? "single-bit-one-to-decimal"
                   '( 1 )
                   (rebase '( 1 ) 2 10))

      (test-equal? "binary-to-single-decimal"
                   '( 5 )
                   (rebase '( 1 0 1 ) 2 10))

      (test-equal? "single-decimal-to-binary"
                   '( 1 0 1 )
                   (rebase '( 5 ) 10 2))

      (test-equal? "binary-to-multiple-decimal"
                   '( 4 2 )
                   (rebase '( 1 0 1 0 1 0 ) 2 10))

      (test-equal? "decimal-to-binary"
                   '( 1 0 1 0 1 0 )
                   (rebase '( 4 2 ) 10 2))

      (test-equal? "trinary-to-hexadecimal"
                   '( 2 10 )
                   (rebase '( 1 1 2 0 ) 3 16))

      (test-equal? "hexadecimal-to-trinary"
                   '( 1 1 2 0 )
                   (rebase '( 2 10 ) 16 3))

      (test-equal? "number-15-bit-integer"
                   '( 6 10 45 )
                   (rebase '( 3 46 60 ) 97 73))

      (test-equal? "empty-list"
                   '( 0 )
                   (rebase '() 2 10))

      (test-equal? "single-zero"
                   '( 0 )
                   (rebase '( 0 ) 10 2))

      (test-equal? "multiple-zeros"
                   '( 0 )
                   (rebase '( 0 0 0 ) 10 2))

      (test-equal? "leading-zeros"
                   '( 4 2 )
                   (rebase '( 0 6 0 ) 7 10))

      (test-false "input-base-is-one"
                   (rebase '( 0 ) 1 10))

      (test-false "input-base-is-zero"
                   (rebase '() 0 10))

      (test-false "input-base-is-negative"
                   (rebase '( 1 ) -2 10))

      (test-false "negative-digit"
                   (rebase '( 1 -1 1 0 1 0 ) 2 10))

      (test-false "invalid-positive-digit"
                   (rebase '( 1 2 1 0 1 0 ) 2 10))

      (test-false "output-base-is-one"
                   (rebase '( 1 0 1 0 1 0 ) 2 1))

      (test-false "output-base-is-zero"
                   (rebase '( 7 ) 10 0))

      (test-false "output-base-is-negative"
                   (rebase '( 1 ) 2 -7))

      (test-false "both-bases-are-negative"
                   (rebase '( 1 ) -2 -7))))

    (run-tests suite))
