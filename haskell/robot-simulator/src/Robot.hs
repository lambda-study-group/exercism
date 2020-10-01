module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show, Enum)

data Robot = Robot { bearing :: Bearing
                   , coordinates :: (Int, Int)
                   }

data Rotation = TurnLeft | TurnRight

mkRobot :: Bearing -> (Int, Int) -> Robot
mkRobot = Robot

move :: Robot -> String -> Robot
move = foldl performAction
  where performAction robot action =
          case action of
            'R' -> rotate robot TurnRight
            'L' -> rotate robot TurnLeft
            'A' -> advance robot
            _ -> robot

rotate :: Robot -> Rotation -> Robot
rotate (Robot b c) r = Robot newBearing c
  where newBearing = case r of
                       TurnLeft -> cycleBearing 3
                       TurnRight -> cycleBearing 1
        cycleBearing n = cycle (enumFrom North) !! (fromEnum b + n)

advance :: Robot -> Robot
advance (Robot b (x,y)) = Robot b newCoords
  where newCoords = case b of
                   North -> (x, succ y)
                   East -> (succ x, y)
                   South -> (x, pred y)
                   West -> (pred x, y)
