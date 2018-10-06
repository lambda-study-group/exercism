(ns leap)

(defn leap-year? [y]
  (when (= 0 (rem y 4))
    (if-not (and (= 0 (rem y 100))
                 (not= 0 (rem y 400)))
      true)))
