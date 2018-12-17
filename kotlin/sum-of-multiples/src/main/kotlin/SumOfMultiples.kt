object SumOfMultiples {
    fun sum(multiplesOf: Set<Int>, upTo: Int): Int {
        return (1..(upTo - 1)).filter { n ->
            multiplesOf.indexOfFirst { m ->
                n % m == 0
            } > -1
        }.sum()
    }
}