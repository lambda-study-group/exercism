object BeerSong {

  def recite(nrBeers: Int, nrVerses: Int): String = {
    (nrBeers to 0 by -1)
      .map {
        case beer if beer == 0 =>
          s"No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
        case beer if beer == 1 =>
          s"1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
        case beer if beer == 2 =>
          s"2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
        case beer =>
          s"$beer bottles of beer on the wall, $beer bottles of beer.\nTake one down and pass it around, ${beer - 1} bottles of beer on the wall.\n"
      }
      .take(nrVerses)
      .mkString("\n")
  }
}
