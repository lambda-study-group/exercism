#lang racket

(require "variable-length-quantity.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define encode-tests
    (test-suite
     "Encode a series of integers, producing a series of bytes."

        ;;; single byte results
        (test-equal? "zero"
                      (encode 0)
                      '(0))

        (test-equal? "arbitrary single byte"
                      (encode 64)
                      '(64))

        (test-equal? "largest single byte"
                      (encode 127)
                      '(127))

        ;;; 2-byte results
        (test-equal? "smallest double byte"
                      (encode 128)
                      '(129 0))

        (test-equal? "arbitrary double byte"
                      (encode 8192)
                      '(192 0))

        (test-equal? "largest double byte"
                      (encode 16383)
                      '(255 127))

        ;;; 3-byte results
        (test-equal? "smallest triple byte"
                      (encode 16384)
                      '(129 128 0))

        (test-equal? "arbitrary triple byte"
                      (encode 1048576)
                      '(192 128 0))

        ;;; 4-byte results
        (test-equal? "smallest quadruple byte"
                      (encode 2097152)
                      '(129 128 128 0))

        (test-equal? "arbitrary quadruple byte"
                      (encode 134217728)
                      '(192 128 128 0))

        (test-equal? "largest quadruple byte"
                      (encode 268435455)
                      '(255 255 255 127))

        ;;; 5-byte results
        (test-equal? "smallest quintuple byte"
                      (encode 268435456)
                      '(129 128 128 128 0))

        (test-equal? "arbitrary quintuple byte"
                      (encode 4278190080)
                      '(143 248 128 128 0))

        (test-equal? "maximum 32-bit integer input"
                      (encode 4294967295)
                      '(143 255 255 255 127))

        ;;; Multi-byte tests
        (test-equal? "two single-byte values"
                      (encode 64 127)
                      '(64 127))

        (test-equal? "two multi-byte values"
                      (encode 16384 1193046)
                      '(129 128 0 200 232 86))

        (test-equal? "many multi-byte values"
                      (encode 8192 1193046 268435455 0 16383 16384)
                      '(192 0 200 232 86 255 255 255 127 0 255 127 129 128 0))))

  (define decode-tests
    (test-suite
     "Decode a series of bytes, producing a series of integers."

        ;;; Simple byte tests
        (test-equal? "one byte"
                      (decode 127)
                      '(127))

        (test-equal? "two bytes"
                      (decode 192 0)
                      '(8192))

        (test-equal? "three bytes"
                      (decode 255 255 127)
                      '(2097151))

        (test-equal? "four bytes"
                      (decode 129 128 128 0)
                      '(2097152))

        (test-equal? "maximum 32-bit integer"
                      (decode 143 255 255 255 127)
                      '(4294967295))

        ;;; Error checking...
        (test-exn "incomplete sequence causes error"
                      exn:fail?
                      (lambda () (decode 255)))

        (test-exn "incomplete sequence causes error, even if value is zero"
                      exn:fail?
                      (lambda () (decode 128)))

        (test-equal? "multiple values"
                      (decode 192 0 200 232 86 255 255 255 127 0 255 127 129 128 0)
                      '(8192 1193046 268435455 0 16383 16384))
    ))

  (begin
    (run-tests encode-tests)
    (run-tests decode-tests)
    ))
