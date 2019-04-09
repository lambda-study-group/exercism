(ns isbn-verifier)

(def valid? #{\0 \1 \2 \3 \4 \5 \6 \7 \8 \9 \X})

(defn get-digits
  [s]
  (map (fn [c]
         (if (= c \X)
           10
           (Character/digit c 10)))
   (filter valid? (seq s))))

(defn parse-digit-and-pos
  [d pos]
  (if (= d 10)
    (if (= pos 10) 100 0)
    (* d pos)))

(defn sum-digits
  [digits]
  (reduce +
          (map parse-digit-and-pos digits (range 1 11))))

(defn isbn?
  [isbn]
  (let [digits (get-digits isbn)]
    (and 
     (= 10 (count digits))
     (= 0 (mod (sum-digits digits) 11)))))
