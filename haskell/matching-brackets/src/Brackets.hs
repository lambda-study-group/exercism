module Brackets (arePaired) where

import Data.List as L

arePaired :: String -> Bool
arePaired xs = processChars xs []
  where
    processChars [] unmatched = L.null unmatched
    processChars (c : cc) unmatched
      | c `elem` opening = processChars cc (c : unmatched)
      | c `elem` closing && not (L.null unmatched) =
        (matchOpening c == head unmatched)
          && processChars cc (tail unmatched)
      | c `elem` closing = False
      | otherwise = processChars cc unmatched

opening :: [Char]
opening = ['(', '[', '{']

closing :: [Char]
closing = [')', ']', '}']

matchOpening :: Char -> Char
matchOpening ')' = '('
matchOpening ']' = '['
matchOpening '}' = '{'
matchOpening c = c