(ns trinary
  (:require [clojure.math.numeric-tower :refer [expt]]))

(def trinary-digits {\0 0 \1 1 \2 2})

(defn- valid-trinary? [potential-trinary]
  (cond
    (empty? potential-trinary) true
    (contains? (set (keys trinary-digits))
               (first potential-trinary)) (recur (rest potential-trinary))
    :else false))

(defn- to-decimal-tail [trinary-number accumulator]
  (if (empty? trinary-number)
    accumulator
    (let [digit         (trinary-digits (first trinary-number))
          power         (expt 3 (dec (count trinary-number)))
          decimal-value (* digit power)]
      (recur
        (rest trinary-number)
        (+ accumulator decimal-value)))))

(defn to-decimal [trinary-number]
  (if (valid-trinary? trinary-number)
    (to-decimal-tail trinary-number 0)
    0))
