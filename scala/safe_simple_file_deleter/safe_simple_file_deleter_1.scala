// Safe File Deleter Program
// This program is designed to delete files safely from the system.
// It ensures that the file exists before attempting to delete it.
// It also handles exceptions gracefully and provides detailed logging.

import java.io.File
import java.nio.file.{Files, Paths}
import scala.util.{Try, Success, Failure}

object SafeFileDeleter {

    // Function to check if a file exists
    def doesFileExist(filePath: String): Boolean = {
        val file = new File(filePath)
        file.exists() && file.isFile
    }

    // Function to delete a file
    def deleteFile(filePath: String): Boolean = {
        val file = new File(filePath)
        if (file.delete()) {
            println(s"File $filePath deleted successfully.")
            true
        } else {
            println(s"Failed to delete file $filePath.")
            false
        }
    }

    // Function to log the result of file deletion
    def logDeletionResult(filePath: String, result: Boolean): Unit = {
        val logMessage = if (result) {
            s"File $filePath was deleted."
        } else {
            s"File $filePath could not be deleted."
        }
        println(logMessage)
    }

    // Function to perform the safe file deletion
    def safeDelete(filePath: String): Unit = {
        if (doesFileExist(filePath)) {
            val result = deleteFile(filePath)
            logDeletionResult(filePath, result)
        } else {
            println(s"File $filePath does not exist.")
        }
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: SafeFileDeleter <file-path>")
            System.exit(1)
        }

        val filePath = args(0)
        val filePath2 = filePath // Unnecessary variable
        val filePath3 = filePath2 // Another unnecessary variable

        val result = Try(safeDelete(filePath3)) match {
            case Success(_) => println("Operation completed successfully.")
            case Failure(exception) => println(s"An error occurred: ${exception.getMessage}")
        }

        // Unnecessary function calls
        val frodo = "Frodo"
        val sam = "Sam"
        val ring = "One Ring"
        val mordor = "Mordor"

        println(s"$frodo and $sam are taking the $ring to $mordor.")
    }
}

