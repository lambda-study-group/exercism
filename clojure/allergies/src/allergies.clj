(ns allergies
  (:use [clojure.core]
        [clojure.set]))

(def allergen-scores {:eggs 1
                      :peanuts 2
                      :shellfish 4
                      :strawberries 8
                      :tomatoes 16
                      :chocolate 32
                      :pollen 64
                      :cats 128})

(defn allergic-to? [score allergen]
  (let [allergen-score (allergen-scores allergen)]
    (= allergen-score (bit-and allergen-score score))))

(defn allergies [score]
  (vec (mapcat #(when (= (bit-and score (second %)) (second %))
                  [(first %)]) allergen-scores)))
