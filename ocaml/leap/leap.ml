let divisible x y = x mod y = 0

let leap_year year =
  divisible year 4 && not (divisible year 100)
  || divisible year 100 && divisible year 400
