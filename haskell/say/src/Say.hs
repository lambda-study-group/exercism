module Say (inEnglish) where

import Data.List (unfoldr)
import Data.Maybe

inEnglish :: Integer -> Maybe String
inEnglish n
  | n < 0 = Nothing
  | n == 0 = Just "zero"
  | otherwise = Just $ unwords $ mapMaybe chunkToEnglish' chunked
  where
    toGroups 0 = Nothing
    toGroups i = Just (i `mod` 1000, i `div` 1000)

    chunked = reverse $ zip (unfoldr toGroups n) (iterate (* 1000) 1)

powersOfThousand :: Integer -> String
powersOfThousand 1000 = " thousand"
powersOfThousand 1000000 = " million"
powersOfThousand 1000000000 = " billion"
powersOfThousand 1000000000000 = " trillion"
powersOfThousand _ = ""

singleDigit :: Integer -> String
singleDigit 0 = "zero"
singleDigit 1 = "one"
singleDigit 2 = "two"
singleDigit 3 = "three"
singleDigit 4 = "four"
singleDigit 5 = "five"
singleDigit 6 = "six"
singleDigit 7 = "seven"
singleDigit 8 = "eight"
singleDigit 9 = "nine"
singleDigit _ = ""

teens :: Integer -> String
teens 10 = "ten"
teens 11 = "eleven"
teens 12 = "twelve"
teens 13 = "thirteen"
teens 14 = "fourteen"
teens 15 = "fifteen"
teens 16 = "sixteen"
teens 17 = "seventeen"
teens 18 = "eighteen"
teens 19 = "nineteen"
teens _ = ""

multiplesOfTen :: Integer -> String
multiplesOfTen 20 = "twenty"
multiplesOfTen 30 = "thirty"
multiplesOfTen 40 = "forty"
multiplesOfTen 50 = "fifty"
multiplesOfTen 60 = "sixty"
multiplesOfTen 70 = "seventy"
multiplesOfTen 80 = "eighty"
multiplesOfTen 90 = "ninety"
multiplesOfTen _ = ""

chunkToEnglish :: Integer -> String
chunkToEnglish n
  | n == 0 = ""
  | n < 10 = singleDigit n
  | n < 20 = teens n
  | n < 100 =
    multiplesOfTen (n `div` 10 * 10)
      ++ (if nmod10 == 0 then "" else "-" ++ singleDigit nmod10)
  | otherwise =
    (singleDigit (n `div` 100) ++ " hundred")
      ++ (if nmod100 == 0 then "" else " ")
      ++ chunkToEnglish (n `mod` 100)
  where
    nmod10 = n `mod` 10
    nmod100 = n `mod` 100

chunkToEnglish' :: (Integer, Integer) -> Maybe String
chunkToEnglish' (n, k) = if x == "" then Nothing else Just $ x ++ y
  where
    x = chunkToEnglish n
    y = powersOfThousand k
