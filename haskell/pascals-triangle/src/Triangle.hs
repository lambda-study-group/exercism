module Triangle (rows) where

rows :: Int -> [[Integer]]
rows n = tailRows n []
    where
        tailRows 0 acc       = reverse acc
        tailRows x []        = tailRows (x-1) [[1]]
        tailRows x acc@(a:_) = tailRows (x-1) ((zipWith (+) (a++[0]) (0:a)):acc)
