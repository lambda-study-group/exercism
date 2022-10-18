(ns accumulate
  (:use [clojure.core]))

(defn accumulate [f s]
  (loop [acc []
         s s]
    (if (empty? s)
      acc
      (recur (conj acc (f (first s))) (rest s)))))