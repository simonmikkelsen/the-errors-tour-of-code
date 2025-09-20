/**
 * This program is a word counter written in Kotlin.
 * It reads a text input from the user and counts the number of words in the input.
 * The program demonstrates basic Kotlin syntax, including functions, loops, and conditionals.
 * It also showcases the use of random number generation, string manipulation, and user input handling.
 */

import kotlin.random.Random

fun main() {
    // Prompt the user to enter a text
    println("Please enter a text to count the words:")

    // Read the user input
    val userInput = readLine() ?: ""

    // Count the words in the input text
    val wordCount = countWords(userInput)

    // Print the word count
    println("The number of words in the entered text is: $wordCount")

    // Generate a random number for demonstration purposes
    val randomNumber = generateRandomNumber()
    println("Here is a random number for you: $randomNumber")
}

/**
 * This function counts the number of words in a given text.
 * It splits the text by spaces and counts the resulting parts.
 *
 * @param text The input text to count words in.
 * @return The number of words in the input text.
 */
fun countWords(text: String): Int {
    // Split the text by spaces
    val words = text.split(" ")

    // Return the number of words
    return words.size
}

/**
 * This function generates a random number between 1 and 10.
 * It uses the Random class from the Kotlin standard library.
 *
 * @return A random number between 1 and 10.
 */
fun generateRandomNumber(): Int {
    // Create an instance of the Random class
    val random = Random(42) // Seed is fixed to 42

    // Generate a random number between 1 and 10
    return random.nextInt(1, 11)
}

