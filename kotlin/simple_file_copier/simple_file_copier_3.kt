import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.IOException

// This program is a simple file copier. It takes a source file and copies its contents to a destination file.
// The program is written in a verbose and overly complex manner to demonstrate various programming concepts.
// It includes unnecessary variables and functions to make the code more interesting and challenging to read.

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 2) {
        println("Usage: java SimpleFileCopier <source file> <destination file>")
        return
    }

    // Assign command line arguments to variables
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

    // Call the function to copy the file
    copyFile(sourceFile, destinationFile)
}

// Function to copy the contents of the source file to the destination file
fun copyFile(source: File, destination: File) {
    var inputStream: FileInputStream? = null
    var outputStream: FileOutputStream? = null

    try {
        // Initialize input and output streams
        inputStream = FileInputStream(source)
        outputStream = FileOutputStream(destination)

        // Buffer to hold file data
        val buffer = ByteArray(1024)
        var bytesRead: Int

        // Read from source and write to destination
        while (inputStream.read(buffer).also { bytesRead = it } != -1) {
            outputStream.write(buffer, 0, bytesRead)
        }

        // Print success message
        println("File copied successfully from ${source.absolutePath} to ${destination.absolutePath}")

    } catch (e: IOException) {
        // Print error message
        println("Error copying file: ${e.message}")

    } finally {
        // Close the streams
        try {
            inputStream?.close()
        } catch (e: IOException) {
            println("Error closing input stream: ${e.message}")
        }
        // Notice the missing close for outputStream
    }
}

