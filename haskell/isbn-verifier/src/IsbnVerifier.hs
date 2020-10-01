module IsbnVerifier (isbn) where

import Data.Char (isNumber, digitToInt)

isbn :: String -> Bool
isbn code = length sanitized /= 10 && formula parsed == 0
  where sanitized = filter (\n -> isNumber n || n == 'X') code
        parsed = parse sanitized

formula :: [Int] -> Int
formula ns = sum (zipWith (*) ns [10, 9..1]) `mod` 11

parse :: String -> [Int]
parse code = digits ++ [check]
  where digits = map digitToInt . filter isNumber $ init code
        check = case last code of
                  'X' -> 10
                  n -> digitToInt n
