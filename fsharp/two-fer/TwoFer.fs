module TwoFer

open System

let twoFer (name: string option) =
    let who =
        match name with
        | Some x -> x
        | None -> "you"
    String.Format("One for {0}, one for me.", who)