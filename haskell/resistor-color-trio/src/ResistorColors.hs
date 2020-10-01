module ResistorColors (Color(..), Resistor(..), label, ohms) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show

label :: Resistor -> String
label (Resistor (Black, Black, Black)) = "0 ohms"
label resistor
  | divBy giga = convert giga "gigaohms"
  | divBy mega = convert mega "megaohms"
  | divBy kilo = convert kilo "kiloohms"
  | otherwise = show ohms' ++ " ohms"
  where ohms' = ohms resistor
        (kilo, mega, giga) = (1000, 1000^2, 1000^3)
        divBy n = ohms' `mod` n == 0
        convert unit str = show (ohms' `div` unit) ++ " " ++ str

ohms :: Resistor -> Int
ohms (Resistor (x, y, z)) = read $ digit x ++ digit y ++ zeros
  where zeros = replicate (fromEnum z) '0'
        digit = show . fromEnum
