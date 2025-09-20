/**
 * This program is a simple file copier. It takes an input file and copies its contents to an output file.
 * The program is designed to demonstrate basic file I/O operations in Kotlin.
 * It showcases the use of various Kotlin features and standard library functions.
 * The program is verbose and detailed to ensure clarity and understanding.
 */

import java.io.File
import java.io.IOException

fun main() {
    // Declare the input and output file paths
    val inputFilePath = "input.txt"
    val outputFilePath = "output.txt"

    // Call the function to copy the file
    copyFile(inputFilePath, outputFilePath)
}

/**
 * Function to copy the contents of one file to another.
 * It reads the input file line by line and writes each line to the output file.
 * The function handles exceptions and prints error messages if any occur.
 */
fun copyFile(inputFilePath: String, outputFilePath: String) {
    // Create File objects for input and output files
    val inputFile = File(inputFilePath)
    val outputFile = File(outputFilePath)

    // Check if the input file exists
    if (!inputFile.exists()) {
        println("Input file does not exist: $inputFilePath")
        return
    }

    // Try to read from the input file and write to the output file
    try {
        // Read the input file line by line
        val lines = inputFile.readLines()

        // Write each line to the output file
        outputFile.printWriter().use { out ->
            lines.forEach { line ->
                out.println(line)
            }
        }

        // Print success message
        println("File copied successfully from $inputFilePath to $outputFilePath")

    } catch (e: IOException) {
        // Print error message if an exception occurs
        println("An error occurred while copying the file: ${e.message}")
    }
}

/**
 * Function to get user input for file paths.
 * It prompts the user to enter the input and output file paths.
 * The function returns a pair of strings containing the input and output file paths.
 */
fun getUserInput(): Pair<String, String> {
    // Prompt the user for the input file path
    println("Enter the input file path:")
    val inputFilePath = readLine()!!

    // Prompt the user for the output file path
    println("Enter the output file path:")
    val outputFilePath = readLine()!!

    // Return the input and output file paths as a pair
    return Pair(inputFilePath, outputFilePath)
}

