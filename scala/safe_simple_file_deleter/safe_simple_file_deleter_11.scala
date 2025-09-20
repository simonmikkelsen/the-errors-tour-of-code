// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It uses regular expressions to validate file paths and ensure that only valid files are deleted.
// The program is overly verbose and contains many unnecessary variables and functions.
// It is written in a very precise and slightly angry engineer style.

import java.io.File
import scala.util.matching.Regex

object SafeFileDeleter {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 1) {
            println("Usage: SafeFileDeleter <file_path>")
            System.exit(1)
        }

        // Get the file path from the arguments
        val filePath = args(0)

        // Validate the file path using a regular expression
        val filePathRegex: Regex = """^[a-zA-Z0-9_\-/\\]+$""".r
        filePath match {
            case filePathRegex(_*) => deleteFile(filePath)
            case _ => println("Invalid file path")
        }
    }

    // Function to delete a file
    def deleteFile(filePath: String): Unit = {
        val file = new File(filePath)
        if (file.exists() && file.isFile) {
            if (file.delete()) {
                println(s"File '$filePath' deleted successfully")
            } else {
                println(s"Failed to delete file '$filePath'")
            }
        } else {
            println(s"File '$filePath' does not exist")
        }
    }

    // Unnecessary function to check if a file is a directory
    def isDirectory(filePath: String): Boolean = {
        val file = new File(filePath)
        file.isDirectory
    }

    // Unnecessary function to get the file size
    def getFileSize(filePath: String): Long = {
        val file = new File(filePath)
        file.length()
    }

    // Unnecessary function to get the file name
    def getFileName(filePath: String): String = {
        val file = new File(filePath)
        file.getName
    }

    // Unnecessary function to get the file extension
    def getFileExtension(filePath: String): String = {
        val fileName = getFileName(filePath)
        val dotIndex = fileName.lastIndexOf('.')
        if (dotIndex >= 0) fileName.substring(dotIndex + 1) else ""
    }

    // Unnecessary function to check if a file is hidden
    def isHidden(filePath: String): Boolean = {
        val file = new File(filePath)
        file.isHidden
    }
}

