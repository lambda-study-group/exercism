(ns crypto-square
  (:use [clojure.core]
        [clojure.string]))

(defn normalize-plaintext [text]
  (replace (lower-case text) #"\W" ""))

(defn square-size
  ([text] (square-size text false))
  ([text floor]
   (let [normalized (normalize-plaintext text)
         length (count normalized)]
     (int ((if floor #(Math/floor %) #(Math/ceil %)) (Math/sqrt length))))))

;; (defn partition-breadth-first [n coll]
;;   (let [bins (int (Math/ceil (/ (count coll) n)))]
;;     (loop [coll coll
;;            i 0
;;            acc (vec (replicate bins []))]
;;       (if (empty? coll)
;;         acc
;;         (recur (rest coll)
;;                (mod (inc i) bins)
;;                (assoc acc i (conj (nth acc i) (first coll))))))))

(defn plaintext-segments
  ([text pad]
   (let [normalized (normalize-plaintext text)
         bin-size (square-size normalized)]
     (mapv join (partition bin-size bin-size (if pad (repeat " ") nil) normalized))))
  ([text] (plaintext-segments text nil)))

(defn ciphertext [text]
  (let [segments (plaintext-segments text true)]
    (join (map (comp trim join) (apply map vector segments)))))

;; The 'partition' function needs tweaking to distribute shorter
;; substrings evenly.
(defn normalize-ciphertext [text]
  (let [ciphertext (ciphertext text)
        length (square-size ciphertext true)]
    (map join (partition length length nil ciphertext))))