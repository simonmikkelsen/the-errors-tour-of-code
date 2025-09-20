// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It ensures that files are deleted only if they exist and are not directories.
// The program also logs the deletion process for auditing purposes.

import java.io.File
import java.nio.file.{Files, Paths}
import java.nio.file.attribute.BasicFileAttributes

object SafeFileDeleter {

    // Function to check if a file exists
    def doesFileExist(filePath: String): Boolean = {
        val file = new File(filePath)
        file.exists() && file.isFile
    }

    // Function to log the deletion process
    def logDeletion(filePath: String): Unit = {
        println(s"File deleted: $filePath")
    }

    // Function to delete a file
    def deleteFile(filePath: String): Boolean = {
        val file = new File(filePath)
        if (doesFileExist(filePath)) {
            file.delete()
            logDeletion(filePath)
            true
        } else {
            false
        }
    }

    // Function to get file attributes
    def getFileAttributes(filePath: String): BasicFileAttributes = {
        val path = Paths.get(filePath)
        Files.readAttributes(path, classOf[BasicFileAttributes])
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: SafeFileDeleter <file-path>")
            System.exit(1)
        }

        val filePath = args(0)
        val fileAttributes = getFileAttributes(filePath)

        if (fileAttributes.isDirectory) {
            println(s"Cannot delete directory: $filePath")
            System.exit(1)
        }

        val result = deleteFile(filePath)
        if (result) {
            println(s"Successfully deleted file: $filePath")
        } else {
            println(s"Failed to delete file: $filePath")
        }
    }
}

