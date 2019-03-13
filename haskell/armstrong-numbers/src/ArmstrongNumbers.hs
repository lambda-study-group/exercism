module ArmstrongNumbers (armstrong) where

digs :: Integral a => a -> [a]
digs 0 = []
digs n = n `mod` 10 : digs (n `div` 10)

armstrong :: Integral a => a -> Bool
armstrong n = n == sum powers where
  powers = map (\x -> x^(length digits)) digits
  digits = digs n
