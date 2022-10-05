(ns binary-search-tree
  (:use [clojure.core]))

(defn singleton [n]
  {:value n :left nil :right nil})

(defn value [node]
  (:value node))

(defn left [node]
  (:left node))

(defn right [node]
  (:right node))

(defn insert [n node]
  (cond ;; (= n (value node)) node
        (nil? node) (singleton n)
        (<= n (value node)) (update node :left (partial insert n))
        (> n (value node)) (update node :right (partial insert n))))

(defn from-list [lst]
  (reduce #(insert %2 %1) nil lst))

(defn to-list [node]
  (if (nil? node)
    []
    (into [] (concat (to-list (left node))
                     [(value node)]
                     (to-list (right node))))))