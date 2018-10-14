module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA str
  | isDNA str = Just $ map mapDNA str
  | otherwise = Nothing

isDNA :: String -> Bool
isDNA = all (flip elem "ACGT")

mapDNA :: Char -> Char
mapDNA 'G' = 'C'
mapDNA 'C' = 'G'
mapDNA 'T' = 'A'
mapDNA 'A' = 'U'
mapDNA char = char
