module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient
                    | Perfect
                    | Abundant
                    deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify x
  | x <= 0          = Nothing
  | aliquotSum == x = Just Perfect
  | aliquotSum > x  = Just Abundant
  | otherwise       = Just Deficient
    where aliquotSum = sum $ factors x

factors :: Int -> [Int]
factors x = filter (\n -> x `rem` n == 0) [1..pred x]
