(ns queen-attack
  (:use [clojure.core]
        [clojure.string]))

(defn board-string [coordinates]
  (let [raw (into [] (repeat 8 (into [] (repeat 8 \_))))
        subst
        (loop [raw raw
               points coordinates]
          (if (empty? points)
            raw
            (let [point (first points)
                  q (first point)
                  coord (second point)]
              (recur (assoc raw
                            (first coord)
                            (assoc (nth raw (first coord))
                                   (second coord)
                                   (nth (upper-case (name q)) 0)))
                     (rest points)))))]
    (str (join "\n" (map (partial join " ") subst)) "\n")))

(defn can-attack [coordinates]
  (let [xw (second (:w coordinates))
        yw (first (:w coordinates))
        xb (second (:b coordinates))
        yb (first (:b coordinates))]
    (or (= xw xb)
        (= yw yb)
        (= (Math/abs (- xw xb))
           (Math/abs (- yw yb))))))