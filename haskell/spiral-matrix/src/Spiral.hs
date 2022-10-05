module Spiral (spiral) where

import           Data.List

spiral :: Int -> [[Int]]
spiral 0 = []
spiral size = groupN size $ map snd $ sort points
    where
        points = foldl (\acc@(((r,c),v):_) (dr,dc) -> ((r+dr,c+dc),v+1):acc) [((1,1),1)] steps
        steps = foldl (++) [] $
            zipWith (\i d -> replicate i d) (intervals size) (cycle deltas)
        groupN _ [] = []
        groupN n l  = (take n l) : (groupN n (drop n l))

-- Sequence of directional deltas for moving clockwise,
-- starting in the top left corner
deltas :: [(Int, Int)]
deltas = [(0, 1), (1, 0), (0, (-1)), ((-1), 0)]

-- List of interval lengths constituting the spiral polygonal chain
intervals :: Int -> [Int]
intervals n =
    (n-1):concatMap (replicate 2) [(n-1),(n-2)..1]
