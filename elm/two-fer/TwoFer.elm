module TwoFer exposing (twoFer)

auxForTwoFer : String -> String
auxForTwoFer name =
  "One for " ++ name ++ ", one for me."


twoFer : Maybe String -> String
twoFer name =
    case name of
      Just a -> auxForTwoFer a
      Nothing -> auxForTwoFer "you"
