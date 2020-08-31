module SecretHandshake (handshake) where

import Numeric (showIntAtBase)

toBin :: Int -> Int
toBin n = read $ showIntAtBase 2 ("01" !!) n ""

handshake :: Int -> [String]
handshake = reverse . f . toBin
  where f n
          | n >= 10000 = reverse            (f (n - 10000))
          | n >= 1000  = "jump"            : f (n - 1000)
          | n >= 100   = "close your eyes" : f (n - 100)
          | n >= 10    = "double blink"    : f (n - 10)
          | n >= 1     = ["wink"]
          | otherwise  = []
