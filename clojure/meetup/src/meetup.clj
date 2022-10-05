(ns meetup
  (:use [clojure.core]
        [clj-time.core :as t]
        [clj-time.periodic :as p]))

(def dow {:monday 1
          :tuesday 2
          :wednesday 3
          :thursday 4
          :friday 5
          :saturday 6
          :sunday 7})

(defn meetup [month year day-of-week descriptor]
  (let [date (t/date-time year month)
        date-range (p/periodic-seq date (t/plus date (t/months 1)) (t/days 1))
        matching-dow (filter #(= (dow day-of-week) (t/day-of-week %)) date-range)
        teenth-dow (first (filter #(and (= (dow day-of-week) (t/day-of-week %))
                                        (< 12 (t/day %) 20)) date-range))
        pre-answer (merge (zipmap [:first :second :third :fourth] matching-dow)
                          {:teenth teenth-dow}
                          {:last (last matching-dow)})
        answer (pre-answer descriptor)]
    ((juxt t/year t/month t/day) answer)))
