(ns difference-of-squares)

(defn- inclusive-range [n]
  (range 0 (inc n)))

(defn sum-of-squares [n]
  (->> (inclusive-range n)
       (map #(* % %))
       (reduce +)))

(defn square-of-sums [n]
  (let [sum (reduce + (inclusive-range n))]
    (* sum sum)))

(defn difference [n]
  (- (square-of-sums n)
     (sum-of-squares n)))
