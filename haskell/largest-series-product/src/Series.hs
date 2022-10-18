module Series (Error (..), largestProduct) where

import Data.Char (digitToInt)
import Data.List (find)
import Data.Maybe (fromJust)

data Error = InvalidSpan | InvalidDigit Char deriving (Show, Eq)

largestProduct :: Int -> String -> Either Error Integer
largestProduct 0 _ = Right 1
largestProduct size digits
  | size < 0 || size > length digits = Left InvalidSpan
  | any (\d -> d < '0' || d > '9') digits =
    Left $ InvalidDigit $ fromJust $ find (\d -> d < '0' || d > '9') digits
  | otherwise = Right $ toInteger $ maximum products
  where
    dd = map digitToInt digits
    ddGroups = window size dd
    products = map product ddGroups

window :: Int -> [a] -> [[a]]
window n lst
  | n > length lst = []
  | otherwise =
    take n lst : window n (tail lst)
