(ns luhn
  (:use [clojure.core]
        [clojure.string]))

(defn process-char [c]
  (let [num (- (int c) (int \0))
        num2 (* num 2)]
    (char (+ (if (> num2 9) (- num2 9) num2) (int \0)))))

(defn char->num [c]
  (- (int c) (int \0)))

(defn valid? [string]
  (let [stripped (replace string #"\s" "")]
    (if (> 2 (count stripped))
      false
      (if (zero? (mod (reduce + (map char->num
                                     (map #(if (zero? (mod %2 2)) %1 (process-char %1))
                                          (reverse stripped) (iterate inc 0))))
                      10))
        true false))))