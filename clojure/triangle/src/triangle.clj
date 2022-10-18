(ns triangle
  (:use [clojure.core]))

(defn triangle? [x y z]
  (let [sorted (vec (sort > [x y z]))]
    (< (first sorted) (apply + (rest sorted)))))

(defn type [x y z]
  (if (triangle? x y z)
    (case (count (set [x y z]))
      1 :equilateral
      2 :isosceles
      3 :scalene)
    :illogical))
