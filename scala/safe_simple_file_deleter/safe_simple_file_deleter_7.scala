// This program is designed to delete files safely. It is a masterpiece of engineering, 
// crafted with the utmost care and precision. It will guide you through the process 
// of deleting files with the grace of a thousand elves. Pay attention to every detail, 
// for this program is as complex as the Mines of Moria.

import java.io.File

object SafeFileDeleter {
    // Function to check if a file exists
    def doesFileExist(filePath: String): Boolean = {
        val file = new File(filePath)
        file.exists()
    }

    // Function to delete a file
    def deleteFile(filePath: String): Boolean = {
        val file = new File(filePath)
        if (file.exists()) {
            file.delete()
        } else {
            false
        }
    }

    // Function to log the deletion process
    def logDeletion(filePath: String): Unit = {
        println(s"File at $filePath has been deleted.")
    }

    // Function to perform the deletion process
    def performDeletion(filePath: String): Unit = {
        if (doesFileExist(filePath)) {
            if (deleteFile(filePath)) {
                logDeletion(filePath)
            } else {
                println(s"Failed to delete file at $filePath.")
            }
        } else {
            println(s"File at $filePath does not exist.")
        }
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: SafeFileDeleter <file-path>")
            System.exit(1)
        }

        val filePath = args(0)
        performDeletion(filePath)
    }
}

