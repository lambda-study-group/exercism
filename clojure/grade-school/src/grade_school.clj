(ns grade-school)

(defn grade [db gr]
  (get db gr []))

(defn add [db student gr]
  (let [roster (grade db gr)]
    (assoc db gr (conj roster student))))

(defn sorted [db]
  (into (sorted-map)
        (for [gr (keys db)]
          [gr (vec (sort (db gr)))])))
