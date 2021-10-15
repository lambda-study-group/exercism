#lang racket/base

(require "list-ops.rkt")

(module+ test
  (require rackunit rackunit/text-ui))

(module+ test
  (define (inc x) (+ 1 x))

  (define suite
    (test-suite
     "list operations tests"

     (test-eqv? "length of empty list"
                (my-length '())
                0)

     (test-eqv? "length of normal list"
                (my-length '(1 3 5 7))
                4)

     (test-eqv? "length of huge list"
                (my-length (build-list 1000000 values))
                1000000)

     (test-equal? "reverse of empty list"
                  (my-reverse '())
                  '())

     (test-equal? "reverse of normal list"
                  (my-reverse '(1 3 5 7))
                  '(7 5 3 1))

     (test-equal? "reverse of huge list"
                  (my-reverse (build-list 1000000 values))
                  (build-list 1000000 (lambda (x) (- 999999 x))))

     (test-equal? "map of empty list"
                  (my-map inc '())
                  '())

     (test-equal? "map of normal list"
                  (my-map inc '(1 2 3 4))
                  '(2 3 4 5))

     (test-equal? "map of huge list"
                  (my-map inc (build-list 1000000 values))
                  (build-list 1000000 (lambda (x) (+ x 1))))

     (test-equal? "filter of empty list"
                  (my-filter odd? '())
                  '())

     (test-equal? "filter of normal list"
                  (my-filter odd? '(1 2 3 4))
                  '(1 3))

     (test-equal? "filter of huge list"
                  (my-filter odd? (build-list 1000000 values))
                  (filter odd? (build-list 1000000 values)))

     (test-eqv? "fold of empty list"
                (my-fold + 0 '())
                0)

     (test-eqv? "fold of normal list"
                (my-fold + -3 '(1 2 3 4))
                7)

     (test-eqv? "fold of huge list"
                (my-fold + 0 (build-list 1000000 values))
                (foldl + 0 (build-list 1000000 values)))

     (test-eqv? "fold with non-commutative function"
                (my-fold (lambda (x acc) (- acc x)) 10 '(1 2 3 4))
                0)

     (test-equal? "append of empty lists"
                  (my-append '() '())
                  '())

     (test-equal? "append of empty and non-empty list"
                  (my-append '() '(1 2 3 4))
                  '(1 2 3 4))

     (test-equal? "append of non-empty and empty list"
                  (my-append '(1 2 3 4) '())
                  '(1 2 3 4))

     (test-equal? "append of non-empty lists"
                  (my-append '(1 2 3) '(4 5))
                  '(1 2 3 4 5))

     (test-equal? "append of huge lists"
                  (my-append (build-list 1000000 values)
                             (build-list 1000000 (lambda (x) (+ x 1000000))))
                  (build-list 2000000 values))

     (test-equal? "concatenate of empty list of lists"
                  (my-concatenate '())
                  '())

     (test-equal? "concatenate of normal list of lists"
                  (my-concatenate '((1 2) (3) () (4 5 6)))
                  '(1 2 3 4 5 6))

     (test-equal? "concatenate of huge list of small lists"
                  (my-concatenate (build-list 1000000 list))
                  (build-list 1000000 values))

     (test-equal? "concatenate of small list of huge lists"
                  (my-concatenate
                   (build-list 10 (lambda (i)
                                    (build-list 100000 (lambda (j)
                                                         (+ (* 100000 i) j))))))
                  (build-list 1000000 values))))

  (run-tests suite))
