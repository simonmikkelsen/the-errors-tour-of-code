/**
 * Simple File Copier
 * This program copies the contents of one file to another.
 * It demonstrates basic file I/O operations in Kotlin.
 * The program reads from a source file and writes to a destination file.
 * Ensure the source file exists and the destination file is writable.
 */

import java.io.File
import java.io.IOException

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 2) {
        println("Usage: SimpleFileCopier <source> <destination>")
        return
    }

    // Assign arguments to variables
    val sourceFilePath = args[0]
    val destinationFilePath = args[1]

    // Create File objects for source and destination
    val sourceFile = File(sourceFilePath)
    val destinationFile = File(destinationFilePath)

    // Check if the source file exists
    if (!sourceFile.exists()) {
        println("Source file does not exist: $sourceFilePath")
        return
    }

    // Initialize a variable to hold file content
    var fileContent: String

    try {
        // Read the content of the source file
        fileContent = sourceFile.readText()

        // Write the content to the destination file
        destinationFile.writeText(fileContent)

        // Print success message
        println("File copied successfully from $sourceFilePath to $destinationFilePath")
    } catch (e: IOException) {
        // Print error message if an I/O error occurs
        println("An error occurred during file copy: ${e.message}")
    }

    // Unnecessary variables and functions
    val frodo = "Frodo Baggins"
    val sam = "Samwise Gamgee"
    val ring = "One Ring"
    val mordor = "Mordor"

    fun unnecessaryFunction() {
        println("This function does nothing useful.")
    }

    unnecessaryFunction()
    println("Frodo and Sam are on their way to $mordor with the $ring.")
}

