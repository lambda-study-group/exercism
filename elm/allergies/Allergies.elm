module Allergies exposing (isAllergicTo, toList)


type alias Bit =
    Bool


intToBits : Int -> List Bit
intToBits num =
    case num of
        0 ->
            [ False ]

        1 ->
            [ True ]

        _ ->
            intToBits (num // 2) ++ [ modBy 2 num == 1 ]


isAllergicTo : String -> Int -> Bool
isAllergicTo name score =
    List.member name (toList score)


allergens : List String
allergens =
    [ "cats", "pollen", "chocolate", "tomatoes", "strawberries", "shellfish", "peanuts", "eggs" ]


pairs : List a -> List b -> List ( a, b )
pairs xs ys =
    List.map2 Tuple.pair xs ys


takeLast n xs =
    List.drop (List.length xs - n) xs


toList : Int -> List String
toList score =
    let
        bits =
            intToBits score

        numAllergens =
            List.length allergens

        allergenValues =
            takeLast numAllergens bits

        numConsideredAllergens =
            List.length allergenValues

        consideredAllergens =
            takeLast numConsideredAllergens allergens

        pairedAllegrens =
            pairs allergenValues consideredAllergens
    in
    List.filterMap
        (\( val, name ) ->
            if val then
                Just name

            else
                Nothing
        )
        pairedAllegrens
