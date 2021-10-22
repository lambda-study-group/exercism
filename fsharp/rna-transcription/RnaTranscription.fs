module RnaTranscription

let toRna (dna: string): string =
    String.map (fun c ->
        match c with
        | 'G' -> 'C'
        | 'C' -> 'G'
        | 'T' -> 'A'
        | 'A' -> 'U'
        | _ -> failwith "Incorrect base") dna