#lang racket/base

; Tests adapted from `problem-specifications/canonical-data.json v1.7.0
(require "phone-number.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define suite
    (test-suite
     "phone number tests"

     (test-equal? "cleans the number"
                  (nanp-clean "(223) 456-7890")
                  "2234567890")

     (test-equal? "cleans numbers with dots"
                  (nanp-clean "223.456.7890")
                  "2234567890")

     (test-equal? "cleans numbers with multiple spaces"
                  (nanp-clean "223 456   7890   ")
                  "2234567890")

     (test-exn "invalid when 9 digits"
               exn:fail?
               (λ ()
                 (nanp-clean "123456789")))

     (test-exn "invalid when 11 digits does not start with a 1"
               exn:fail?
               (λ ()
                 (nanp-clean "22234567890")))

     (test-equal? "valid when 11 digits and starting with 1"
                  (nanp-clean "12234567890")
                  "2234567890")

     (test-equal? "valid when 11 digits and starting with 1 even with punctuation"
                  (nanp-clean "+1 (223) 456-7890")
                  "2234567890")

     (test-exn "invalid when more than 11 digits"
               exn:fail?
               (λ ()
                 (nanp-clean "321234567890")))

     (test-exn "invalid with letters"
               exn:fail?
               (λ ()
                 (nanp-clean "123-abc-7890")))

     (test-exn "invalid with punctuations"
               exn:fail?
               (λ ()
                 (nanp-clean "123-@:!-7890")))

     (test-exn "invalid if area code starts with 0"
               exn:fail?
               (λ ()
                 (nanp-clean "(023) 456-7890")))

     (test-exn "invalid if area code starts with 1"
               exn:fail?
               (λ ()
                 (nanp-clean "(123) 456-7890")))

     (test-exn "invalid if exchange code starts with 0"
               exn:fail?
               (λ ()
                 (nanp-clean "(223) 056-7890")))

     (test-exn "invalid if exchange code starts with 1"
               exn:fail?
               (λ ()
                 (nanp-clean "(223) 156-7890")))

     (test-exn "invalid if area code starts with 0 on valid 11-digit number"
               exn:fail?
               (λ ()
                 (nanp-clean "1 (023) 456-7890")))

     (test-exn "invalid if area code starts with 1 on valid 11-digit number"
               exn:fail?
               (λ ()
                 (nanp-clean "1 (123) 456-7890")))

     (test-exn "invalid if exchange code starts with 0 on valid 11-digit number"
               exn:fail?
               (λ ()
                 (nanp-clean "1 (223) 056-7890")))

     (test-exn "invalid if exchange code starts with 1 on valid 11-digit number"
               exn:fail?
               (λ ()
                 (nanp-clean "1 (223) 156-7890")))))

  (run-tests suite))
