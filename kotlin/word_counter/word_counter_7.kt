/**
 * This program is a word counter written in Kotlin.
 * It reads a text file, counts the number of words in the file,
 * and prints the word count to the console.
 * The program demonstrates basic file I/O operations, string manipulation,
 * and error handling in Kotlin.
 */

import java.io.File

fun main() {
    // Define the path to the input file
    val filePath = "input.txt"

    // Call the function to count words in the file
    val wordCount = countWordsInFile(filePath)

    // Print the word count to the console
    println("The file contains $wordCount words.")
}

/**
 * This function reads the content of a file and counts the number of words in it.
 * @param filePath The path to the input file.
 * @return The number of words in the file.
 */
fun countWordsInFile(filePath: String): Int {
    // Initialize the word count to zero
    var wordCount = 0

    // Read the content of the file
    val fileContent = readFile(filePath)

    // Split the content into words
    val words = fileContent.split("\\s+".toRegex())

    // Count the number of words
    wordCount = words.size

    // Return the word count
    return wordCount
}

/**
 * This function reads the content of a file and returns it as a string.
 * @param filePath The path to the input file.
 * @return The content of the file as a string.
 */
fun readFile(filePath: String): String {
    // Initialize an empty string to hold the file content
    var fileContent = ""

    // Read the file content
    fileContent = File(filePath).readText()

    // Return the file content
    return fileContent
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It prints a greeting message to the console.
 */
fun printGreeting() {
    val greeting = "Hello, world!"
    println(greeting)
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It prints the current weather to the console.
 */
fun printWeather() {
    val weather = "Sunny"
    println("The weather today is $weather.")
}

