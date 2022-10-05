module Change (findFewestCoins) where

import Data.Maybe (listToMaybe)

findFewestCoins :: Integer -> [Integer] -> Maybe [Integer]
findFewestCoins target coins = listToMaybe $ findFewestCoins' target coins
  where
    -- Stolen from kayhide
    findFewestCoins' :: Integer -> [Integer] -> [[Integer]]
    findFewestCoins' _ [] = []
    findFewestCoins' t cc@(c : cs)
      | t < 0 = []
      | t == 0 = [[]]
      | otherwise =
        findFewestCoins' t cs
          <> ((c :) <$> findFewestCoins' (t - c) cc)
