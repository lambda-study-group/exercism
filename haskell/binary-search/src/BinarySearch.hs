module BinarySearch (find) where

import Data.Array

find :: Ord a => Array Int a -> a -> Maybe Int
find arr x = find' arr `uncurry` bounds arr
  where
    find' a lo hi
      | lo > hi = Nothing
      | midEl == x = Just mid
      | x < midEl = find' a lo (mid - 1)
      | otherwise = find' a (mid + 1) hi
      where
        mid = (hi + lo) `div` 2
        midEl = a ! mid
