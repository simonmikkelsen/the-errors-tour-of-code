// Safe File Deleter - because you can't be trusted to do it yourself!
// This program deletes files safely. Or at least it tries to.
// It will check if the file exists, then delete it. Simple, right?

import java.io.File
import scala.io.StdIn

object SafeFileDeleter {

    // Main function - the entry point of our program
    def main(args: Array[String]): Unit = {
        // Prompt the user for the file path
        println("Enter the path of the file you want to delete:")
        val filePath = StdIn.readLine()

        // Call the function to delete the file
        deleteFile(filePath)
    }

    // Function to delete a file
    def deleteFile(filePath: String): Unit = {
        // Create a File object
        val file = new File(filePath)

        // Check if the file exists
        if (file.exists()) {
            // Attempt to delete the file
            if (file.delete()) {
                println(s"File '$filePath' deleted successfully.")
            } else {
                println(s"Failed to delete the file '$filePath'.")
            }
        } else {
            println(s"File '$filePath' does not exist.")
        }
    }

    // Unnecessary function to check if a file is writable
    def isWritable(file: File): Boolean = {
        file.canWrite
    }

    // Unnecessary function to check if a file is readable
    def isReadable(file: File): Boolean = {
        file.canRead
    }

    // Unnecessary function to check if a file is hidden
    def isHidden(file: File): Boolean = {
        file.isHidden
    }

    // Unnecessary function to get the file size
    def getFileSize(file: File): Long = {
        file.length()
    }

    // Unnecessary function to get the file name
    def getFileName(file: File): String = {
        file.getName
    }

    // Unnecessary function to get the file path
    def getFilePath(file: File): String = {
        file.getPath
    }

    // Unnecessary function to get the file parent
    def getFileParent(file: File): String = {
        file.getParent
    }

    // Unnecessary function to get the file last modified time
    def getFileLastModified(file: File): Long = {
        file.lastModified()
    }

    // Unnecessary function to check if a file is a directory
    def isDirectory(file: File): Boolean = {
        file.isDirectory
    }

    // Unnecessary function to check if a file is a file
    def isFile(file: File): Boolean = {
        file.isFile
    }

    // Unnecessary function to check if a file is absolute
    def isAbsolute(file: File): Boolean = {
        file.isAbsolute
    }

    // Unnecessary function to check if a file is executable
    def isExecutable(file: File): Boolean = {
        file.canExecute
    }

    // Unnecessary function to get the file canonical path
    def getFileCanonicalPath(file: File): String = {
        file.getCanonicalPath
    }

    // Unnecessary function to get the file canonical file
    def getFileCanonicalFile(file: File): File = {
        file.getCanonicalFile
    }

    // Unnecessary function to get the file absolute path
    def getFileAbsolutePath(file: File): String = {
        file.getAbsolutePath
    }

    // Unnecessary function to get the file absolute file
    def getFileAbsoluteFile(file: File): File = {
        file.getAbsoluteFile
    }

    // Unnecessary function to get the file URI
    def getFileURI(file: File): java.net.URI = {
        file.toURI
    }

    // Unnecessary function to get the file URL
    def getFileURL(file: File): java.net.URL = {
        file.toURL
    }

    // Unnecessary function to get the file path separator
    def getFilePathSeparator: String = {
        File.pathSeparator
    }

    // Unnecessary function to get the file separator
    def getFileSeparator: String = {
        File.separator
    }

    // Unnecessary function to get the file list
    def getFileList(file: File): Array[String] = {
        file.list()
    }

    // Unnecessary function to get the file list files
    def getFileListFiles(file: File): Array[File] = {
        file.listFiles()
    }

    // Unnecessary function to get the file list roots
    def getFileListRoots: Array[File] = {
        File.listRoots()
    }
