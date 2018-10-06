(ns beer-song
  (:require [clojure.string :as str]))

(defn x-bottles [num]
  (condp = num
    0 "no more bottles"
    1 "1 bottle"
    (str num " bottles")))

(defn x-bottles-caps [num]
  (str/capitalize (x-bottles num)))

(defn action [num]
  (condp = num
    0 "Go to the store and buy some more"
    1 "Take it down and pass it around"
    "Take one down and pass it around"))

(defn verse [num]
  (format "%s of beer on the wall, %s of beer.\n%s, %s of beer on the wall.\n"
          (x-bottles-caps num)
          (x-bottles num)
          (action num)
          (x-bottles (mod (dec num) 100))))

(defn sing
  ([start] (sing start 0))
  ([start end]
   (str/join "\n"
             (for [i (reverse (range end (inc start)))]
               (verse i)))))
