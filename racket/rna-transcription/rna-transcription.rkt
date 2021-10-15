#lang racket

(provide to-rna)

(define (to-rna s)
  (let ([key (hash #\G #\C
                   #\C #\G
                   #\T #\A
                   #\A #\U)])
    (list->string (map (lambda (c) (hash-ref key c)) (string->list s)))))
