#lang racket

(provide acronym)

(define (acronym s)
  (list->string
   (map (lambda (s)
          (char-upcase (string-ref s 0)))
        (regexp-match* #px"[A-Za-z']+" s))))
