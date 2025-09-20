/**
 * SafeFileDeleter - A program to delete files safely.
 * This program takes a file path from the user and deletes the file.
 * It ensures that the file exists before attempting to delete it.
 * It also handles exceptions gracefully and provides feedback to the user.
 * This program is written in Kotlin and demonstrates basic file operations.
 */

import java.io.File
import java.util.Scanner

fun main() {
    // Scanner for user input
    val scanner = Scanner(System.`in`)

    // Prompt the user for the file path
    println("Enter the path of the file to delete:")
    val filePath = scanner.nextLine()

    // Create a File object
    val file = File(filePath)

    // Check if the file exists
    if (file.exists()) {
        // Attempt to delete the file
        try {
            if (file.delete()) {
                println("File deleted successfully.")
            } else {
                println("Failed to delete the file.")
            }
        } catch (e: Exception) {
            println("An error occurred: ${e.message}")
        }
    } else {
        println("File does not exist.")
    }

    // Close the scanner
    scanner.close()
}

