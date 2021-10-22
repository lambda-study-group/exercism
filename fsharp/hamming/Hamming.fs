module Hamming

let distance (strand1: string) (strand2: string): int option =
    match (strand1, strand2) with
    | (s1, s2) when s1.Length = s2.Length ->
        Seq.fold2 (fun dist a b ->
            match dist with
            | Some d ->
                Some(if a = b then d else d + 1)
            | None -> failwith "Incorrect state") (Some 0) strand1 strand2
    | _ -> None
