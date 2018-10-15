module Beer (song) where

import Data.Char (toUpper)
import Data.List (intercalate)

song :: String
song = intercalate "\n" $ map song' [99,98..0]

capitalize :: String -> String
capitalize "" = ""
capitalize (x:xs) = toUpper x : xs

bottle :: Integer -> String
bottle n
  | n < 0 = "99 bottles"
  | n == 0 = "no more bottles"
  | n == 1 = "1 bottle"
  | otherwise = show n ++ " bottles"

decrease :: Integer -> String
decrease 0 = "Go to the store and buy some more"
decrease 1 = "Take it down and pass it around"
decrease n = "Take one down and pass it around"

song' :: Integer -> String
song' n = capitalize (bottle n) ++ " of beer on the wall, "
        ++ bottle n ++ " of beer.\n"
        ++ decrease n ++ ", " ++ bottle (n-1) ++ " of beer on the wall.\n"
