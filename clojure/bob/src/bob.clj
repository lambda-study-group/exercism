(ns bob)

(defn silence? [s]
  (re-find #"^\s*$" s))

(defn yelling? [s]
  (and (re-find #"[A-Z]" s)
       (re-find #"^[^a-z]+$" s)))

(defn question? [s]
  (re-find #"\?$" s))

(defn yelling-question? [s]
  (and (yelling? s)
       (question? s)))

(defn response-for [s]
  (cond
    (silence? s)          "Fine. Be that way!"
    (yelling-question? s) "Calm down, I know what I'm doing!"
    (yelling? s)          "Whoa, chill out!"
    (question? s)         "Sure."
    :else                 "Whatever."))

;;
;; If you don't like the repetition of `s' you could use an anonymous fn
;;
;; (defn response-for [s]
;;   (condp #(% %2) s
;;     silence?          "Fine. Be that way!"
;;     yelling-question? "Calm down, I know what I'm doing!"
;;     yelling?          "Whoa, chill out!"
;;     question?         "Sure."
;;     "Whatever."))

