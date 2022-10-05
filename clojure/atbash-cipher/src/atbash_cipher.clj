(ns atbash-cipher
  (:use [clojure.core]
        [clojure.string]))

(def atbash-key (zipmap "abcdefghijklmnopqrstuvwxyz0123456789"
                        "zyxwvutsrqponmlkjihgfedcba0123456789"))

(defn encode [in]
  (join " " (map (partial apply str)
                 (partition 5 5 nil (map #(atbash-key %)
                                         (replace (lower-case in)
                                                  #"\W" ""))))))