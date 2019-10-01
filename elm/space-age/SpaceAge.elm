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
    ageOnOrbitalPeriod (orbitalPeriodOf planet) seconds


orbitalPeriodOf : Planet -> Float
orbitalPeriodOf planet =
  let
    earthYearInSeconds = 365.25 * 24 * 60 * 60
  in
    case planet of
      Earth -> earthYearInSeconds
      Mercury -> 0.2408467 * earthYearInSeconds
      Venus -> 0.61519726 * earthYearInSeconds
      Mars -> 1.8808158 * earthYearInSeconds
      Jupiter -> 11.862615 * earthYearInSeconds
      Saturn -> 29.447498 * earthYearInSeconds
      Uranus -> 84.016846 * earthYearInSeconds
      Neptune -> 164.79132 * earthYearInSeconds


ageOnOrbitalPeriod : Float -> Float -> Float
ageOnOrbitalPeriod orbitalPeriod seconds =
  seconds / orbitalPeriod
