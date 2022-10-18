(ns roman-numerals
  (:use [clojure.pprint]))

(defn numerals
  "Leverage Common Lisp FTW"
  [arabic]
  (cl-format nil "~@r" arabic))
