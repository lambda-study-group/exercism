module RunLength (decode, encode) where

import Data.Char (isDigit)
import Data.List (group, groupBy)

encode :: String -> String
encode text = concatMap encode' xs where
  xs = group text
  encode' x
    | length x == 1 = x
    | otherwise = show (length x) ++ take 1 x

decode :: String -> String
decode encodedText = collapse (count xs) where
  xs = groupBy (\x y -> isDigit x && isDigit y) encodedText
  collapse = concatMap (\(i, (c:_)) -> replicate i c)

count :: [String] -> [(Int, String)]
count [] = []
count [x] = [(1, x)]
count (x:y:ys)
  | all isDigit x = (read x, y) : count ys
  | otherwise = (1, x) : count (y:ys)
