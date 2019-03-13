module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

import Data.Foldable (foldl')

data BST a = Empty
           | Node a (BST a) (BST a)
           deriving (Eq, Show)

instance Foldable BST where
  foldr _ z Empty = z
  foldr f z (Node a left right) = foldr f (f a (foldr f z left)) right

bstLeft :: BST a -> Maybe (BST a)
bstLeft Empty = Nothing
bstLeft (Node _ left _) = Just left

bstRight :: BST a -> Maybe (BST a)
bstRight Empty = Nothing
bstRight (Node _ _ right) = Just right

bstValue :: BST a -> Maybe a
bstValue Empty = Nothing
bstValue (Node a _ _) = Just a

empty :: BST a
empty = Empty

fromList :: Ord a => [a] -> BST a
fromList = foldl' (flip insert) Empty

singleton :: a -> BST a
singleton x = Node x Empty Empty

insert :: Ord a => a -> BST a -> BST a
insert x Empty = singleton x
insert x (Node a left right)
  | a >= x = Node a (insert x left) right
  | otherwise = Node a left (insert x right)

toList :: BST a -> [a]
toList Empty = []
toList (Node a Empty Empty) = [a]
toList (Node a left right) = toList left ++ [a] ++ toList right
