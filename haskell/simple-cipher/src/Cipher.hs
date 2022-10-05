module Cipher (caesarDecode, caesarEncode, caesarEncodeRandom) where

import Data.Char ( ord, chr )
import System.Random ( newStdGen, Random(randomRs) )

caesarEncode :: String -> String -> String
caesarEncode key = zipWith substitute (cycle key)
  where
    substitute :: Char -> Char -> Char
    substitute k c = chr $ (ord k + ord c - (2 * ord 'a')) `mod` 26 + ord 'a'

caesarDecode :: String -> String -> String
caesarDecode key = zipWith substitute (cycle key)
  where
    substitute :: Char -> Char -> Char
    substitute k c = chr $ (ord c - ord k + 26) `mod` 26 + ord 'a'

caesarEncodeRandom :: String -> IO (String, String)
caesarEncodeRandom text = do
  g <- newStdGen
  let key = take (length text) $ randomRs ('a', 'z') g
  pure (key, caesarEncode key text)
