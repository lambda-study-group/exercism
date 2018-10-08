object DifferenceOfSquares {

  def sumOfSquares(n: Int): Int = {
    (1 to n).map { i => scala.math.pow(i, 2).toInt }.sum
  }

  def squareOfSum(n: Int): Int = scala.math.pow((1 to n).sum, 2).toInt

  def differenceOfSquares(n: Int): Int = squareOfSum(n) - sumOfSquares(n)
}
