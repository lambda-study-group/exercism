module CustomSet
  ( delete
  , difference
  , empty
  , fromList
  , insert
  , intersection
  , isDisjointFrom
  , isSubsetOf
  , member
  , null
  , size
  , toList
  , union
  ) where

import Prelude hiding (null)
import qualified Data.Map as M

-- data CustomSet a = Map a () deriving (Eq, Show)
type CustomSet a = M.Map a ()

delete :: (Ord a) => a -> CustomSet a -> CustomSet a
delete = M.delete

difference :: (Ord a) => CustomSet a -> CustomSet a -> CustomSet a
difference setA setB = M.filterWithKey (\k _ -> M.notMember k setB) setA

empty :: CustomSet a
empty = M.empty

fromList :: (Ord a) => [a] -> CustomSet a
fromList xs = M.fromList $ zip xs $ repeat ()

insert :: (Ord a) => a -> CustomSet a -> CustomSet a
insert x = M.insert x ()

intersection :: (Ord a) => CustomSet a -> CustomSet a -> CustomSet a
intersection = M.intersection

isDisjointFrom :: (Ord a) => CustomSet a -> CustomSet a -> Bool
isDisjointFrom setA setB = not $ any (`M.member` setB) $ M.keys setA

isSubsetOf :: (Ord a) => CustomSet a -> CustomSet a -> Bool
isSubsetOf setA setB = all (`M.member` setB) $ M.keys setA

member :: (Ord a) => a -> CustomSet a -> Bool
member = M.member

null :: CustomSet a -> Bool
null = M.null

size :: CustomSet a -> Int
size = M.size

toList :: CustomSet a -> [a]
toList = M.keys

union :: (Ord a) => CustomSet a -> CustomSet a -> CustomSet a
union = M.union
