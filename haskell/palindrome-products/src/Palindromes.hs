module Palindromes (largestPalindrome, smallestPalindrome) where

import Data.List (find, unfoldr)

largestPalindrome :: Integer -> Integer -> Maybe (Integer, [(Integer, Integer)])
largestPalindrome minFactor maxFactor
  | minFactor > maxFactor = Nothing
  | otherwise =
    (\p -> (p, numberToFactorPairs p minFactor maxFactor))
      <$> find isAppropriate [upperLimit, upperLimit -1 .. lowerLimit]
  where
    upperLimit = maxFactor * maxFactor
    lowerLimit = minFactor * minFactor
    isAppropriate n = isNumberPalindrome n && not (null (numberToFactorPairs n minFactor maxFactor))

smallestPalindrome :: Integer -> Integer -> Maybe (Integer, [(Integer, Integer)])
smallestPalindrome minFactor maxFactor
  | minFactor > maxFactor = Nothing
  | otherwise =
    (\p -> (p, numberToFactorPairs p minFactor maxFactor))
      <$> find isAppropriate [lowerLimit .. upperLimit]
  where
    upperLimit = maxFactor * maxFactor
    lowerLimit = minFactor * minFactor
    isAppropriate n = isNumberPalindrome n && not (null (numberToFactorPairs n minFactor maxFactor))

isNumberPalindrome :: Integer -> Bool
isNumberPalindrome n = digits == reverse digits
  where
    digits = unfoldr nextDigit n

    nextDigit 0 = Nothing
    nextDigit x = Just (x `mod` 10, x `div` 10)

numberToFactorPairs :: Integer -> Integer -> Integer -> [(Integer, Integer)]
numberToFactorPairs n lower upper =
  [ (d, n')
    | d <- [lower .. upper],
      n `mod` d == 0,
      let n' = n `div` d,
      d <= n',
      lower <= d && d <= upper && lower <= n' && n' <= upper
  ]
