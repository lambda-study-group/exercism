module Grains

let square (n: int): Result<uint64,string> = 
    if n <= 0 || n >= 65 
    then Error "square must be between 1 and 64"
    else Ok (1UL <<< (n-1))

let total: Result<uint64,string> = 
    Ok System.UInt64.MaxValue