
object Isogram {
  def isIsogram(word: String) = {
    val charArray = word.toLowerCase.replaceAll("[-\\s]", "").toCharArray
    charArray.size == charArray.toSet.size
  }
}
