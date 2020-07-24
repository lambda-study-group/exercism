module Proverb(recite) where

recite :: [String] -> String
recite [] = ""
recite [item] = reciteConclusion item
recite items = reciteReasoning items ++ reciteConclusion (head items)


reciteReasoning :: [String] -> String
reciteReasoning [] = ""
reciteReasoning [_] = ""
reciteReasoning (item : nextItem : remainingItems) = 
    "For want of a " ++ item ++ " the " ++ nextItem ++ " was lost.\n" 
    ++ reciteReasoning ([nextItem] ++ remainingItems)


reciteConclusion :: String -> String
reciteConclusion item = "And all for the want of a " ++ item ++ "."