#lang racket/base

; Tests adapted from `problem-specifications/canonical-data.json v2.0.0
(require "affine-cipher.rkt")

(module+ test
  (require rackunit rackunit/text-ui)

  (define encode-suite
    (test-suite "affine-cipher encoding tests"
                (test-equal? "encode 'yes'"
                             (encode "yes" 5 7)
                             "xbt")

                (test-equal? "encode 'no"
                             (encode "no" 15 18)
                             "fu")

                (test-equal? "encode 'OMG"
                             (encode "OMG" 21 3)
                             "lvz")

                (test-equal? "encode 'O M G"
                             (encode "O M G" 25 47)
                             "hjp")

                (test-equal? "encode 'mindblowingly'"
                             (encode "mindblowingly" 11 15)
                             "rzcwa gnxzc dgt")

                (test-equal? "encode 'Testing,1 2 3, testing.'"
                             (encode "Testing,1 2 3, testing." 3 4)
                             "jqgjc rw123 jqgjc rw")

                (test-equal? "encode 'Truth is fiction.'"
                             (encode "Truth is fiction." 5 17)
                             "iynia fdqfb ifje")
 
                (test-equal? "encode 'The quick brown fox jumps over the lazy dog.'"
                             (encode "The quick brown fox jumps over the lazy dog." 17 33)
                             "swxtj npvyk lruol iejdc blaxk swxmh qzglf")

                (test-exn "test that encode raises a meaningful exception"
                          exn:fail? (lambda () (encode "This is a test" 6 17)))))

  (define decode-suite
    (test-suite "affine-cipher decoding tests"
                (test-equal? "decode 'tytgn fjr'"
                             (decode "tytgn fjr" 3 7)
                             "exercism")

                (test-equal? "decode 'qdwju nqcro muwhn odqun oppmd aunwd o'"
                             (decode "qdwju nqcro muwhn odqun oppmd aunwd o" 19 16)
                             "anobstacleisoftenasteppingstone")

                (test-equal? "decode 'odpoz ub123 odpoz ub'"
                             (decode "odpoz ub123 odpoz ub" 25 7)
                             "testing123testing")

                (test-equal? "decode 'swxtj npvyk lruol iejdc blaxk swxmh qzglf'"
                             (decode "swxtj npvyk lruol iejdc blaxk swxmh qzglf" 17 33)
                             "thequickbrownfoxjumpsoverthelazydog")

                (test-equal? "decode 'swxtjnpvyklruoliejdcblaxkswxmhqzglf'"
                             (decode "swxtjnpvyklruoliejdcblaxkswxmhqzglf" 17 33)
                             "thequickbrownfoxjumpsoverthelazydog")

                (test-equal? "decode 'vszzm    cly   yd cg    qdp'"
                             (decode "vszzm    cly   yd cg    qdp" 15 16)
                             "jollygreengiant")

                (test-exn "test that decode raises a meaningfun exception"
                          exn:fail? (lambda () (decode "Test" 13 5)))))

  (begin
    (run-tests encode-suite)
    (run-tests decode-suite)))
