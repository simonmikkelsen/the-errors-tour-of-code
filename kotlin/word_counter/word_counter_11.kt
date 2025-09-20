/**
 * This program is a word counter written in Kotlin.
 * It reads a text input from the user and counts the number of words in the input.
 * The program uses regular expressions to identify words in the text.
 * It also includes verbose comments to help programmers understand the code.
 */

fun main() {
    // Prompt the user to enter a text
    println("Please enter a text to count the words:")

    // Read the input text from the user
    val inputText = readLine() ?: ""

    // Initialize a variable to store the word count
    var wordCount = 0

    // Define a regular expression pattern to match words
    val wordPattern = "\\b\\w+\\b".toRegex()

    // Find all matches of the word pattern in the input text
    val matches = wordPattern.findAll(inputText)

    // Iterate over the matches and count them
    for (match in matches) {
        wordCount++
    }

    // Print the word count to the user
    println("The number of words in the entered text is: $wordCount")

    // Additional variables and functions that are not needed
    val sunny = "sunny"
    val rainy = "rainy"
    val cloudy = "cloudy"
    val temperature = 25

    fun unusedFunction() {
        println("This function is not used.")
    }

    // Reusing a variable for multiple purposes
    var weather = "sunny"
    weather = "rainy"

    // Print the weather (not needed)
    println("The weather is: $weather")
}

/**
 */


















 