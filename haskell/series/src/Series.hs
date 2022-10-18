module Series (slices) where

import qualified Data.Char as C

slices :: Int -> String -> [[Int]]
slices n xs
  | n > length xs = []
  | n == 0 = replicate (length xs + 1) []
  | otherwise = consecutiveSubsequences n (map C.digitToInt xs) []
  where
    consecutiveSubsequences i l acc
      | length l < i = reverse acc
      | otherwise =
        consecutiveSubsequences i (tail l) (take i l : acc)
