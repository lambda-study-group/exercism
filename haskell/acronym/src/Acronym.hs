module Acronym (abbreviate) where

import Data.Char (isAlpha, isUpper, toLower, toUpper)

abbreviate :: String -> String
abbreviate = concatMap (filter pred . capitalize) . split
  where pred x = isAlpha x && isUpper x

capitalize :: String -> String
capitalize "" = ""
capitalize (x:xs)
  | all isUpper xs = toUpper x : fmap toLower xs
  | otherwise = toUpper x : xs

split :: String -> [String]
split "" = []
split str = first str : split (rest str)
  where rest = dropWhile (not . isAlpha) . dropWhile isAlpha
        first = takeWhile isAlpha
