#lang racket

(provide etl)

(define (etl in)
  (unless (andmap positive? (hash-keys in))
    (raise (make-exn:fail:contract "Not all keys non-negative" (current-continuation-marks))))
  (unless (andmap (lambda (xx)
                    (andmap string? xx)) (hash-values in))
    (raise (make-exn:fail:contract "Not all keys are strings" (current-continuation-marks))))
  (let ([h (make-hash)])
    (hash-map in (lambda (k vv)
                  (map (lambda (v)
                         (hash-set! h (string-downcase v) k)) vv)))
    h))
