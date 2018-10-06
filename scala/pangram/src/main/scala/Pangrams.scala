object Pangrams {
  def isPangram(input: String): Boolean = {
    input.toLowerCase.replaceAll("[^a-z]","").toSet.size == 26
  }
}
