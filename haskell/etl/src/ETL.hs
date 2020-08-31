module ETL (transform) where

import Data.Map (Map, fromList, assocs)
import Data.Char (toLower)

transform :: Map Int String -> Map Char Int
transform xs = fromList $ [(toLower v, k) | (k, vs) <- assocs xs, v <- vs ]
