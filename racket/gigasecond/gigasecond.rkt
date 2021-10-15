#lang racket

(provide add-gigasecond)

(require racket/date)

(define (add-gigasecond t)
  (seconds->date (+ (date->seconds t) 1000000000)))
