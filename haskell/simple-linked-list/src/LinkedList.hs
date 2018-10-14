module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data LinkedList a = Nil | a :| LinkedList a deriving (Eq, Show)

instance Foldable LinkedList where
  foldr _ z Nil = z
  foldr f z (x:|xs) = f x (foldr f z xs)

datum :: LinkedList a -> a
datum Nil = error "Empty list"
datum (x:|_) = x

fromList :: [a] -> LinkedList a
fromList = foldr (:|) Nil

isNil :: LinkedList a -> Bool
isNil Nil = True
isNil _   = False

new :: a -> LinkedList a -> LinkedList a
new = (:|)

next :: LinkedList a -> LinkedList a
next Nil = error "Empty list"
next (_:|xs) = xs

nil :: LinkedList a
nil = Nil

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = foldl (flip (:|)) Nil

toList :: LinkedList a -> [a]
toList Nil = []
toList (x:|xs) = x : toList xs
