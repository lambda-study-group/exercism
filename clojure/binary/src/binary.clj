(ns binary
  (:use [clojure.pprint]))

(defn to-decimal [binary]
  (reduce #(+ (bit-shift-left %1 1) (if (= %2 \1) 1 0)) 0 binary))