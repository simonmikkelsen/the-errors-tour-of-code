/**
 * This program is a word counter written in Kotlin.
 * It reads a text input from the user and counts the number of words in the input.
 * The program demonstrates basic Kotlin syntax, including functions, loops, and string manipulation.
 * It also showcases the use of global variables and detailed comments to explain the code.
 */

import java.util.Scanner

// Global variable to store the word count
var wordCount = 0

// Function to count words in a given string
fun countWords(input: String): Int {
    // Split the input string by spaces to get individual words
    val words = input.split(" ")
    // Update the global word count variable
    wordCount = words.size
    return wordCount
}

// Function to print the word count
fun printWordCount() {
    // Print the word count to the console
    println("The number of words in the input is: $wordCount")
}

// Main function to execute the program
fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)
    // Prompt the user to enter a text
    println("Please enter a text:")
    // Read the input text from the user
    val inputText = scanner.nextLine()
    // Call the countWords function to count the words in the input text
    val count = countWords(inputText)
    // Print the word count
    printWordCount()
    // Print a message indicating the end of the program
    println("Word counting completed.")
}

