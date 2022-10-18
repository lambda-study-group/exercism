module CryptoSquare (encode) where

import qualified Data.Char as C
import Control.Applicative ( ZipList(ZipList, getZipList) )

encode :: String -> String
encode "" = ""
encode xs = unwords transposed
    where
        normalized = map C.toLower $ filter C.isAlphaNum xs
        len = length normalized
        cols = ceiling $ sqrt (fromIntegral len :: Double)
        rows = ceiling $ (fromIntegral len :: Double) / (fromIntegral cols :: Double)
        chunks = chunksOf cols [] $ take (cols*rows) $ normalized ++ repeat ' '
        transposed = getZipList $ traverse ZipList chunks

chunksOf :: Int -> [[a]] -> [a] -> [[a]]
chunksOf _ acc [] = reverse acc
chunksOf n acc lst = chunksOf n (take n lst:acc) (drop n lst)