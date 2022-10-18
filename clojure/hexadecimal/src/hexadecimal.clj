(ns hexadecimal
  (:use [clojure.core]))

(defn hex-to-int [hex]
  (reduce (fn [a b]
            (if (contains? #{\0 \1 \2 \3 \4 \5 \6 \7 \8 \9 \a \b \c \d \e \f} b)
              (+ (* a 16)
                 (case b
                   \0 0
                   \1 1
                   \2 2
                   \3 3
                   \4 4
                   \5 5
                   \6 6
                   \7 7
                   \8 8
                   \9 9
                   \a 10
                   \b 11
                   \c 12
                   \d 13
                   \e 14
                   \f 15))
              (reduced 0))) 0 hex))