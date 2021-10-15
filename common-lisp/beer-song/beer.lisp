(in-package #:cl-user)
(defpackage #:beer
  (:use #:common-lisp)
  (:export #:verse #:sing))

(in-package #:beer)

(defun verse (n)
  (format nil "~[No more~:;~:*~d~] bottle~:p of beer on the wall, ~
               ~[no more~:;~:*~d~] bottle~:p of beer.~&~
               ~[Go to the store~;Take it down~:;Take one down~] ~
               and ~[buy some more~:;pass it around~], ~
               ~[no more~:;~:*~d~] bottle~:p of beer on the wall.~&"
          n n n n (mod (1- n) 100)))

(defun sing (start &optional (end 0))
  (let ((verses (loop for n from start downto end
                   collect (verse n))))
    (format nil "~{~a~^~%~}~%" verses)))