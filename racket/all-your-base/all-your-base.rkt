#lang racket

(require srfi/1)

(provide rebase)

(define (rebase list-digits in-base out-base)
  (cond [(< in-base 2) #f]
        [(< out-base 2) #f]
        [(not (for/and ([d list-digits])
                   (< -1 d in-base))) #f]
        [#t (let ([decimal (foldl (lambda (d acc)
                                    (+ (* acc in-base) d))
                                  0 list-digits)])
              (reverse (unfold zero?
                               (lambda (x) (remainder x out-base))
                               (lambda (x) (quotient x out-base))
                               decimal
                               (lambda (x) (if (zero? decimal) '(0) '())))))]))
