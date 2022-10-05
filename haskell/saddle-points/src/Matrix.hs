module Matrix (saddlePoints) where

import           Data.Array (Array, assocs, bounds, (!))

saddlePoints :: Array (Int, Int) Int -> [(Int, Int)]
saddlePoints matrix = map fst $ filter isPointSaddle $ assocs matrix
    where
        ((rStart, cStart), (rEnd, cEnd)) = bounds matrix
        isPointSaddle ((r, c), point) =
            let row = [matrix ! (r, i) | i <- [cStart..cEnd]]
                column = [matrix ! (i, c) | i <- [rStart..rEnd]]
            in
            (point == maximum row) && (point == minimum column)
