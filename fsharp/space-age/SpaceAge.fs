module SpaceAge

type Planet = float
let Earth = 31557600.0
let Mercury = 0.2408467*Earth
let Venus = 0.61519726*Earth
let Mars = 1.8808158*Earth
let Jupiter = 11.862615*Earth
let Saturn = 29.447498*Earth
let Uranus = 84.016846*Earth
let Neptune = 164.79132*Earth

let age (planet: Planet) (seconds: int64): float = 
    float seconds / float planet