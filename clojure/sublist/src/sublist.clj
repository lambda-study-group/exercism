(ns sublist
  (:use [clojure.core]))

(defn subseq?
  ;; ([s1 s2] (subseq? s1 s2 false))
  ;; ([s1 s2 partial-match]
  ;;  (cond (empty? s1) true
  ;;        ;;
  ;;        (empty? s2) false
  ;;        ;;
  ;;        (= (first s1) (first s2))
  ;;        (subseq? (rest s1) (rest s2) true)
  ;;        ;;
  ;;        :else (if partial-match
  ;;                false
  ;;                (subseq? s1 (rest s2) false))))
  [s1 s2]
  (loop [s1 s1
         s2 s2
         ls1 (count s1)]
    (and (<= ls1 (count s2))
         (or (= s1 (take ls1 s2))
             (recur s1 (rest s2) ls1)))))

(defn classify [s1 s2]
  (cond (= s1 s2) :equal
        (subseq? s1 s2) :sublist
        (subseq? s2 s1) :superlist
        :else :unequal))
