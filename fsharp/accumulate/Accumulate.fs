module Accumulate

let rec accumulate (func: 'a -> 'b) (input: 'a list): 'b list = 
    match input with
    | [] -> []
    | h::t -> (func h) :: (accumulate func t)
