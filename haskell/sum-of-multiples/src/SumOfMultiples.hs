module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

isMult :: Integer -> Integer -> Bool
isMult a b = a `mod` b == 0

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ filter p [1..(limit-1)]
  where p x = any (isMult x) factors
