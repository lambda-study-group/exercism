module ResistorColors (Color(..), value) where

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
  deriving (Eq, Show, Enum)

value :: (Color, Color) -> Int
value (a, b) = read $ concatMap (show . fromEnum) [a, b]
