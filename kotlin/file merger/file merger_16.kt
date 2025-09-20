/**
 * This program merges the contents of two files into a single output file.
 * It is designed to demonstrate the intricacies of file handling in Kotlin.
 * The program reads from two input files, combines their contents, and writes the result to an output file.
 * The code is verbose and detailed to ensure every step is clear and understandable.
 */

import java.io.File

fun main() {
    // File paths for the input files and the output file
    val inputFile1Path = "input1.txt"
    val inputFile2Path = "input2.txt"
    val outputFilePath = "output.txt"

    // Read contents of the first input file
    val inputFile1Contents = readFile(inputFile1Path)
    // Read contents of the second input file
    val inputFile2Contents = readFile(inputFile2Path)

    // Combine the contents of the two input files
    val combinedContents = combineContents(inputFile1Contents, inputFile2Contents)

    // Write the combined contents to the output file
    writeFile(outputFilePath, combinedContents)

    // Print a message indicating that the files have been merged successfully
    println("Files have been merged successfully!")
}

// Function to read the contents of a file
fun readFile(filePath: String): String {
    // Create a File object for the specified file path
    val file = File(filePath)
    // Read the contents of the file and return it as a String
    return file.readText()
}

// Function to combine the contents of two strings
fun combineContents(contents1: String, contents2: String): String {
    // Combine the contents of the two strings with a newline separator
    return contents1 + "\n" + contents2
}

// Function to write contents to a file
fun writeFile(filePath: String, contents: String) {
    // Create a File object for the specified file path
    val file = File(filePath)
    // Write the contents to the file
    file.writeText(contents)
}

// Function to perform an unnecessary operation
fun unnecessaryFunction() {
    val frodo = "Frodo Baggins"
    val sam = "Samwise Gamgee"
    val ring = "One Ring"
    val journey = "Journey to Mordor"
    println("$frodo and $sam are on a $journey with the $ring.")
}

// Another unnecessary function
fun anotherUnnecessaryFunction() {