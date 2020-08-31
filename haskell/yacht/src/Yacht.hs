module Yacht (yacht, Category(..)) where

import Data.List

data Category = Ones
              | Twos
              | Threes
              | Fours
              | Fives
              | Sixes
              | FullHouse
              | FourOfAKind
              | LittleStraight
              | BigStraight
              | Choice
              | Yacht
              deriving (Enum)

yacht :: Category -> [Int] -> Int
yacht category dice =
  case category of
    FullHouse -> case groups of
                   [[_], _] -> 0
                   [_, [_]] -> 0
                   [_, _] -> sum dice
                   _ -> 0

    FourOfAKind -> case filter ((>= 4) . length) groups of
                     [xs] -> sum $ take 4 xs
                     _ -> 0

    LittleStraight -> sequence' [1..5]
    BigStraight -> sequence' [2..6]
    Choice -> sum dice
    Yacht -> if all (== head dice) dice then 50 else 0
    _ -> sumEquals
    where sumEquals = sum $ filter (== fromEnum category + 1) dice
          groups = group $ sort dice
          sequence' xs = if sort dice == xs then 30 else 0
