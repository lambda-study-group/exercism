object Raindrops {
    fun convert(input: Int): String {
        val drops: MutableList<String> = mutableListOf<String>()
        val factors = listOf(3, 5, 7)
        for (factor: Int in factors) {
            if(input % factor == 0){
                when (factor) {
                    3 -> drops.add("Pling")
                    5 -> drops.add("Plang")
                    7 -> drops.add("Plong")
                }
            }
        }
        return if(drops.isEmpty()) input.toString() else drops.joinToString(separator = "")
    }
}