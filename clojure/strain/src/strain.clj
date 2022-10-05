(ns strain
  (:use [clojure.core]))

(defn retain [f seq]
  (loop [seq seq
         acc []]
    (cond (empty? seq) acc
          (f (first seq)) (recur (rest seq) (conj acc (first seq)))
          :else (recur (rest seq) acc))))

(defn discard [f seq]
  (loop [seq seq
         acc []]
    (cond (empty? seq) acc
          (f (first seq)) (recur (rest seq) acc)
          :else (recur (rest seq) (conj acc (first seq))))))