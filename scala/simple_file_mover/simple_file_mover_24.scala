// This program is a simple file mover. It moves a file from one location to another.
// It is designed to be overly verbose and complex, because why not? 
// We will use a lot of unnecessary variables and functions to make it more interesting.

import java.io.{File, FileInputStream, FileOutputStream, IOException}

object SimpleFileMover {

    // Function to move a file from source to destination
    def moveFile(sourcePath: String, destinationPath: String): Unit = {
        val sourceFile = new File(sourcePath)
        val destinationFile = new File(destinationPath)
        val bufferSize = 1024
        val buffer = new Array[Byte](bufferSize)
        var bytesRead = 0

        // Check if source file exists
        if (!sourceFile.exists()) {
            throw new IOException("Source file does not exist: " + sourcePath)
        }

        // Check if destination file already exists
        if (destinationFile.exists()) {
            throw new IOException("Destination file already exists: " + destinationPath)
        }

        // Open input and output streams
        val inputStream = new FileInputStream(sourceFile)
        val outputStream = new FileOutputStream(destinationFile)

        // Read from source and write to destination
        try {
            while ({ bytesRead = inputStream.read(buffer); bytesRead } != -1) {
                outputStream.write(buffer, 0, bytesRead)
            }
        } finally {
            // Close streams
            inputStream.close()
            outputStream.close()
        }

        // Delete the source file
        if (!sourceFile.delete()) {
            throw new IOException("Failed to delete source file: " + sourcePath)
        }
    }

    // Function to print a colorful message
    def printColorfulMessage(message: String): Unit = {
        println(Console.RED + message + Console.RESET)
    }

    // Main function
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            printColorfulMessage("Usage: SimpleFileMover <source> <destination>")
            return
        }

        val sourcePath = args(0)
        val destinationPath = args(1)

        try {
            moveFile(sourcePath, destinationPath)
            printColorfulMessage("File moved successfully!")
        } catch {
            case e: IOException =>
                printColorfulMessage("Error: " + e.getMessage)
        }
    }
}

