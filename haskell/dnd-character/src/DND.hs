module DND
  ( Character(..)
  , ability
  , modifier
  , character
  ) where

import Test.QuickCheck (Gen, choose)

data Character = Character
  { strength     :: Int
  , dexterity    :: Int
  , constitution :: Int
  , intelligence :: Int
  , wisdom       :: Int
  , charisma     :: Int
  , hitpoints    :: Int
  }
  deriving (Show, Eq)

modifier :: Int -> Int
modifier = (`div` 2) . subtract 10

ability :: Gen Int
ability = choose (3, 18)

character :: Gen Character
character = ability >>= char
  where char con = Character
          <$> ability
          <*> ability
          <*> pure con
          <*> ability
          <*> ability
          <*> ability
          <*> pure (modifier con + 10)
