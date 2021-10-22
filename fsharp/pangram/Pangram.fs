module Pangram

open System

let isPangram (input: string): bool =
    let letters =
        input.ToCharArray()
        |> Array.filter Char.IsLetter
        |> Array.map Char.ToLower
        |> Set.ofArray

    let allLetters = [ 'a' .. 'z' ] |> Set.ofList
    letters = allLetters
