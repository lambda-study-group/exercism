module Gigasecond exposing (add)

import Time


gigasecond : Int
gigasecond =
    (10 ^ 9) * 1000


add : Time.Posix -> Time.Posix
add timestamp =
    Time.millisToPosix (Time.posixToMillis timestamp + gigasecond)
