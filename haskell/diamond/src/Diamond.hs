module Diamond (diamond) where

import Data.Char (isUpper)

diamond :: Char -> Maybe [String]
diamond c
  | isUpper c = Just $ reverse half' ++ tail half'
  | otherwise = Nothing
  where line = reverse ['A'..c] ++ ['B'..c]
        half = map (const line) ['A'..c]
        half' = zipWith (\x -> map (\y -> if x == y then x else ' ')) line half
