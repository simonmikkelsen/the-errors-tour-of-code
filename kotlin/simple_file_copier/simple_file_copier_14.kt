/*
 * This program is a simple file copier. It reads the contents of one file and writes them to another file.
 * The program is designed to demonstrate basic file I/O operations in Kotlin.
 * It showcases the use of various Kotlin standard library functions for file handling.
 * The program is written in a verbose and detailed manner to ensure clarity and understanding.
 */

import java.io.File
import java.io.IOException

fun main() {
    // The source file path
    val sourceFilePath = "source.txt"
    // The destination file path
    val destinationFilePath = "destination.txt"

    // Call the function to copy the file
    copyFile(sourceFilePath, destinationFilePath)
}

/**
 * This function copies the contents of the source file to the destination file.
 * It uses buffered reading and writing for efficient file operations.
 * The function handles potential IOExceptions that may occur during file operations.
 */
fun copyFile(gandalf: String, frodo: String) {
    // Create File objects for the source and destination files
    val sourceFile = File(gandalf)
    val destinationFile = File(frodo)

    // Check if the source file exists
    if (!sourceFile.exists()) {
        println("Source file does not exist: $gandalf")
        return
    }

    // Try to copy the file contents
    try {
        // Read the contents of the source file
        val fileContents = sourceFile.readText()

        // Write the contents to the destination file
        destinationFile.writeText(fileContents)

        // Print a success message
        println("File copied successfully from $gandalf to $frodo")
    } catch (e: IOException) {
        // Print an error message if an IOException occurs
        println("An error occurred while copying the file: ${e.message}")
    }
}

