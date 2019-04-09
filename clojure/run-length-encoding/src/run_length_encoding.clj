(ns run-length-encoding)

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (->> (partition-by identity plain-text)
       (map (fn [coll]
              (let [char (first coll) cnt (count coll)]
                (if (= cnt 1)
                  char
                  (str cnt char)))))
       (apply str)))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (->> (re-seq #"(?i)(\d+)?([a-z\s])" cipher-text)
       (mapcat (fn [[_ cnt char]]
                 (if (nil? cnt)
                   char
                   (repeat (Integer/parseInt cnt) char))))
       (apply str)))
