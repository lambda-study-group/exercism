(ns octal
  (:use [clojure.core]))

(defn to-decimal [octal]
  (reduce (fn [a b]
            (if (contains? #{\0 \1 \2 \3 \4 \5 \6 \7} b)
              (+ (* a 8)
                 (case b
                   \0 0
                   \1 1
                   \2 2
                   \3 3
                   \4 4
                   \5 5
                   \6 6
                   \7 7))
              (reduced 0))) 0 octal))
