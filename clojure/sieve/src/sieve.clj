(ns sieve
  (:use [clojure.core]))

(defn sieve [n]
  (let [init (range 2 (inc n))
        limit (int (Math/ceil (Math/sqrt n)))]
    (loop [remaining init
           primes []]
      (if (> (first remaining) limit)
        (vec (concat primes remaining))
        (let [first (first remaining)]
          (recur (filter #(not (zero? (mod % first))) remaining)
                 (conj primes first)))))))