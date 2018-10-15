module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.List (nub)
import Data.Map (Map, fromList, union)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show, Read)

readDNA :: String -> Nucleotide
readDNA = read

isDNA :: String -> Bool
isDNA = all (flip elem "ACGT")

mapStr :: [Char] -> [String]
mapStr = map pure

count :: Eq a => a -> [a] -> Int
count _ [] = 0
count el (x:xs)
  | el == x = 1 + count el xs
  | otherwise = count el xs

countDNA :: String -> Map Nucleotide Int
countDNA xs = fromList . nub $ fmap (\n -> (n, count n dna)) dna
  where dna = fmap readDNA $ mapStr xs

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs
  | isDNA xs = Right $ union (countDNA xs) emptyMap
  | otherwise = Left "Not valid DNA string"
  where emptyMap = fromList [(A,0), (C,0), (T,0), (G,0)]
