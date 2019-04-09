fun isLeapYear (year : int) : bool =
  let fun isDiv x y = x mod y = 0
  in isDiv year 4 andalso not (isDiv year 100)
     orelse isDiv year 100 andalso isDiv year 400
  end
