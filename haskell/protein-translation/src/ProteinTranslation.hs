module ProteinTranslation(proteins) where

import qualified Data.Map as M
import Data.List.Split (chunksOf)

proteinMap :: M.Map String String
proteinMap = M.fromList [ ("AUG", "Methionine")
                        , ("UUU", "Phenylalanine")
                        , ("UUC", "Phenylalanine")
                        , ("UUA", "Leucine")
                        , ("UUG", "Leucine")
                        , ("UCU", "Serine")
                        , ("UCC", "Serine")
                        , ("UCA", "Serine")
                        , ("UCG", "Serine")
                        , ("UAU", "Tyrosine")
                        , ("UAC", "Tyrosine")
                        , ("UGU", "Cysteine")
                        , ("UGC", "Cysteine")
                        , ("UGG", "Tryptophan")
                        ]

proteins :: String -> Maybe [String]
proteins = toProteins . untilStop . chunksOf 3
  where untilStop = takeWhile (`notElem` ["UAA", "UAG", "UGA"])
        toProteins = traverse (`M.lookup` proteinMap)
