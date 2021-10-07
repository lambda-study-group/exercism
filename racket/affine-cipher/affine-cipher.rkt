#lang racket
(require racket/contract)
(require math/number-theory)
;; (require (only-in racket/list group-by string-join))

(provide (contract-out
          [encode (string?
                   exact-nonnegative-integer?
                   exact-nonnegative-integer? . -> . string?)]
          [decode (string?
                   exact-nonnegative-integer?
                   exact-nonnegative-integer? . -> . string?)]))

(define (mmi a)
  (let tail ([k 1])
    (if (= 1 (modulo (* a k) 26))
        k
        (tail (add1 k)))))

(define (encode-char c a b)
  (integer->char
   (+ (modulo (+ (* a (- (char->integer c)
                         (char->integer #\a))) b) 26)
      (char->integer #\a))))

(define (decode-char c a b)
  (integer->char (+ (modulo (* (- (char->integer c)
                                  (char->integer #\a)
                                  b)
                               (mmi a)) 26)
                    (char->integer #\a))))

(define (group lst n)
  (let ([counter (let ([x 0])
                   (lambda (xx)
                     (begin0 x
                       (set! x (add1 x)))))])
    (group-by (lambda (x) (quotient (counter x) n)) lst)))

(define (encode msg a b)
  (unless (coprime? a 26)
    (raise (make-exn:fail "" (current-continuation-marks))))
  (string-join
   (map list->string
        (group
         (filter-map (lambda (x)
                       (cond
                         [(char-numeric? x) x]
                         [(char-alphabetic? x)
                          (encode-char (char-downcase x) a b)]
                         [#t #f]))
                     (string->list msg)) 5))))

(define (decode msg a b)
  (unless (coprime? a 26)
    (raise (make-exn:fail "" (current-continuation-marks))))
  (list->string
   (filter-map (lambda (x)
                 (cond
                   [(char-numeric? x) x]
                   [(char-alphabetic? x)
                    (decode-char x a b)]
                   [#t #f]))
               (string->list msg))))
