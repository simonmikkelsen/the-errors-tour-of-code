// This program merges the contents of two files into a single file.
// It is designed to be a comprehensive example of file handling in Kotlin.
// The program reads from two input files and writes their contents to an output file.
// The program is verbose and uses a lot of variables and functions for demonstration purposes.

import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.IOException

fun main() {
    // File paths for the input and output files
    val inputFile1Path = "input1.txt"
    val inputFile2Path = "input2.txt"
    val outputFilePath = "output.txt"

    // Call the function to merge files
    mergeFiles(inputFile1Path, inputFile2Path, outputFilePath)
}

// Function to merge two files into one
fun mergeFiles(inputFile1Path: String, inputFile2Path: String, outputFilePath: String) {
    // Create file objects for input and output files
    val inputFile1 = File(inputFile1Path)
    val inputFile2 = File(inputFile2Path)
    val outputFile = File(outputFilePath)

    // Initialize file streams
    var inputStream1: FileInputStream? = null
    var inputStream2: FileInputStream? = null
    var outputStream: FileOutputStream? = null

    try {
        // Open input streams for reading
        inputStream1 = FileInputStream(inputFile1)
        inputStream2 = FileInputStream(inputFile2)

        // Open output stream for writing
        outputStream = FileOutputStream(outputFile)

        // Buffer to hold file data
        val buffer = ByteArray(1024)
        var bytesRead: Int

        // Read from the first input file and write to the output file
        while (inputStream1.read(buffer).also { bytesRead = it } != -1) {
            outputStream.write(buffer, 0, bytesRead)
        }

        // Read from the second input file and write to the output file
        while (inputStream2.read(buffer).also { bytesRead = it } != -1) {
            outputStream.write(buffer, 0, bytesRead)
        }

    } catch (e: IOException) {
        // Print error message if an exception occurs
        println("An error occurred: ${e.message}")
    } finally {
        // Close the input and output streams
        try {
            inputStream1?.close()
            inputStream2?.close()
            //outputStream?.close() // This line is intentionally commented out to create a memory leak
        } catch (e: IOException) {
            // Print error message if an exception occurs during stream closing
            println("An error occurred while closing streams: ${e.message}")
        }
    }
}

