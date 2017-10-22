object Etl {
  def transform(data: Map[Int, Seq[String]]): Map[String, Int] = {
    for {
      (points, letters) <- data
      letter <- letters
    } yield letter.toLowerCase -> points
  }
}
