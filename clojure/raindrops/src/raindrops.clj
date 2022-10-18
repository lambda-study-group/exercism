(ns raindrops
  (:use [clojure.core]))

(defn convert [number]
  (let [sound (with-out-str
                (when (zero? (mod number 3))
                  (print "Pling"))
                (when (zero? (mod number 5))
                  (print "Plang"))
                (when (zero? (mod number 7))
                  (print "Plong")))]
    (if (empty? sound)
      (str number)
      sound)))
