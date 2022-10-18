(ns kindergarten-garden
  (:use [clojure.core]
        [clojure.string]))

(def kids ["Alice" "Bob" "Charlie" "David"
           "Eve" "Fred" "Ginny" "Harriet"
           "Ileana" "Joseph" "Kincaid" "Larry"
           ])

(def plants {\G :grass, \C :clover, \R :radishes, \V :violets})

(defn garden
  ([string] (garden string kids))
  ([string students]
   (let [students (mapv (comp keyword lower-case) (sort students))
         rows (split-lines string)
         translated-rows (mapv (fn [row] (mapv #(plants %) row)) rows)
         groups (apply mapv concat
                       (map (partial partition 2) translated-rows))]
     (zipmap students groups))))