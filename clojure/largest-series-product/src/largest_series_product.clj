(ns largest-series-product
  (:use [clojure.core]))

(defn string->digits [string]
  (let [digits (mapv #(- (int %) (int \0)) string)]
    (if (some #(or (< % 0) (> % 9)) digits)
      (throw (Throwable.))
      digits)))

(defn largest-product [n string]
  (let [sequence (map (partial apply *)
                      (partition n 1 (string->digits string)))]
    (cond (zero? n) 1
          (neg? n) (throw (Throwable.))
          (empty? sequence) (throw (Throwable.))
          :else (apply max sequence))))