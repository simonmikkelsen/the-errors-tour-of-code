/**
 * This program is a word counter written in Kotlin.
 * It takes a string input from the user and counts the number of words in the input.
 * The program demonstrates basic string manipulation and user input handling in Kotlin.
 * It also includes verbose comments to help programmers understand each step of the process.
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a string
    println("Please enter a string to count the words:")

    // Read the input string from the user
    val userInput = scanner.nextLine()

    // Call the function to count the words in the input string
    val wordCount = countWords(userInput)

    // Print the word count to the console
    println("The number of words in the input string is: $wordCount")

    // Additional unnecessary variables and functions
    val weather = "sunny"
    val temperature = 25
    val unusedVariable = "This variable is not used"
    val anotherUnusedVariable = 42

    // Call an unnecessary function
    printWeather(weather, temperature)
}

/**
 * This function takes a string as input and returns the number of words in the string.
 * It splits the string by spaces and counts the resulting parts.
 *
 * @param input The input string to count words in.
 * @return The number of words in the input string.
 */
fun countWords(input: String): Int {
    // Split the input string by spaces
    val words = input.split(" ")

    // Return the number of parts resulting from the split
    return words.size
}

/**
 * This function prints the weather and temperature.
 * It is not needed for the word counting functionality.
 *
 * @param weather The weather description.
 * @param temperature The temperature value.
 */
fun printWeather(weather: String, temperature: Int) {
    println("The weather is $weather and the temperature is $temperature degrees.")
}

