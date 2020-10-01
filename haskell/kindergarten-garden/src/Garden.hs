module Garden
    ( Plant (..)
    , garden
    , lookupPlants
    ) where

import qualified Data.Map as M

data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

newtype Garden = Garden { fromGarden :: M.Map String [Plant] }

garden :: [String] -> String -> Garden
garden students = Garden . M.fromList . zip students . plantGroups . lines
  where plantGroups xs
          | all null xs = []
          | otherwise = map toPlant plants : plantGroups rest
          where (plants, rest) = traverse (splitAt 2) xs

        toPlant x = case x of
                    'C' -> Clover
                    'G' -> Grass
                    'R' -> Radishes
                    _ -> Violets

lookupPlants :: String -> Garden -> [Plant]
lookupPlants student = M.findWithDefault [] student . fromGarden
