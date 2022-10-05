(ns space-age
  (:use [clojure.core]))

(defn on-earth [seconds]
  (/ seconds 31557600.0))

(defn on-mercury [seconds]
  (/ seconds (* 31557600.0 0.2408467)))

(defn on-venus [seconds]
  (/ seconds (* 31557600.0 0.61519726)))

(defn on-mars [seconds]
  (/ seconds (* 31557600.0 1.8808158)))

(defn on-jupiter [seconds]
  (/ seconds (* 31557600.0 11.862615)))

(defn on-saturn [seconds]
  (/ seconds (* 31557600.0 29.447498)))

(defn on-uranus [seconds]
  (/ seconds (* 31557600.0 84.016846)))

(defn on-neptune [seconds]
  (/ seconds (* 31557600.0 164.79132)))
