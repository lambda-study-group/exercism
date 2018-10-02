(ns word-count
  (:require [clojure.string :as str]))

(defn get-words [input]
  (map str/lower-case (re-seq #"\w+" input)))

(defn add-word [counts word]
  (assoc counts word (inc (or (counts word) 0))))

(defn word-count [input]
  (let [words (get-words input)]
    (loop [word (first words) tail (rest words) counts {}]
      (if word
        (recur (first tail) (rest tail) (add-word counts word))
        counts))))
