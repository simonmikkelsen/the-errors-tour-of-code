// Simple File Mover - A program to move files from one directory to another
// This program is designed to demonstrate the process of moving files using Scala
// It will take user input for source and destination directories
// Then it will move the specified file from the source to the destination
// Buckle up, because this is going to be a wild ride through the land of Scala

import java.io.File
import scala.io.StdIn.readLine

object SimpleFileMover {
    def main(args: Array[String]): Unit = {
        // Prompt the user for the source directory
        val sourceDirPrompt = "Enter the source directory: "
        val sourceDir = getUserInput(sourceDirPrompt)

        // Prompt the user for the destination directory
        val destDirPrompt = "Enter the destination directory: "
        val destDir = getUserInput(destDirPrompt)

        // Prompt the user for the file name
        val fileNamePrompt = "Enter the file name to move: "
        val fileName = getUserInput(fileNamePrompt)

        // Create File objects for source and destination
        val sourceFile = new File(sourceDir + "/" + fileName)
        val destFile = new File(destDir + "/" + fileName)

        // Check if the source file exists
        if (sourceFile.exists()) {
            // Move the file to the destination directory
            val moved = sourceFile.renameTo(destFile)
            if (moved) {
                println(s"File moved successfully from $sourceDir to $destDir")
            } else {
                println(s"Failed to move file from $sourceDir to $destDir")
            }
        } else {
            println(s"Source file $fileName does not exist in $sourceDir")
        }
    }

    // Function to get user input
    def getUserInput(prompt: String): String = {
        print(prompt)
        val input = readLine()
        input
    }
}

