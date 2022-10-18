(ns perfect-numbers)

(defn factors [n] 
  (filter #(zero? (rem n %))
          (range 1 (Math/ceil (/ (+ 0.5 n) 2)))))

(defn classify [n]
  (if (neg? n)
    (throw (IllegalArgumentException.))
    (let [aliquot-sum (apply + (factors n))]
      (cond (> aliquot-sum n) :abundant
            (< aliquot-sum n) :deficient
            :else :perfect))))