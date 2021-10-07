#lang racket
(provide my-reverse)

(define (my-reverse str)
  (list->string (foldl cons '() (string->list str))))