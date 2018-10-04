(ns clock)

(defn calc-min-of-day
  "For some (potentially negative) value of minutes m return
  equivalent minute of a day, wrapping as needed."
  [m]
  (let [min-per-day (* 60 24)
        offset (mod m min-per-day)]
    (if (neg? offset)
      (+ offset min-per-day)
      offset)))

(defn clock [h m]
  (let [tot-min (+ m (* h 60))]
    min (calc-min-of-day tot-min)))

(defn clock->string [m]
  (format "%02d:%02d" (quot m 60) (mod m 60)))

(defn add-time [m delt]
  (clock 0 (+ m delt)))
