#lang racket/base

; Tests adapted from canonical-data.json v1.2.0
(require "atbash-cipher.rkt")

(module+ test
  (require rackunit rackunit/text-ui)
  (run-tests
   (test-suite "atbash-cipher encode tests"
               (test-equal? "encode yes"
                            (encode "yes")
                            "bvh")

               (test-equal? "encode no"
                            (encode "no")
                            "ml")

               (test-equal? "encode OMG"
                            (encode "OMG")
                            "lnt")

               (test-equal? "encode O M G"
                            (encode "O M G")
                            "lnt")

               (test-equal? "encode mindblowingly"
                            (encode "mindblowingly")
                            "nrmwy oldrm tob")

               (test-equal? "encode numbers"
                            (encode "Testing,1 2 3, testing.")
                            "gvhgr mt123 gvhgr mt")

               (test-equal? "encode deep thought"
                            (encode "Truth is fiction.")
                            "gifgs rhurx grlm")
 
               (test-equal? "encode all the letters"
                            (encode "The quick brown fox jumps over the lazy dog.")
                            "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt")))
  
  (run-tests
   (test-suite "atbash-cipher decode tests"
               (test-equal? "decode exercism"
                            (decode "vcvix rhn")
                            "exercism")

               (test-equal? "decode a sentence"
                            (decode "zmlyh gzxov rhlug vmzhg vkkrm thglm v")
                            "anobstacleisoftenasteppingstone")

               (test-equal? "decode numbers"
                            (decode "gvhgr mt123 gvhgr mt")
                            "testing123testing")

               (test-equal? "decode all the letters"
                            (decode "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt")
                            "thequickbrownfoxjumpsoverthelazydog")

               (test-equal? "decode with too many spaces"
                            (decode "vc vix    r hn")
                            "exercism")

               (test-equal? "decode with no spaces"
                            (decode "zmlyhgzxovrhlugvmzhgvkkrmthglmv")
                            "anobstacleisoftenasteppingstone"))))