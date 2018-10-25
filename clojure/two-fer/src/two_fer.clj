(ns two-fer
  (:require [clojure.core.strint :refer [<<]]))

(defn two-fer
  ([] (two-fer "you"))
  ([name] (<< "One for ~{name}, one for me.")))

