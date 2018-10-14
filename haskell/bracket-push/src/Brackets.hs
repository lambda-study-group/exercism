module Brackets (arePaired) where

import Data.Maybe (fromJust)

expect :: Char -> Char
expect c = fromJust . lookup c $
  [ ('(', ')')
  , ('[', ']')
  , ('{', '}')
  ]

validBrackets :: String -> [Char] -> Bool
validBrackets s [] = null s
validBrackets s (c:r)
    | notElem c brackets = validBrackets s r
    | c `elem` bracketsOpen = validBrackets (expect c:s) r
    | c `elem` bracketsClose && (not . null) s = closing
    | otherwise = False
    where closing = (c == head s) && validBrackets (tail s) r
          brackets = bracketsOpen ++ bracketsClose 
          bracketsOpen = "{[("
          bracketsClose = ")]}"

arePaired :: String -> Bool
arePaired = validBrackets ""
