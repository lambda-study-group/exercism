#lang racket/base

;; Converts integers to English-language descriptions

;; --- NOTE -------------------------------------------------------------------
;; The test cases in "say-test.rkt" assume:
;; - Calling a function with an out-of-range argument triggers a contract error
;; - That `step3` returns a list of (number, symbol) pairs
;;
;; We have provided sample contracts so the tests compile, but you
;;  will want to edit & strengthen these.
;;
;; (For example, things like 0.333 and 7/8 pass the `number?` contract
;;  but these functions expect integers and natural numbers)
;; ----------------------------------------------------------------------------

(require racket/contract)
(require racket/string)

(provide (contract-out
  [step1 (-> number? string?)]
  ;; Convert a positive, 2-digit number to an English string

  [step2 (-> number? (listof number?))]
  ;; Divide a large positive number into a list of 3-digit (or smaller) chunks

  [step3 (-> number? (listof (cons/c number? symbol?)))]
  ;; Break a number into chunks and insert scales between the chunks

  [step4 (-> number? string?)]
  ;; Convert a number to an English-language string
))

;; =============================================================================

(define powers '(END thousand million billion trillion quadrillion))
(define multiples-of-1 '("one" "two" "three" "four" "five"
                               "six" "seven" "eight" "nine"))
(define teens '("ten" "eleven" "twelve" "thirteen" "fourteen" "fifteen"
                      "sixteen" "seventeen" "eighteen" "nineteen"))
(define multiples-of-10 '("twenty" "thirty" "forty"
                                   "fifty" "sixty" "seventy" "eighty" "ninety"))

(define (step1 n)
  (unless (<= 0 n 99)
    (raise (make-exn:fail:contract "" (current-continuation-marks))))
  (cond [(zero? n) "zero"]
        [(<= 1 n 9) (list-ref multiples-of-1 (- n 1))]
        [(<= 10 n 19) (list-ref teens (- n 10))]
        [else (let-values ([(tens units) (quotient/remainder n 10)])
                (string-join (cons (list-ref multiples-of-10 (- tens 2))
                                   (if (zero? units) '()
                                       (list (list-ref multiples-of-1 (- units 1)))))
                             "-"))]))

(define (step2 n)
  (let loop [(n n) (t '())]
    (cond [(and (zero? n) (null? t)) '(0)]
          [(zero? n) t]
          [else (let-values ([(q r) (quotient/remainder n 1000)])
                  (loop q (cons r t)))])))

(define (step3 n)
  (reverse (for/list ([chunk (reverse (step2 n))]
                      [scale powers])
             (cons chunk scale))))

(define (step4 n)
  (if (zero? n)
      "zero"
      (let* ([neg (negative? n)]
             [n (abs n)]
             [components (step3 n)]
             [processed
              (string-join
               (apply append
                      (for/list ([tuple components])
                        (if (zero? (car tuple))
                            '()
                            (list
                             (string-append (let-values ([(q r) (quotient/remainder (car tuple) 100)])
                                              (string-append
                                               (if (zero? q)
                                                   ""
                                                   (format "~a hundred"
                                                           (list-ref multiples-of-1 (- q 1))))
                                               (if (zero? r)
                                                   ""
                                                   (format "~a~a" (if (zero? q) "" " ") (step1 r)))))
                                            (if (equal? (cdr tuple) 'END)
                                                ""
                                                (format " ~a" (symbol->string (cdr tuple)))))))))
               " ")])
        (string-append (if neg "negative " "") processed))))
