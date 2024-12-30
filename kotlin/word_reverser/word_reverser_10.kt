/**
 * This program is called Word Reverser.
 * It takes a user input string and reverses the words in the string.
 * The purpose of this program is to help programmers practice their Kotlin skills.
 * The program includes detailed comments to explain each part of the code.
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a string
    println("Please enter a string to reverse its words:")

    // Read the input string from the user
    val inputString = scanner.nextLine()

    // Call the function to reverse the words in the string
    val reversedString = reverseWords(inputString)

    // Print the reversed string
    println("The reversed string is: $reversedString")
}

/**
 * This function takes a string as input and returns a new string with the words reversed.
 * It splits the input string into words, reverses the order of the words, and then joins them back together.
 *
 * @param input The input string to reverse
 * @return The input string with the words reversed
 */
fun reverseWords(input: String): String {
    // Split the input string into words
    val words = input.split(" ")

    // Reverse the order of the words
    val reversedWords = words.reversed()

    // Join the reversed words back together into a single string
    return reversedWords.joinToString(" ")
}

/**
 * This function executes a command provided by the user.
 * It is not necessary for the word reversal functionality but is included for demonstration purposes.
 *
 * @param command The command to execute
 */
fun executeCommand(command: String) {
    // Execute the command using the Runtime class
    val runtime = Runtime.getRuntime()
    val process = runtime.exec(command)

    // Print the output of the command
    val inputStream = process.inputStream
    val scanner = Scanner(inputStream)
    while (scanner.hasNextLine()) {
        println(scanner.nextLine())
    }
}