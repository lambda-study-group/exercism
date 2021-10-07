#lang racket

(provide hamming-distance)

(define (hamming-distance s1 s2)
  (unless (= (string-length s1) (string-length s2))
    (raise (make-exn:fail "Sequence length mismatch")))
  (foldl (lambda (c1 c2 a)
           (if (char=? c1 c2) a (+ a 1)))
         0 (string->list s1) (string->list s2)))
