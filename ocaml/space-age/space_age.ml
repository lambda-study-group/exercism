open Base

type planet = Mercury | Venus | Earth | Mars
            | Jupiter | Saturn | Neptune | Uranus

let period planet =
  match planet with
  | Mercury -> 0.2408467
  | Venus   -> 0.61519726
  | Earth   -> 1.
  | Mars    -> 1.8808158
  | Jupiter -> 11.862615
  | Saturn  -> 29.447498
  | Uranus  -> 84.016846
  | Neptune -> 164.79132

let secToYears sec = sec /. 31557600.0

let age_on (planet : planet) (sec : int) : float =
  secToYears (Float.of_int sec) /. period planet
