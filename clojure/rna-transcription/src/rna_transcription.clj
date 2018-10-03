(ns rna-transcription)

(def dna-to-rna {\G \C, \C \G, \T \A, \A \U})

(defn to-rna [dna]
  (apply str (map #(or (dna-to-rna %)
                       (assert false)) dna)))
