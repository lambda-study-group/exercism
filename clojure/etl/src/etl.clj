(ns etl
  (:require [clojure.string :as str]))

(defn denormalize [k elts]
  (apply merge
         (map #(hash-map (str/lower-case %) k) elts)))

(defn transform [d]
  (apply merge
         (for [score (-> d keys sort)]
           (denormalize score (d score)))))