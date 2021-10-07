#lang racket

(module+ test
  (require rackunit rackunit/text-ui)
  (require racket/date)
  (require "meetup.rkt")

  (define (make-date year month day)
    (seconds->date (find-seconds 0 0 0 day month year #f) #f))

  (define suite
    (test-suite
     "Tests for the meetup exercise"

     (check-equal? (meetup-day 2013 5 'Monday 'teenth)
                   (make-date 2013 5 13))

     (check-equal? (meetup-day 2013 2 'Saturday 'teenth)
                   (make-date 2013 2 16))

     (check-equal? (meetup-day 2013 5 'Tuesday 'first)
                   (make-date 2013 5 7))

     (check-equal? (meetup-day 2013 4 'Monday 'second)
                   (make-date 2013 4 8))

     (check-equal? (meetup-day 2013 9 'Thursday 'third)
                   (make-date 2013 9 19))

     (check-equal? (meetup-day 2013 3 'Sunday 'fourth)
                   (make-date 2013 3 24))

     (check-equal? (meetup-day 2013 10 'Thursday 'last)
                   (make-date 2013 10 31))

     (check-equal? (meetup-day 2012 2 'Wednesday 'last)
                   (make-date 2012 2 29))))

  (run-tests suite))
