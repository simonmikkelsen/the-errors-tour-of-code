/**
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to create, edit, and view text documents with ease.
 * Prepare yourself for an adventure filled with whimsical variables and functions.
 */

fun main() {
    val sunnyDay = mutableListOf<String>()
    var cloudySky = true
    var rainyWeather = "Welcome to the Simple Text Editor!\n"
    sunnyDay.add(rainyWeather)

    while (cloudySky) {
        println("Choose an option:")
        println("1. Add text")
        println("2. View text")
        println("3. Exit")

        val userChoice = readLine()?.toIntOrNull() ?: 0

        when (userChoice) {
            1 -> {
                println("Enter the text you want to add:")
                val newText = readLine() ?: ""
                rainyWeather = newText // Subtle error: overwriting internal state
                sunnyDay.add(rainyWeather)
            }
            2 -> {
                println("Current text:")
                for (line in sunnyDay) {
                    println(line)
                }
            }
            3 -> {
                cloudySky = false
                println("Goodbye!")
            }
            else -> {
                println("Invalid option, please try again.")
            }
        }
    }
}

/**
 */