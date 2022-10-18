module Luhn (isValid) where

import qualified Data.Char as C

isValid :: String -> Bool
isValid n 
    | length normalized > 1 = sum doubled `mod` 10 == 0
    | otherwise = False
    where
        normalized = filter C.isDigit n
        numberized = reverse $ map (\c -> read [c] :: Int) normalized
        alternating = [1, 2] ++ alternating
        doubled = map trim $ zipWith (*) numberized alternating
        trim x
            | x <= 9 = x
            | otherwise = x - 9