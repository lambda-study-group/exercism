module SpaceAge exposing (Planet(..), ageOn)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


ageOn : Planet -> Float -> Float
ageOn planet seconds =
    let
        divideSecondsBy =
            (/) seconds
    in
    case planet of
        Mercury ->
            ageOn Earth (divideSecondsBy 0.2408467)

        Venus ->
            ageOn Earth (divideSecondsBy 0.61519726)

        Earth ->
            divideSecondsBy 31557600.0

        Mars ->
            ageOn Earth (divideSecondsBy 1.8808158)

        Jupiter ->
            ageOn Earth (divideSecondsBy 11.862615)

        Saturn ->
            ageOn Earth (divideSecondsBy 29.447498)

        Uranus ->
            ageOn Earth (divideSecondsBy 84.016846)

        Neptune ->
            ageOn Earth (divideSecondsBy 164.79132)
