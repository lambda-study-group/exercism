module Raindrops (convert) where

convert :: Int -> String
convert n =
  case sounds of
    "" -> show n
    _ -> sounds
  where sound m s
          | n `mod` m == 0 = s
          | otherwise = ""
        sounds = sound 3 "Pling" <> sound 5 "Plang" <> sound 7 "Plong"
