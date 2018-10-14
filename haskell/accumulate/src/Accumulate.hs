module Accumulate (accumulate) where

accumulate :: (a -> b) -> [a] -> [b]
accumulate f = foldr (\x z -> f x : z) []
