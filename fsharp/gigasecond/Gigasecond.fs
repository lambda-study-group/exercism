module Gigasecond

open System

let add (beginDate:DateTime) = 
    beginDate.AddSeconds(1_000_000_000.0)