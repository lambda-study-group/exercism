#lang racket

(provide response-for)

(define (response-for s)
  (cond [(string=? "" (string-trim s)) "Fine. Be that way!"]
        [(char=? #\? (string-ref s (sub1 (string-length s))))
         (if (and (not (string=? s (string-downcase s)))
                  (string=? s (string-upcase s)))
             "Calm down, I know what I'm doing!"
             "Sure.")]
        [(and (not (string=? s (string-downcase s)))
              (string=? s (string-upcase s)))
         "Whoa, chill out!"]
        [#t "Whatever."]))
