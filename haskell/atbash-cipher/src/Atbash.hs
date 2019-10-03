module Atbash (decode, encode) where

import Data.List (elemIndex)
import Data.Char (isLetter,isNumber,toLower,isSpace)
import Data.Maybe (fromJust)

alphabet :: String
alphabet = "abcdefghijklmnopqrstuvwxyz" 

reverseAlphabet :: String
reverseAlphabet = reverse alphabet 

encodeCharacter :: Char -> String
encodeCharacter c 
    | isLetter c = [reverseAlphabet !! fromJust (elemIndex (toLower c) alphabet)]
    | isNumber c = [c]
    | otherwise  = ""

-- use take and drop recursively to add spaces between 5th character
encodeAddSpaces :: String -> String
encodeAddSpaces s  
 | length s < 5  = s
 | length s == 5 = s
 | otherwise     = take 5 s ++ " " ++ encodeAddSpaces (drop 5 s) 



decodeCharacter :: Char -> String 
decodeCharacter c  
    | isSpace c  = []
    | isNumber c = [c]
    | otherwise  = [alphabet !! fromJust (elemIndex (toLower c) reverseAlphabet)]

decode :: String -> String
decode cipherText = concatMap decodeCharacter cipherText

encode :: String -> String
encode plainText = encodeAddSpaces xs
    where xs = concatMap encodeCharacter plainText
