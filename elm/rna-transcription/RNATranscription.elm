module RNATranscription exposing (toRNA)


nucleotideToRNA : Char -> Char
nucleotideToRNA nucleotide =
    case nucleotide of
        'G' ->
            'C'

        'C' ->
            'G'

        'T' ->
            'A'

        'A' ->
            'U'

        _ ->
            nucleotide


toRNA : String -> Result Char String
toRNA dna =
    dna
        |> String.map nucleotideToRNA
        |> Ok
