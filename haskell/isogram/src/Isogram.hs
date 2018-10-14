module Isogram (isIsogram) where

import Data.Char (isAlpha, toLower)
import Data.List (nub)

isIsogram :: String -> Bool
isIsogram str = (==) <*> nub $ clear str
  where clear = map toLower . filter isAlpha
