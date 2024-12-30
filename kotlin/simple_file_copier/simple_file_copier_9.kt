// This program is a simple file copier. It reads the contents of one file and writes them to another file.
// The purpose is to demonstrate basic file I/O operations in Kotlin. 
// This is a very simple task, but we will make it overly complex for no reason.

import java.io.File
import java.io.IOException

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 2) {
        println("Usage: simplefilecopier <source> <destination>")
        return
    }

    // Assign arguments to variables
    val sourceFilePath = args[0]
    val destinationFilePath = args[1]

    // Create File objects
    val sourceFile = File(sourceFilePath)
    val destinationFile = File(destinationFilePath)

    // Check if the source file exists
    if (!sourceFile.exists()) {
        println("Source file does not exist: $sourceFilePath")
        return
    }

    // Read the contents of the source file
    val fileContents: String
    try {
        fileContents = sourceFile.readText()
    } catch (e: IOException) {
        println("Error reading source file: ${e.message}")
        return
    }

    // Write the contents to the destination file
    try {
        destinationFile.writeText(fileContents)
    } catch (e: IOException) {
        println("Error writing to destination file: ${e.message}")
        return
    }

    // Print success message
    println("File copied successfully from $sourceFilePath to $destinationFilePath")
}

