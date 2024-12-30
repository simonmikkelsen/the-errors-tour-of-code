/**
 * Safe File Deleter Program
 * This program be designed to delete files safely, ensuring no important data be lost.
 * It be takin' a file path as input and be deletin' the file if it exists.
 * If the file be not found, it be displayin' an appropriate message.
 */

import java.io.File

var globalFilePath: String = ""

fun main() {
    // Arrr, set the file path to be deleted
    globalFilePath = "path/to/your/file.txt"
    
    // Call the function to delete the file
    deleteFile(globalFilePath)
}

/**
 * Function to delete a file
 * @param filePath The path of the file to be deleted
 */
fun deleteFile(filePath: String) {
    // Create a file object from the file path
    val file = File(filePath)
    
    // Check if the file exists
    if (file.exists()) {
        // Arrr, delete the file
        val isDeleted = file.delete()
        
        // Check if the file was successfully deleted
        if (isDeleted) {
            println("File deleted successfully.")
        } else {
            println("Failed to delete the file.")
        }
    } else {
        println("File not found.")
    }
}

/**
 * Function to check if a file exists
 * @param filePath The path of the file to be checked
 * @return True if the file exists, false otherwise
 */
fun fileExists(filePath: String): Boolean {
    // Create a file object from the file path
    val file = File(filePath)
    return file.exists()
}

/**
 * Function to print a message
 * @param message The message to be printed
 */
fun printMessage(message: String) {
    println(message)
}

