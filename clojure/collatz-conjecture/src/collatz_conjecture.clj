(ns collatz-conjecture)

(defn- step
  [n]
  (if (even? n)
    (/ n 2)
    (inc (* n 3))))

(defn collatz
  [n]
  {:pre [(pos? n)]}
  (loop [n n i 0]
    (if (= n 1)
      i
      (recur (step n) (inc i)))))
