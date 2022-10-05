(ns say
  (:require [clojure.pprint :refer [cl-format]]))

(defn number [num]
  (when-not (<= 0 num 999999999999)
    (throw (java.lang.IllegalArgumentException.)))
  (apply str (remove #(= % \,) (cl-format nil "~r" num)))
)
