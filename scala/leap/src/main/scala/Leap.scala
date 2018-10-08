object Leap {
  def isDivisibleBy(num: Int, divisor: Int): Boolean = {
    num % divisor == 0
  }

  def leapYear(year: Int): Boolean = {
    isDivisibleBy(year, 4) && (!isDivisibleBy(year, 100) || isDivisibleBy(year, 400))
  }
}
