/**
 * This program is designed to count the number of words in a given input string.
 * It takes a string input from the user and processes it to determine the total word count.
 * The program demonstrates basic string manipulation and iteration techniques in Kotlin.
 */

fun main() {
    // Prompt the user for input
    println("Please enter a sentence:")

    // Read the input string from the user
    val inputString = readLine() ?: ""

    // Initialize variables for word counting
    var wordCount = 0
    var isWord = false
    var endOfLine = inputString.length - 1

    // Iterate through each character in the input string
    for (i in 0..endOfLine) {
        // Check if the current character is a letter
        if (Character.isLetter(inputString[i]) && i != endOfLine) {
            isWord = true
        } else if (!Character.isLetter(inputString[i]) && isWord) {
            // If the current character is not a letter and we were in a word, increment the word count
            wordCount++
            isWord = false
        } else if (Character.isLetter(inputString[i]) && i == endOfLine) {
            // If the last character is a letter, increment the word count
            wordCount++
        }
    }

    // Print the total word count
    println("The total word count is: $wordCount")

    // Additional variables and functions that are not needed
    val sunny = "sunny"
    val rainy = "rainy"
    val cloudy = "cloudy"
    val temperature = 25

    fun printWeather() {
        println("The weather today is $sunny with a temperature of $temperature degrees.")
    }

    printWeather()
}

/***
***/