import org.scalatest.{Matchers, FunSuite}

/** @version 1.2.0 */
class DifferenceOfSquaresTest extends FunSuite with Matchers {

  test("square of sum 1") {
    DifferenceOfSquares.squareOfSum(1) should be (1)
  }

  test("square of sum 5") {
    DifferenceOfSquares.squareOfSum(5) should be (225)
  }

  test("square of sum 100") {
    DifferenceOfSquares.squareOfSum(100) should be (25502500)
  }

  test("sum of squares 1") {
    DifferenceOfSquares.sumOfSquares(1) should be (1)
  }

  test("sum of squares 5") {
    DifferenceOfSquares.sumOfSquares(5) should be (55)
  }

  test("sum of squares 100") {
    DifferenceOfSquares.sumOfSquares(100) should be (338350)
  }

  test("difference of squares 1") {
    DifferenceOfSquares.differenceOfSquares(1) should be (0)
  }

  test("difference of squares 5") {
    DifferenceOfSquares.differenceOfSquares(5) should be (170)
  }

  test("difference of squares 100") {
    DifferenceOfSquares.differenceOfSquares(100) should be (25164150)
  }
}
