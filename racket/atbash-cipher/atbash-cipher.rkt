#lang racket

(define alphabet (range (char->integer #\a) (add1 (char->integer #\z))))

(define atbash-key (make-hash (map (lambda (a b) (cons (integer->char a)
                                                       (integer->char b))) alphabet (reverse alphabet))))

(define (group lst n)
  (let ([counter (let ([x 0])
                   (lambda (xx)
                     (begin0 x
                       (set! x (add1 x)))))])
    (group-by (lambda (x) (quotient (counter x) n)) lst)))

(define (encode m)
  (string-join
   (map list->string
        (group
         (filter-map (lambda (x)
                       (cond
                         [(char-numeric? x) x]
                         [(char-alphabetic? x)
                          (hash-ref atbash-key (char-downcase x))]
                         [#t #f]))
                     (string->list m)) 5))))

(define (decode m)
  (list->string
   (filter-map (lambda (x)
                 (cond
                   [(char-numeric? x) x]
                   [(char-alphabetic? x)
                    (hash-ref atbash-key x)]
                   [#t #f]))
               (string->list m))))
