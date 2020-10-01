(ns bracket-push)

(def matching-brackets {\[ \] \( \) \{ \}})
(def left-brackets (set (keys matching-brackets)))
(def right-brackets (set (vals matching-brackets)))

(defn valid?
  ([input] (valid? input ()))

  ([input stack]
   (if (empty? input)
     (empty? stack)
     (let [character        (first input)
           remaining        (rest input)
           is-left-bracket  (contains? left-brackets character)
           is-right-bracket (contains? right-brackets character)]

       (if is-left-bracket
         (recur remaining (cons character stack))
         (if (and (not (empty? stack))
                  (= character (matching-brackets (first stack))))
           (recur remaining (rest stack))
           (and (not is-right-bracket)
                (recur remaining stack))))))))

