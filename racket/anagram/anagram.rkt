#lang racket

(provide anagrams-for)

(define (histogram word)
  (foldl (lambda (x xx) (hash-update! xx x add1 0) xx)
         (make-hash) (string->list (string-downcase word))))

(define (anagrams-for word candidates)
  (let ([h (histogram (string-downcase word))])
    (filter (lambda (c)
              (let ([ch (histogram (string-downcase c))])
                (and (not (string=? word c))
                     (equal? h ch)))) candidates)))
