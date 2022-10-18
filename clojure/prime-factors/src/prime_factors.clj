(ns prime-factors
  (:use [clojure.core]))

(defn of
  "Return a list of factors of N."
  ([n]
   (of n 2 []))
  ([n k acc]
   (if (= 1 n)      
     acc
     (if (= 0 (rem n k))        
       (recur (quot n k) k (conj acc k))
       (recur n (inc k) acc)))))
