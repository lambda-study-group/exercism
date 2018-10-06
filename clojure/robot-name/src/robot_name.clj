(ns robot-name)

(def name-registry (ref #{}))

(defn- rand-name []
  (apply str (concat 
              (repeatedly 2 #(-> (rand-int 25) (+ 65) char))
              (repeatedly 3 #(rand-int 9)))))

(defn- new-name []
  (dosync
   (loop [name (rand-name)]
     (if-not (contains? @name-registry name)
       (do
         (alter name-registry conj name)
         name)
       (recur (rand-name))))))

(defn robot []
  (atom (new-name)))

(defn robot-name [r] @r)

(defn reset-name [r]
  (reset! r (new-name)))
