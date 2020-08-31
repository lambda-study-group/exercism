module Scrabble (scoreLetter, scoreWord) where

import Data.Char (toUpper)
import Data.List (find)

scoreLetter :: Char -> Integer
scoreLetter l = maybe 0 fst $ find (elem (toUpper l) . snd) scores
  where scores = [ (1, "AEIOULNRST")
                 , (2, "DG")
                 , (3, "BCMP")
                 , (4, "FHVWY")
                 , (5, "K")
                 , (8, "JX")
                 , (10, "QZ")
                 ]

scoreWord :: String -> Integer
scoreWord = sum . map scoreLetter
