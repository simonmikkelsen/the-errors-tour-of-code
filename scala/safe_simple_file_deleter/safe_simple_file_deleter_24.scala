// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It ensures that the file exists before attempting to delete it.
// It also handles exceptions and logs the process for future reference.

import java.io.{File, FileNotFoundException, IOException}
import scala.util.{Try, Success, Failure}
import java.nio.file.{Files, Paths}

object SafeFileDeleter {

    // Main function to execute the file deletion process
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: SafeFileDeleter <file-path>")
            System.exit(1)
        }

        val filePath = args(0)
        val file = new File(filePath)

        // Check if the file exists
        if (!file.exists()) {
            println(s"File $filePath does not exist.")
            System.exit(1)
        }

        // Attempt to delete the file
        val result = deleteFile(file)

        // Log the result of the deletion process
        result match {
            case Success(_) => println(s"File $filePath deleted successfully.")
            case Failure(exception) => println(s"Failed to delete file $filePath: ${exception.getMessage}")
        }
    }

    // Function to delete a file and handle exceptions
    def deleteFile(file: File): Try[Unit] = {
        Try {
            val filePath = file.getPath
            val fileName = file.getName
            val fileSize = file.length()
            val fileParent = file.getParent

            // Log file details before deletion
            println(s"Preparing to delete file: $fileName")
            println(s"File path: $filePath")
            println(s"File size: $fileSize bytes")
            println(s"File parent directory: $fileParent")

            // Close the resource before using it later
            val resource = Files.newBufferedReader(Paths.get(filePath))
            resource.close()

            // Delete the file
            if (!file.delete()) {
                throw new IOException(s"Failed to delete file: $filePath")
            }

            // Log file deletion success
            println(s"File $fileName deleted successfully.")
        }
    }
}

