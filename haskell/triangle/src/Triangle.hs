module Triangle (TriangleType(..), triangleType) where

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

validTriangle :: (Num a, Ord a) => a -> a -> a -> Bool
validTriangle 0 _ _ = False
validTriangle _ 0 _ = False
validTriangle _ _ 0 = False
validTriangle a b c = a < bc && b < ac && c < ab where
  ab = a + b
  ac = a + c
  bc = b + c

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c
  | not (validTriangle a b c)  = Illegal
  | a == b && b == c           = Equilateral
  | a /= b && b /= c && a /= c = Scalene
  | otherwise                  = Isosceles
