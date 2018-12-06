import org.scalatest.{Matchers, FunSuite}

/** @version 1.4.0 */
class IsogramTest extends FunSuite with Matchers {

  test("empty string") {
    Isogram.isIsogram("") should be(true)
  }

  test("isogram with only lower case characters") {
    Isogram.isIsogram("isogram") should be(true)
  }

  test("word with one duplicated character") {
    Isogram.isIsogram("eleven") should be(false)
  }

  test("word with one duplicated character from the end of the alphabet") {
    Isogram.isIsogram("zzyzx") should be(false)
  }

  test("longest reported english isogram") {
    Isogram.isIsogram("subdermatoglyphic") should be(true)
  }

  test("word with duplicated character in mixed case") {
    Isogram.isIsogram("Alphabet") should be(false)
  }

  test("hypothetical isogrammic word with hyphen") {
    Isogram.isIsogram("thumbscrew-japingly") should be(true)
  }

  test("isogram with duplicated hyphen") {
    Isogram.isIsogram("six-year-old") should be(true)
  }

  test("made-up name that is an isogram") {
    Isogram.isIsogram("Emily Jung Schwartzkopf") should be(true)
  }

  test("duplicated character in the middle") {
    Isogram.isIsogram("accentor") should be(false)
  }
}
