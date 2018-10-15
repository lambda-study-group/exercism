module Pangram (isPangram) where

import Data.Char (isAlpha, toLower)
import Data.List (nub, sort)

isPangram :: String -> Bool
isPangram text = letters text == ['a'..'z']
  where letters = sort . nub . map toLower . filter isAlpha
