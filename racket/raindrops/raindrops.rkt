#lang racket

(provide convert)

(define (convert n)
  (let ([s (with-output-to-string
             (lambda ()
               (when (zero? (modulo n 3))
                (display "Pling"))
              (when (zero? (modulo n 5))
                (display "Plang"))
              (when (zero? (modulo n 7))
                (display "Plong"))))])
    (if (equal? s "")
        (number->string n)
        s)))
