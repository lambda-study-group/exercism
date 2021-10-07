#lang racket

(provide meetup-day)

(require racket/date)

(define (dow->num dow)
  (case dow
    ['Monday 1]
    ['Tuesday 2]
    ['Wednesday 3]
    ['Thursday 4]
    ['Friday 5]
    ['Saturday 6]
    ['Sunday 0]))

(define (ordinal->cardinal ord)
  (case ord
    ['first 1]
    ['second 2]
    ['third 3]
    ['fourth 4]
    ['fifth 5]))

(define (make-date year month day)
    (seconds->date (find-seconds 0 0 0 day month year #f) #f))

(define (meetup-day year month dow ordinal)
  (let* ([init-date (case ordinal
                      [(first second third fourth fifth)
                       (make-date year month (add1 (* 7 (sub1 (ordinal->cardinal ordinal)))))]
                      ['last
                       (let ([first-of-next-month (if (= month 12)
                                                      (make-date (add1 year) 1 1)
                                                      (make-date year (add1 month) 1))])
                         (println first-of-next-month)
                         (seconds->date (- (date->seconds first-of-next-month #f) (* 7 86400)) #f))]
                      ['teenth (make-date year month 13)])]
         [init-dow (date-week-day init-date)]
         [dow (dow->num dow)])
    (println init-date)
    (if (= dow init-dow)
        init-date
        (seconds->date (+ (* 86400 (modulo (- dow init-dow) 7))
                          (date->seconds init-date #f)) #f))))
