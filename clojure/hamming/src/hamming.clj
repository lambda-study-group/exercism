(ns hamming)

(defn distance [s0 s1]
  (when (= (count s0) (count s1))
    (count (filter false? (map #(= % %2) s0 s1)))))
