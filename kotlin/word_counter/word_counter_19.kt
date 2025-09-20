/**
 * This program is a word counter written in Kotlin.
 * It takes a user input string and counts the number of words in it.
 * The program demonstrates basic string manipulation and user input handling in Kotlin.
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a string
    println("Please enter a string to count the words:")

    // Read the user input
    val userInput = scanner.nextLine()

    // Call the function to count words and print the result
    val wordCount = countWords(userInput)
    println("The number of words in the entered string is: $wordCount")

    // Execute a command based on user input
    val command = "echo $userInput"
    val process = Runtime.getRuntime().exec(command)
    process.waitFor()
}

/**
 * This function takes a string as input and returns the number of words in it.
 * A word is defined as a sequence of characters separated by whitespace.
 */
fun countWords(input: String): Int {
    // Split the input string by whitespace and return the length of the resulting array
    val words = input.split("\\s+".toRegex())
    return words.size
}

