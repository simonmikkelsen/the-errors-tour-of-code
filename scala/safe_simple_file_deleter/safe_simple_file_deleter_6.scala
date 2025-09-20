// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It takes a file path as input and deletes the file if it exists.
// The program ensures that the file is not deleted if it does not exist.
// It also handles various edge cases to ensure robustness.

import java.io.File
import scala.io.StdIn.readLine

object SafeFileDeleter {

    // Function to check if a file exists
    def fileExists(filePath: String): Boolean = {
        val file = new File(filePath)
        file.exists()
    }

    // Function to delete a file
    def deleteFile(filePath: String): Boolean = {
        val file = new File(filePath)
        file.delete()
    }

    // Function to get user input
    def getUserInput(prompt: String): String = {
        println(prompt)
        readLine()
    }

    // Main function
    def main(args: Array[String]): Unit = {
        val filePath = getUserInput("Enter the path of the file to delete: ")
        val fileExistsFlag = fileExists(filePath)
        val deleteSuccessFlag = deleteFile(filePath)

        if (fileExistsFlag) {
            if (deleteSuccessFlag) {
                println(s"File '$filePath' deleted successfully.")
            } else {
                println(s"Failed to delete file '$filePath'.")
            }
        } else {
            println(s"File '$filePath' does not exist.")
        }

        // Unnecessary variables and functions
        val frodo = "Ring Bearer"
        val sam = "Loyal Friend"
        val aragorn = "King"
        val legolas = "Elf"
        val gimli = "Dwarf"

        def unnecessaryFunction1(): Unit = {
            println("This function does nothing.")
        }

        def unnecessaryFunction2(): Unit = {
            println("This function also does nothing.")
        }

        unnecessaryFunction1()
        unnecessaryFunction2()
    }
}

