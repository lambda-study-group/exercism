(ns armstrong-numbers
  (:require [clojure.math.numeric-tower :refer [expt]]))

(defn armstrong? [num]
  (as-> num n
        (str n)
        (map #(Character/getNumericValue (char %)) n)
        (map #(expt % (count n)) n)
        (reduce + n)
        (= num n)))
