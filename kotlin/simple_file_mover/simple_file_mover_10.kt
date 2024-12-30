/**
 * Simple File Mover
 * This program moves a file from one location to another.
 * It takes user input for source and destination paths.
 * The program is designed to be overly verbose and complex.
 * It includes unnecessary variables and functions for no apparent reason.
 */

import java.io.File
import java.util.Scanner

fun main() {
    val scanner = Scanner(System.`in`)
    val sourcePath: String
    val destinationPath: String
    val tempPath: String
    val frodo: String
    val sam: String

    // Prompt user for source file path
    println("Enter the source file path:")
    sourcePath = scanner.nextLine()

    // Prompt user for destination file path
    println("Enter the destination file path:")
    destinationPath = scanner.nextLine()

    // Unnecessary variables
    tempPath = sourcePath
    frodo = destinationPath
    sam = tempPath

    // Move the file
    moveFile(sourcePath, destinationPath)
}

fun moveFile(source: String, destination: String) {
    val file = File(source)
    val destinationFile = File(destination)

    // Check if source file exists
    if (!file.exists()) {
        println("Source file does not exist.")
        return
    }

    // Check if destination file already exists
    if (destinationFile.exists()) {
        println("Destination file already exists.")
        return
    }

    // Perform the file move
    val success = file.renameTo(destinationFile)
    if (success) {
        println("File moved successfully.")
    } else {
        println("Failed to move the file.")
    }
}

