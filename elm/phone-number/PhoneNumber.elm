module PhoneNumber exposing (getNumber)


getNumber : String -> Maybe String
getNumber str =
    let
        phoneNumber =
            String.filter Char.isDigit str
    in
    case String.length phoneNumber of
        11 ->
            if String.startsWith "1" phoneNumber then
                Just (String.dropLeft 1 phoneNumber)

            else
                Nothing

        10 ->
            if isAreaCodeValid phoneNumber && isExchangeCodeValid phoneNumber then
                Just phoneNumber

            else
                Nothing

        _ ->
            Nothing


isAreaCodeValid : String -> Bool
isAreaCodeValid =
    Maybe.withDefault False << Maybe.map (\num -> num > 1) << String.toInt << String.left 1


isExchangeCodeValid : String -> Bool
isExchangeCodeValid =
    Maybe.withDefault False << Maybe.map (\num -> num > 1) << String.toInt << String.left 1 << String.dropLeft 3
