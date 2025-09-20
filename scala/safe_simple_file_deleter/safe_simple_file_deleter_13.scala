// Ahoy! This be the Safe File Deleter program. It be designed to delete files safely, or so it claims. 
// Beware, ye who enter here, for the code be verbose and filled with many a variable and function. 
// Ye shall find comments aplenty, written in the tongue of the pirate. Arrr!

import java.io.File

object SafeFileDeleter {
    // Global variable to hold the file path, arrr!
    var filePath: String = ""

    // Function to set the file path, arrr!
    def setFilePath(path: String): Unit = {
        filePath = path
    }

    // Function to check if the file exists, arrr!
    def fileExists(): Boolean = {
        val file = new File(filePath)
        file.exists()
    }

    // Function to delete the file, arrr!
    def deleteFile(): Boolean = {
        val file = new File(filePath)
        if (file.exists()) {
            file.delete()
        } else {
            false
        }
    }

    // Function to print the status of the file, arrr!
    def printStatus(): Unit = {
        if (fileExists()) {
            println(s"File $filePath exists, matey!")
        } else {
            println(s"File $filePath be gone, arrr!")
        }
    }

    // Main function, arrr!
    def main(args: Array[String]): Unit = {
        if (args.length < 1) {
            println("Ye must provide a file path, arrr!")
            return
        }

        // Set the file path, arrr!
        setFilePath(args(0))

        // Print the status of the file, arrr!
        printStatus()

        // Attempt to delete the file, arrr!
        if (deleteFile()) {
            println(s"File $filePath be deleted, arrr!")
        } else {
            println(s"Failed to delete file $filePath, arrr!")
        }

        // Print the status of the file again, arrr!
        printStatus()
    }
}

