module Minesweeper (annotate) where

import           Data.Char (intToDigit)
import           Data.Ix   (inRange)
import qualified Data.Map  as Map
import qualified Data.Set as Set

annotate :: [String] -> [String]
annotate board =
    let mineCounts = getMineCounts board in
        [ [ Map.findWithDefault el (r, c) mineCounts
            | (c, el) <- zip [0..] row ]
          | (r, row) <- zip [0..] board ]

getMineCounts :: [String] -> Map.Map (Int, Int) Char
getMineCounts board =
    let maxRow = length board - 1
        maxCol = length (head board) - 1
        deltas = [ (dr, dc) | dr <- [-1..1], dc <- [-1..1], any (0/=) [dr, dc] ]
        mines = Set.fromList [ (r, c) | (r, row) <- zip [0..] board,
                                        (c, el) <- zip [0..] row,
                                        el == '*' ]
        incrementIndices = [ (r', c') | (r, row) <- zip [0..] board,
                                        (c, el) <- zip [0..] row,
                                        el == '*',
                                        (dr, dc) <- deltas,
                                        let r' = r + dr,
                                        let c' = c + dc,
                                        inRange (0, maxRow) r',
                                        inRange (0, maxCol) c',
                                        Set.notMember (r', c') mines ]
        in
        Map.map intToDigit $
            foldl (\m k-> Map.insertWith (+) k 1 m) Map.empty incrementIndices
