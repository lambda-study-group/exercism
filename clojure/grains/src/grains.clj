(ns grains
  (:use [clojure.core]))

(defn square [n]
  (if (<= n 1)
    1
    (*' 2 (square (dec n)))))

;; Can be done more succinctly
;; (defn total
;;   "Finite geometrical series sum."
;;   []
;;   (/ (- 1 (square 65))
;;      (- 1 (square 2))))

;; Based on the observation that 2^0 + 2^1 + ... + 2^n = 2^(n+1) - 1
(defn total []
  (dec (square 65)))
