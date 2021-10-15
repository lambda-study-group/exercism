#lang racket

(require racket/dict)

(provide nucleotide-counts)

(define (nucleotide-counts s)
  (let ([nn '((#\A . 0) (#\C . 0) (#\G . 0) (#\T . 0))])
    (for-each (lambda (c)
                (unless (member (char-upcase c) (map car nn))
                  (raise (make-exn:fail "invalid nucleotide"
                                        (current-continuation-marks))))
                (set! nn (dict-update nn (char-upcase c) add1)))
              (string->list s))
    (dict->list nn)))

