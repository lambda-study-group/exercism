module Bob (responseFor) where

import Data.Char (isSpace, isUpper, isAlpha)
import Data.List (isSuffixOf)

trim :: String -> String
trim = filter (not . isSpace)

endsWith :: String -> String -> Bool
endsWith x xs = isSuffixOf x $ trim xs

shouting :: String -> Bool
shouting str =
  case filter isAlpha str of
    "" -> False
    xs -> all isUpper xs

question :: String -> Bool
question = endsWith "?"

silence :: String -> Bool
silence = null . trim

responseFor :: String -> String
responseFor xs
  | silence xs = "Fine. Be that way!"
  | (shouting xs && question xs) = "Calm down, I know what I'm doing!"
  | question xs = "Sure."
  | shouting xs = "Whoa, chill out!"
  | otherwise = "Whatever."
