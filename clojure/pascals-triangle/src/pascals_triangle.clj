(ns pascals-triangle
  (:require [clojure.core.match :refer [match]])
  (:use [clojure.core]))

(defn next-row
  ([row] (next-row row [1]))
  ([row acc]
   (match [row acc]
          [[] acc] acc
          [[x] acc] (next-row [] (conj acc 1))
          [row acc] (next-row (subvec row 1)
                              (conj acc (+ (first row)
                                           (second row)))))))

(def triangle (iterate next-row [1]))

(defn binomial-coefficient [n k]
  (let [rprod (fn [a b] (reduce *' (range a (inc b))))]
    (/ (rprod (-' n k -1) n) (rprod 1 k))))

(defn row [n]
  (mapv #(binomial-coefficient (dec n) %) (range n)))