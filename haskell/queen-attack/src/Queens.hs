module Queens (boardString, canAttack) where

type Position = (Int, Int)

separator :: Int -> Char
separator 7 = '\n'
separator _ = ' '

boardString :: Maybe Position -> Maybe Position -> String
boardString white black = concatMap createRow [0..7] where
  char :: Position -> Char
  char pos
    | white == Just pos = 'W'
    | black == Just pos = 'B'
    | otherwise = '_'

  tile :: Int -> Int -> String
  tile i j = [char (i,j), separator j]

  createRow :: Int -> String
  createRow row = concatMap (tile row) [0..7]

canAttack :: Position -> Position -> Bool
canAttack queenA queenB = cross queenA queenB || diagonal queenA queenB

diagonal :: Position -> Position -> Bool
diagonal (x,y) (z,w) = x - y == z - w || x + y == z + w

cross :: Position -> Position -> Bool
cross (x,y) (z,w) = x == z && y /= w || x /= z && y == w
