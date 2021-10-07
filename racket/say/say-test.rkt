#lang racket

(require "say.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define-syntax-rule (check-equal* f [arg == val] ...)
    (begin (check-equal? (f arg) val) ...))

  (define-syntax-rule (check-exn* f pat [arg] ...)
    (begin (check-exn exn:fail:contract? (lambda () (f arg))) ...))

  (define step*
    (list
      (test-suite "step1"
        (check-equal* step1
         [0 == "zero"]
         [2 == "two"]
         [14 == "fourteen"]
         [50 == "fifty"]
         [98 == "ninety-eight"]
         [99 == "ninety-nine"])

        (check-exn* step1
         [-1]
         [100]))

      (test-suite "step2"
        (check-equal* step2
         [1234567890 == '(1 234 567 890)]
         [1000000890 == '(1   0   0 890)]
         [22 == '(22)]
         [3222 == '(3 222)]
         [1000231 == '(1 0 231)]
         [1000 == '(1 0)]))

      (test-suite "step3"
        (check-equal* step3
         [3222 == '((3 . thousand) (222 . END))]
         [901003004111 == '((901 . billion) (3 . million)
                            (4 . thousand) (111 . END))]
         [999 == '((999 . END))]
         [21 == '((21 . END))]
         [19 == '((19 . END))]
         [100 == '((100 . END))]
         [123 == '((123 . END))]
         [1234567890 == '((1 . billion) (234 . million)
                          (567 . thousand) (890 . END))]))

      (test-suite "step4"
        (check-equal* step4
         [10 == "ten"]
         [100 == "one hundred"]
         [10000 == "ten thousand"]
         [10000000 == "ten million"]
         [10000000000 == "ten billion"]
         [10000000000000 == "ten trillion"]
         [999000000000000 == "nine hundred ninety-nine trillion"]
         [0 == "zero"]
         [16 == "sixteen"]
         [300 == "three hundred"]
         [440 == "four hundred forty"]
         [999 == "nine hundred ninety-nine"]
         [-1 == "negative one"]
         [22 == "twenty-two"]
         [123 == "one hundred twenty-three"]
         [22 == "twenty-two"]
         [14 == "fourteen"]
         [50 == "fifty"]
         [98 == "ninety-eight"]
         [-432600 == "negative four hundred thirty-two thousand six hundred"]
         [12345 == "twelve thousand three hundred forty-five"]))))

  (for ([suite (in-list step*)])
    (run-tests suite)))
