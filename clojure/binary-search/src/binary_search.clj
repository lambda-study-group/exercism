(ns binary-search
  (:use [clojure.core]))

(defn middle [vector]
  (let [len (count vector)]
    ((if (even? len) dec identity)
     (quot len 2))))

(defn search-for [item seq]
  (loop [seq (vec seq)
         delta 0]
    (if (empty? seq)
      (throw (Throwable. "not found"))
      (let [mid-ind (middle seq)
            mid-el (nth seq mid-ind)]
        (cond (= item mid-el) (+ delta mid-ind)
              (< item mid-el) (recur (subvec seq 0 mid-ind) delta)
              (> item mid-el) (recur (subvec seq (inc mid-ind))
                                     (+ delta (inc mid-ind))))))))
