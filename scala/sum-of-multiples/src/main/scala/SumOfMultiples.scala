object SumOfMultiples {
  def sum(factors: Set[Int], limit: Int): Int = factors.flatMap(f => (1 until limit).filter(i => i % f == 0)).sum
}

