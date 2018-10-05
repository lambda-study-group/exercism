(ns flatten-array
  (:use [clojure.core :exclude [flatten]]))

(defn flatten [v]
  (loop [[head & tail] v accum []]
    (if (nil? head)
      accum
      (if (coll? head)
        (recur tail (into accum (flatten head)))
        (recur tail (conj accum head))))))
