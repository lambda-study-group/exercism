module Prime (nth) where

primes :: [Integer]
primes = filterPrimes [2..] where
  filterPrimes (x:xs) =
    x : filterPrimes (filter (\n -> n `mod` x /= 0) xs)

prime :: Int -> Integer
prime = (primes !!)

nth :: Int -> Maybe Integer
nth n
  | n <= 0 = Nothing
  | otherwise = Just $ prime (n-1)
