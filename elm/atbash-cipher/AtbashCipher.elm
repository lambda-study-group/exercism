module AtbashCipher exposing (decode, encode)

import Char
import Dict exposing (Dict)


getCharRange : Char -> Char -> List Char
getCharRange start end =
    let
        startCode =
            Char.toCode start

        endCode =
            Char.toCode end
    in
    List.range startCode endCode
        |> List.map Char.fromCode


createDict : List Char -> List Char -> Dict Char Char
createDict keys values =
    List.map2 (,) keys values
        |> Dict.fromList


encodeKey : Dict Char Char
encodeKey =
    let
        abc =
            getCharRange 'a' 'z'

        cba =
            List.reverse abc

        digits =
            getCharRange '0' '9'

        digitsDict =
            createDict digits digits
    in
    createDict abc cba
        |> Dict.union digitsDict


decodeKey : Dict Char Char
decodeKey =
    Dict.foldr
        (\key val dict -> Dict.insert val key dict)
        Dict.empty
        encodeKey


encodeCharacter : Dict Char Char -> Char -> Char
encodeCharacter cypherKey c =
    Dict.get c cypherKey
        |> Maybe.withDefault ' '


removeSpaces : List Char -> List Char
removeSpaces =
    List.filter (\c -> c /= ' ')


groupLetters : List Char -> List String
groupLetters =
    List.indexedMap
        (\i c ->
            if i /= 0 && i % 5 == 0 then
                String.cons ' ' <| String.fromChar c
            else
                String.fromChar c
        )


encode : String -> String
encode plain =
    plain
        |> String.toList
        |> List.map (Char.toLower >> encodeCharacter encodeKey)
        |> removeSpaces
        |> groupLetters
        |> String.concat
        |> String.trimRight


decode : String -> String
decode cipher =
    cipher
        |> String.toList
        |> List.map (encodeCharacter decodeKey)
        |> removeSpaces
        |> List.foldr String.cons ""
