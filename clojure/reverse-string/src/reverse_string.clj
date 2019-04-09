(ns reverse-string)

(defn reverse-string
  [s]
  (apply str
         (loop [[head & tail] (seq s) accum []]
           (if (nil? head)
             accum
             (recur tail (cons head accum))))))

;; Better solutions I saw on the leaderboard

;; reverse-string> (apply str (into '() "lake"))
;; "ekal"

;; reverse-string> (apply str (reduce conj '() "lake"))
;; "ekal"
