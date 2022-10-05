(ns robot-simulator
  (:use [clojure.core]))

(def directions [:north :east :south :west])

(def bearing->delta {:north {:x 0 :y 1}
                     :east {:x 1 :y 0}
                     :south {:x 0 :y -1}
                     :west {:x -1 :y 0}})

(defn turn-right [bearing]
  (bearing (zipmap directions (take 4 (drop 1 (cycle directions))))))

(defn turn-left [bearing]
  (bearing (zipmap directions (take 4 (drop 3 (cycle directions))))))

(defn advance [coordinates bearing]
  (merge-with + (bearing->delta bearing) coordinates))

(defn robot [coordinates bearing]
  {:coordinates coordinates :bearing bearing})

(defn robot-operate [robot instruction]
  (case instruction
    \R (update robot :bearing turn-right)
    \L (update robot :bearing turn-left)
    \A (update robot :coordinates advance (:bearing robot))))

(defn simulate [instructions robot]
  (loop [robot robot
         instructions (seq instructions)]
    (if (empty? instructions)
      robot
      (recur (robot-operate robot (first instructions))
             (rest instructions)))))