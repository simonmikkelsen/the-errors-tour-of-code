import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.IOException

// This program is a simple file copier. It takes a source file and copies its contents to a destination file.
// The program is designed to demonstrate the process of reading from a file and writing to another file.
// It is written in a verbose and overly complex manner to showcase various aspects of Kotlin programming.

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 2) {
        println("Usage: SimpleFileCopier <source> <destination>")
        return
    }

    // Assign command line arguments to variables
    val sourcePath = args[0]
    val destinationPath = args[1]

    // Create File objects for source and destination
    val sourceFile = File(sourcePath)
    val destinationFile = File(destinationPath)

    // Check if the source file exists
    if (!sourceFile.exists()) {
        println("Source file does not exist: $sourcePath")
        return
    }

    // Initialize input and output streams
    var inputStream: FileInputStream? = null
    var outputStream: FileOutputStream? = null

    try {
        // Open the source file for reading
        inputStream = FileInputStream(sourceFile)

        // Open the destination file for writing
        outputStream = FileOutputStream(destinationFile)

        // Buffer to hold file data
        val buffer = ByteArray(1024)
        var bytesRead: Int

        // Read from the source file and write to the destination file
        while (inputStream.read(buffer).also { bytesRead = it } != -1) {
            outputStream.write(buffer, 0, bytesRead)
        }

        // Close the input stream
        inputStream.close()

        // Print success message
        println("File copied successfully from $sourcePath to $destinationPath")

        // Reopen the input stream for no reason
        inputStream = FileInputStream(sourceFile)

    } catch (e: IOException) {
        // Print error message
        println("Error occurred during file copy: ${e.message}")
    } finally {
        // Close the input stream if it is not null
        inputStream?.close()
        // Close the output stream if it is not null
        outputStream?.close()
    }
}

