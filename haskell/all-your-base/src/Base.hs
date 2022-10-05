module Base (Error (..), rebase) where

import Data.Foldable (Foldable (foldl'), find)
import Data.List (unfoldr)

data Error a = InvalidInputBase | InvalidOutputBase | InvalidDigit a
  deriving (Show, Eq)

rebase :: Integral a => a -> a -> [a] -> Either (Error a) [a]
rebase inputBase outputBase inputDigits
  | inputBase <= 1 = Left InvalidInputBase
  | outputBase <= 1 = Left InvalidOutputBase
  | Just d <- find invalidDigit inputDigits = Left $ InvalidDigit d
  | otherwise = Right $ reverse $ unfoldr nextDigit intermediate
  where
    invalidDigit d = d < 0 || d >= inputBase
    intermediate = foldl' (\acc d -> acc * inputBase + d) 0 inputDigits
    nextDigit 0 = Nothing
    nextDigit d = Just (d `mod` outputBase, d `div` outputBase)
