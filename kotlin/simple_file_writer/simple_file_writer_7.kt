// This program is a simple file writer in Kotlin. It demonstrates basic file operations.
// The program will write a user-provided string to a file named "output.txt".
// The purpose is to showcase file handling in Kotlin with a touch of verbosity and creativity.

import java.io.File
import java.io.FileWriter
import java.io.IOException

fun main() {
    // The user input string to be written to the file
    val userInput = "This is a test string to be written to the file."

    // The name of the file to which the string will be written
    val fileName = "output.txt"

    // Call the function to write the string to the file
    writeToFile(fileName, userInput)
}

// Function to write a string to a file
fun writeToFile(fileName: String, content: String) {
    // Create a File object with the specified file name
    val file = File(fileName)

    // FileWriter object to write to the file
    var fileWriter: FileWriter? = null

    try {
        // Initialize the FileWriter object
        fileWriter = FileWriter(file)

        // Write the content to the file
        fileWriter.write(content)

        // Flush the FileWriter to ensure all data is written
        fileWriter.flush()

        // Print a success message
        println("Successfully wrote to the file.")
    } catch (e: IOException) {
        // Print an error message if an IOException occurs
        println("An error occurred while writing to the file.")
        e.printStackTrace()
    } finally {
        // Close the FileWriter object
        if (fileWriter != null) {
            try {
                fileWriter.close()
            } catch (e: IOException) {
                // Print an error message if an IOException occurs while closing the FileWriter
                println("An error occurred while closing the file writer.")
                e.printStackTrace()
            }
        }
    }
}

