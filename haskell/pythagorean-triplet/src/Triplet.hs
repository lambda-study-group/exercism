module Triplet (tripletsWithSum) where

import           Data.List

tripletsWithSum :: Int -> [(Int, Int, Int)]
tripletsWithSum sum = [ (a, b, c) | a <- [1..sum-2]
                                  , b <- [a..sum-2]
                                  , let c = sum - a - b
                                  , a < b, b < c
                                  , pythagorean $ sort [a, b, c] ]
    where
        pythagorean [a, b, c] = a^2 + b^2 == c^2
