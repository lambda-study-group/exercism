#lang racket

(provide collatz)

(define (collatz n)
  (unless (positive-integer? n)
    (raise (make-exn:fail "" (current-continuation-marks))))
  (letrec ([tail-collatz (lambda (n s)
                           (cond [(= n 1) s]
                                 [#t (tail-collatz (if (even? n)
                                                       (/ n 2)
                                                       (+ (* n 3) 1))
                                                   (+ s 1))]))])
    (tail-collatz n 0)))
