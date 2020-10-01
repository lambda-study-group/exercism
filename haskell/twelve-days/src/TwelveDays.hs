module TwelveDays (recite) where

import Data.List

recite :: Int -> Int -> [String]
recite start stop = map day [start..stop]

day :: Int -> String
day n = concat [ "On the "
               , counts !! (n-1)
               , " day of Christmas my true love gave to me: "
               , gifts'
               ]
  where gifts' = if n == 1
                 then drop 4 $ head gifts
                 else intercalate ", " . reverse $ take n gifts

counts :: [String]
counts = ["first", "second" ,"third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

gifts :: [String]
gifts = ["and a Partridge in a Pear Tree.", "two Turtle Doves", "three French Hens", "four Calling Birds", "five Gold Rings", "six Geese-a-Laying", "seven Swans-a-Swimming", "eight Maids-a-Milking", "nine Ladies Dancing", "ten Lords-a-Leaping", "eleven Pipers Piping", "twelve Drummers Drumming"]
