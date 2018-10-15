module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys
  | length xs /= length ys = Nothing
  | otherwise = Just $ foldr (\x z -> if x then z else z+1) 0 lst
  where lst = map equalPair $ zip xs ys
        equalPair (a, b) = a == b
