module School (School, add, empty, grade, sorted) where

import qualified Data.Map as M
import Data.List (sort)
import Data.Maybe

type School = M.Map Int [String]

add :: Int -> String -> School -> School
add gradeNum student = M.insertWith (\xs -> sort . (++ xs)) gradeNum [student]

empty :: School
empty = M.empty

grade :: Int -> School -> [String]
grade gradeNum = fromMaybe [] . M.lookup gradeNum

sorted :: School -> [(Int, [String])]
sorted = M.toAscList
