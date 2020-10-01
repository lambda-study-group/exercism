{-# LANGUAGE TupleSections #-}
module WordCount (wordCount) where

import Data.Text (unpack, dropAround, pack, toLower)
import Prelude hiding (words)
import Data.List.Split (wordsBy)
import Data.Map (fromListWith, toList)

wordCount :: String -> [(String, Int)]
wordCount = toList . fromListWith (+) . map ((, 1) . dropQuote) . splitWords
  where dropQuote = unpack . toLower . dropAround (== '\'') . pack
        splitWords = wordsBy (`elem` "\n \"!@#$%^&:.,")
