#lang racket

(provide numbers area-code pprint)

(define (numbers n)
  (let ([digits (regexp-match* #px"[0-9]" n)])
    (cond [(= 10 (length digits))
           (string-append* digits)]
          [(and (= 11 (length digits))
                (string=? (car digits) "1"))
           (string-append* (cdr digits))]
          [else
           (make-string 10 #\0)])))

(define (area-code n)
  (substring (numbers n) 0 3))

(define (pprint n)
  (let* ([digits (numbers n)]
         [digits (if (= (string-length digits) 10) digits (substring digits 1))])
    (format "(~a) ~a-~a"
            (substring digits 0 3)
            (substring digits 3 6)
            (substring digits 6))))
