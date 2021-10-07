#lang racket

(provide my-length
         my-reverse
         my-map
         my-filter
         my-fold
         my-append
         my-concatenate)

(define (my-length lst)
  (let length ([lst lst] [len 0])
    (if (null? lst)
        len
        (length (cdr lst) (add1 len)))))

(define (my-reverse lst)
  (let reverse ([lst lst] [acc '()])
    (if (null? lst)
        acc
        (reverse (cdr lst) (cons (car lst) acc)))))

(define (my-map f lst)
  (let map ([lst lst] [acc '()])
    (if (null? lst)
        (my-reverse acc)
        (map (cdr lst) (cons (f (car lst)) acc)))))

(define (my-filter f lst)
  (let filter ([lst lst] [acc '()])
    (cond [(null? lst) (my-reverse acc)]
          [(f (car lst))
           (filter (cdr lst) (cons (car lst) acc))]
          [else (filter (cdr lst) acc)])))

(define (my-fold f init lst)
  (let fold ([lst lst] [acc init])
    (if (null? lst)
        acc
        (fold (cdr lst) (f (car lst) acc)))))

(define (my-append l1 l2)
  (cond [(null? l1) l2]
        [(null? l2) l1]
        [else (let append ([l1 (my-reverse l1)] [l2 l2])
                (if (null? l1)
                    l2
                    (append (cdr l1) (cons (car l1) l2))))]))

(define (my-concatenate lst*)
  (my-fold (lambda (x acc) (my-append acc x)) '() lst*))
