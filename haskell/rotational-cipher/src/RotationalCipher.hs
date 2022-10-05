{-# LANGUAGE OverloadedStrings #-}

module RotationalCipher (rotate) where

import qualified Data.Map as Map
import Data.Text (Text)
import qualified Data.Text as T

rotate :: Int -> Text -> Text
rotate n = T.map (rotateChar n)

rotateChar :: Int -> Char -> Char
rotateChar n c = Map.findWithDefault c c translator
  where
    lower = ['a' .. 'z']
    upper = ['A' .. 'Z']
    offset = n `mod` 26
    lowerRot = drop offset lower ++ take offset lower
    upperRot = drop offset upper ++ take offset upper
    translator = Map.fromList $ zip (lower ++ upper) (lowerRot ++ upperRot)
