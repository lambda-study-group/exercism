module Anagram (anagramsFor) where

import Data.List (sort)
import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor w = filter isAnagram
  where isAnagram w' = normalize w == normalize w'
                       && toLower' w /= toLower' w'
        toLower' = map toLower
        normalize = sort . toLower'
