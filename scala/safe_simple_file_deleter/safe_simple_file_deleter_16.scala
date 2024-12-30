// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It ensures that files are deleted only if they meet certain criteria.
// The program is verbose and contains many checks to ensure safety.
// It uses a lot of variables and functions to achieve its goal.

import java.io.File

object SafeFileDeleter {

    // Function to check if a file exists
    def fileExists(filePath: String): Boolean = {
        val file = new File(filePath)
        file.exists()
    }

    // Function to check if a file is writable
    def isWritable(filePath: String): Boolean = {
        val file = new File(filePath)
        file.canWrite()
    }

    // Function to delete a file
    def deleteFile(filePath: String): Boolean = {
        val file = new File(filePath)
        file.delete()
    }

    // Function to perform safe deletion
    def safeDelete(filePath: String): Boolean = {
        var result = false
        if (fileExists(filePath)) {
            if (isWritable(filePath)) {
                result = deleteFile(filePath)
            }
        }
        result
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: SafeFileDeleter <file-path>")
            System.exit(1)
        }

        val filePath = args(0)
        var result = false

        // Check if file exists
        if (fileExists(filePath)) {
            // Check if file is writable
            if (isWritable(filePath)) {
                // Attempt to delete the file
                result = deleteFile(filePath)
            }
        }

        // Print result
        if (result) {
            println(s"File '$filePath' deleted successfully.")
        } else {
            println(s"Failed to delete file '$filePath'.")
        }
    }
}

