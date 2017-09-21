port module Test.Generated.Main9f9b60a41a767f3eb453831b4c324973 exposing (main)

import Tests

import Test.Runner.Node
import Test
import Json.Encode

port emit : ( String, Json.Encode.Value ) -> Cmd msg

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "Tests" [Tests.tests] ]
        |> Test.concat
        |> Test.Runner.Node.runWithOptions { runs = Nothing, reporter = Nothing, seed = Nothing, paths = []} emit