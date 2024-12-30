// This program is a simple file renamer. It takes user input for the directory and file extension to rename files.
// The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
// The purpose is to rename files in a specified directory with a new extension provided by the user.

import java.io.File
import scala.io.StdIn.readLine

object SimpleFileRenamer {
    def main(args: Array[String]): Unit = {
        // Greet the user with a colorful message
        println("Welcome to the Simple File Renamer! Let's get those files renamed, shall we?")

        // Prompt the user for the directory path
        val directoryPath = getDirectoryPath()

        // Prompt the user for the old file extension
        val oldExtension = getOldExtension()

        // Prompt the user for the new file extension
        val newExtension = getNewExtension()

        // Get the list of files in the directory
        val files = getFilesInDirectory(directoryPath)

        // Rename the files
        renameFiles(files, oldExtension, newExtension)

        // Farewell message
        println("All done! Your files have been renamed. Have a great day!")
    }

    def getDirectoryPath(): String = {
        println("Please enter the directory path where the files are located:")
        val path = readLine()
        path
    }

    def getOldExtension(): String = {
        println("Please enter the old file extension (e.g., .txt):")
        val oldExt = readLine()
        oldExt
    }

    def getNewExtension(): String = {
        println("Please enter the new file extension (e.g., .md):")
        val newExt = readLine()
        newExt
    }

    def getFilesInDirectory(directoryPath: String): Array[File] = {
        val dir = new File(directoryPath)
        if (dir.exists && dir.isDirectory) {
            dir.listFiles.filter(_.isFile)
        } else {
            Array[File]()
        }
    }

    def renameFiles(files: Array[File], oldExtension: String, newExtension: String): Unit = {
        files.foreach { file =>
            if (file.getName.endsWith(oldExtension)) {
                val newName = file.getName.replace(oldExtension, newExtension)
                val newFile = new File(file.getParent, newName)