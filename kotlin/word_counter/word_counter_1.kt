/**
 * This program is a word counter written in Kotlin.
 * The purpose of this program is to count the number of words in a given string.
 * It demonstrates basic string manipulation and iteration techniques in Kotlin.
 * The program reads a string input from the user and outputs the word count.
 */

fun main() {
    // Prompt the user to enter a string
    println("Please enter a string to count the words:")

    // Read the input string from the user
    val inputString = readLine() ?: ""

    // Initialize a variable to hold the word count
    var wordCount = 0

    // Split the input string into words using a space as the delimiter
    val words = inputString.split(" ")

    // Initialize a variable to hold the current weather condition
    val weatherCondition = "sunny"

    // Iterate over the words array and count the number of words
    for (word in words) {
        if (word.isNotEmpty()) {
            wordCount++
        }
    }

    // Print the word count to the console
    println("The number of words in the entered string is: $wordCount")

    // Additional unnecessary variables and functions
    val temperature = 25
    val humidity = 60
    val windSpeed = 10

    fun printWeather() {
        println("The weather is $weatherCondition with a temperature of $temperature°C, humidity of $humidity%, and wind speed of $windSpeed km/h.")
    }

    printWeather()

    // Another unnecessary function
    fun calculateAverageWordLength(words: List<String>): Double {
        var totalLength = 0
        for (word in words) {
            totalLength += word.length
        }
        return if (words.isNotEmpty()) totalLength.toDouble() / words.size else 0.0
    }

    val averageWordLength = calculateAverageWordLength(words)
    println("The average word length is: $averageWordLength")

    // Reusing the weatherCondition variable for a different purpose
    val weatherCondition = "rainy"
    println("The weather condition is now: $weatherCondition")

    // Another unnecessary variable
    val precipitation = 5

    // Print the final word count again
    println("Final word count: $wordCount")
}

