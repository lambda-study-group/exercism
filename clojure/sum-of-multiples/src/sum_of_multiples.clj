(ns sum-of-multiples
  (:use [clojure.core]))

(defn sum-of-multiples [divisors number]
  (reduce + (filter (fn [x]
                      (reduce #(or %1 %2) false
                              (map #(zero? (mod x %1)) divisors)))
                    (range 1 number))))