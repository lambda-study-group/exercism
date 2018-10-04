(ns nucleotide-count
  (:require [clojure.core :as core]))

(def nucleotide-types #{\A \T \C \G})

(defn count [type dna-string]
  (if-not (contains? nucleotide-types type)
    (throw (Throwable.)))
  (core/count (filter #(= type %) dna-string)))

(defn nucleotide-counts [dna-string]
  (apply merge
         (map #(hash-map % (count % dna-string)) nucleotide-types)))
