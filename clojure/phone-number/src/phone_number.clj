(ns phone-number)

(def num-re #"(?x) ^1? \(? (\d{3}) \)? [.\s]? (\d{3}) [-.]? (\d{4})$")

(defn number [s]
  (if-let [num-tokens (re-find num-re s)]
    (apply str (rest num-tokens))
    "0000000000"))

(defn area-code [s]
  ((re-find num-re s) 1))

(defn pretty-print [s]
  (apply format "(%s) %s-%s" (rest (re-find num-re s))))
