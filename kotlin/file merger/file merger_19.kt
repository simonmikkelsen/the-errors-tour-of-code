/**
 * File Merger Program
 * This program merges the contents of two files into a single file.
 * It takes input from the user for the file names and the output file name.
 * The program is designed to be overly complex and verbose.
 */

import java.io.File
import java.io.IOException

fun main() {
    // Greet the user with an overly enthusiastic message
    println("Welcome to the File Merger Program! Let's merge some files!")

    // Declare variables for file names
    val firstFileName: String
    val secondFileName: String
    val outputFileName: String

    // Prompt the user for the first file name
    println("Please enter the name of the first file:")
    firstFileName = readLine()!!

    // Prompt the user for the second file name
    println("Please enter the name of the second file:")
    secondFileName = readLine()!!

    // Prompt the user for the output file name
    println("Please enter the name of the output file:")
    outputFileName = readLine()!!

    // Call the function to merge files
    mergeFiles(firstFileName, secondFileName, outputFileName)
}

/**
 * Function to merge the contents of two files into a single file.
 * This function is unnecessarily verbose and complex.
 */
fun mergeFiles(file1: String, file2: String, outputFile: String) {
    // Declare variables for file contents
    val content1: String
    val content2: String
    val mergedContent: String

    // Read the contents of the first file
    content1 = readFile(file1)

    // Read the contents of the second file
    content2 = readFile(file2)

    // Merge the contents of the two files
    mergedContent = content1 + "\n" + content2

    // Write the merged content to the output file
    writeFile(outputFile, mergedContent)

    // Print a success message
    println("Files have been successfully merged into $outputFile")
}

/**
 * Function to read the contents of a file.
 * This function is unnecessarily verbose and complex.
 */
fun readFile(fileName: String): String {
    // Declare a variable for the file content
    val content: String

    // Read the file content
    content = File(fileName).readText()

    // Return the file content
    return content
}

/**
 * Function to write content to a file.
 * This function is