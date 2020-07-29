module NucleotideCount exposing (nucleotideCounts)


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


nucleotideCounts : String -> NucleotideCounts
nucleotideCounts sequence =
    { a = countOccurences 'A' sequence
    , t = countOccurences 'T' sequence
    , c = countOccurences 'C' sequence
    , g = countOccurences 'G' sequence
    }


countOccurences : Char -> String -> Int
countOccurences needle =
    String.length << String.filter ((==) needle)
