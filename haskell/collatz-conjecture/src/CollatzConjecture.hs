module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | otherwise = Just $ collatz' 0 n

collatz' :: Integer -> Integer -> Integer
collatz' acc 1 = acc
collatz' acc n
  | even n = collatz' (acc+1) (n `div` 2)
  | otherwise = collatz' (acc+1) (3*n + 1)
