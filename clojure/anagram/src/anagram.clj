(ns anagram
  (:require [clojure.string :as str]))

(defn- anagram? [subject candidate]
  (let [w0 (str/lower-case subject)
        w1 (str/lower-case candidate)]
    (and (not= w0 w1)
         (= (sort w0) (sort w1)))))

(defn anagrams-for [subject candidates]
  (filter #(anagram? subject %) candidates))
