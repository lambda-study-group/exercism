(ns leap)

(defn- divisible? [n divisor]
  (= 0 (rem n divisor)))

(defn leap-year? [y]
  (and (divisible? y 4)
       (or (divisible? y 400)
           (not (divisible? y 100)))))
