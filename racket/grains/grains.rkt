#lang racket

(provide square total)

;; square function calculates number of grains on a given chessboard square
;; it takes a number and returns power of 2 to that number minus one
;; Int -> Int
(define (square n)
  (expt 2 (- n 1)))

;; total function calculates sum of grains on all chessboard squares
;; Int
(define (total)
  (let* ([squaresNum 64]
         [end (+ 1 squaresNum)])
    (for/sum
        ([i (range 1 end)])
      (square i))))
