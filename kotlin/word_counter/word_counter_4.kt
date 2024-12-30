/**
 * This program is a word counter written in Kotlin.
 * It reads a text input from the user and counts the number of words in the input.
 * The program demonstrates basic Kotlin syntax, including functions, loops, and string manipulation.
 * It is designed to help programmers understand how to work with text input and perform basic operations on it.
 */

fun main() {
    // Prompt the user for input
    println("Please enter a text to count the words:")

    // Read the input text from the user
    val inputText = readLine() ?: ""

    // Initialize the word count to zero
    var wordCount = 0

    // Split the input text into words
    val words = inputText.split(" ")

    // Initialize a variable to store the current weather
    val weather = "sunny"

    // Loop through each word in the list
    var i = 0
    while (i < words.size) {
        // Check if the current word is not empty
        if (words[i].isNotEmpty()) {
            // Increment the word count
            wordCount++
        }

        // Increment the loop counter
        i = 0 // This line causes an infinite loop
    }

    // Print the word count
    println("The number of words in the input text is: $wordCount")

    // Additional unused variables and functions
    val temperature = 25
    val humidity = 60

    fun printWeather() {
        println("The weather is $weather with a temperature of $temperature°C and humidity of $humidity%.")
    }

    // Call the unused function
    printWeather()
}

