#lang racket

(provide list-allergies allergic-to?)

(define *allergies* '(("eggs" . 1)
                      ("peanuts" . 2)
                      ("shellfish" . 4)
                      ("strawberries" . 8)
                      ("tomatoes" . 16)
                      ("chocolate" . 32)
                      ("pollen" . 64)
                      ("cats" . 128)))

(define (list-allergies score)
  (filter (lambda (x) (begin0
                          (bitwise-bit-set? score 0)
                        (set! score (arithmetic-shift score -1))))
          (map car *allergies*)))

(define (allergic-to? str score)
  (let* ([h (make-hash *allergies*)]
         [as (hash-ref h str)])
    (= as (bitwise-and as score))))
