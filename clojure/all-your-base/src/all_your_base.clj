(ns all-your-base
  (:use [clojure.core]))

(defn convert [in-base in-seq out-base]
  (cond (or (not-every? #(< -1 % in-base) in-seq)
            (<= in-base 1)
            (<= out-base 1)) nil
        (empty? in-seq) '()
        (every? zero? in-seq) '(0)
        :else (let [decimal (reduce #(+ (* in-base %1) %2)
                                    0 in-seq)]
                (loop [decimal decimal
                       acc '()]
                  (if (zero? decimal)
                    acc
                    (recur (quot decimal out-base)
                           (cons (mod decimal out-base) acc)))))))