(ns gigasecond
  (:use [clojure.core]
        [clj-time.core :as t]))

(defn from [y m d]
  (let [initial (t/date-time y m d)
        final (t/plus initial (t/seconds 1000000000))]
    ((juxt t/year t/month t/day) final)))
