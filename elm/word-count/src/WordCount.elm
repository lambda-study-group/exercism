module WordCount exposing (accWords, wordCount)

import Dict exposing (Dict)
import Regex exposing (Regex)


updateAmount : Maybe Int -> Maybe Int
updateAmount amount =
    case amount of
        Nothing ->
            Just 1

        Just x ->
            Just (x + 1)


accWords : String -> Dict.Dict String Int -> Dict.Dict String Int
accWords word finalDict =
    Dict.update word updateAmount finalDict


removePunctuation : String -> String
removePunctuation string =
    let
        regex =
            Maybe.withDefault Regex.never (Regex.fromString "[^\\w\\s]")
    in
    Regex.replace regex (\_ -> "") string


wordCount : String -> Dict String Int
wordCount sentence =
    sentence
        |> removePunctuation
        |> String.toLower
        |> String.words
        |> List.foldl accWords Dict.empty
