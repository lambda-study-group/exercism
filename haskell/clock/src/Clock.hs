module Clock (addDelta, fromHourMin, toString) where

import           Text.Printf

data Clock = Clock
  { hours   :: Int
  , minutes :: Int
  } deriving (Eq, Show)

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = Clock h m
  where
    m = min `mod` 60
    h = (hour + min `div` 60) `mod` 24

toString :: Clock -> String
toString (Clock h m) = printf "%02d:%02d" h m

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min (Clock h m) = Clock h' m'
  where
    m' = (min + m) `mod` 60
    h' = (hour + h + (min + m) `div` 60) `mod` 24
