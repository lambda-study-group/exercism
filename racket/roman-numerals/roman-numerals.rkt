#lang racket

(require racket/match)

(provide to-roman)

(define (to-roman n)
  (let ([values '((1000 . "M")
                  (900 . "CM")
                  (500 . "D")
                  (400 . "CD")
                  (100 . "C")
                  (90 . "XC")
                  (50 . "L")
                  (40 . "XL")
                  (10 . "X")
                  (9 . "IX")
                  (5 . "V")
                  (4 . "IV")
                  (1 . "I"))])
    (letrec ([tail-convert (lambda (n vals acc)
                             (match-let ([(cons latin roman) (car vals)])
                              (cond [(zero? n) (apply string-append (reverse acc))]
                                    [(>= n latin) (tail-convert (- n latin) vals (cons roman acc))]
                                    [#t (tail-convert n (cdr vals) acc)])))])
      (tail-convert n values '()))))
