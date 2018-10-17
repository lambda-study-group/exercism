(ns accumulate)

(defn accumulate
  ([f coll]
   (accumulate f coll []))

  ([f coll accumulator]
   (if (empty? coll)
     accumulator
     (recur f
            (rest coll)
            (conj accumulator (f (first coll)))))))
