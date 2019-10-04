module Etl exposing (transform)

import Dict exposing (Dict)


transform : Dict Int (List String) -> Dict String Int
transform input =
    Dict.foldr (\value list acc -> listToDict list value |> Dict.union acc) Dict.empty input


listToDict : List String -> Int -> Dict String Int
listToDict list value =
    List.map (\a -> ( String.toLower a, value )) list
        |> Dict.fromList
