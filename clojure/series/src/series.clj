(ns series)

(defn slices
  [s len]
  (if (zero? len)
    [""]
    (apply map str
           (map #(drop % s) (range len)))))
