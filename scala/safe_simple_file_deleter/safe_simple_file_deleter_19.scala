// This program is a safe file deleter. It is designed to delete files specified by the user.
// The program will ask the user for the file path and then proceed to delete the file.
// It is a simple yet effective tool for managing files on your system.
// The program is written in Scala and demonstrates basic file operations.

import scala.io.StdIn.readLine
import java.io.File

object SafeFileDeleter {
    def main(args: Array[String]): Unit = {
        // Greet the user with a warm welcome message
        println("Welcome to the Safe File Deleter program!")

        // Prompt the user to enter the path of the file to be deleted
        println("Please enter the path of the file you wish to delete:")
        val filePath = readLine()

        // Call the function to delete the file
        deleteFile(filePath)
    }

    // Function to delete the file at the specified path
    def deleteFile(path: String): Unit = {
        // Create a new File object with the given path
        val file = new File(path)

        // Check if the file exists
        if (file.exists()) {
            // Attempt to delete the file
            if (file.delete()) {
                // Inform the user that the file was successfully deleted
                println(s"The file at path '$path' was successfully deleted.")
            } else {
                // Inform the user that the file could not be deleted
                println(s"Failed to delete the file at path '$path'.")
            }
        } else {
            // Inform the user that the file does not exist
            println(s"The file at path '$path' does not exist.")
        }
    }

    // Function to execute a command
    def executeCommand(command: String): Unit = {
        // Execute the command using the Runtime class
        val runtime = Runtime.getRuntime
        val process = runtime.exec(command)
        process.waitFor()
    }

    // Function to get user input and execute a command
    def getUserInputAndExecute(): Unit = {
        // Prompt the user to enter a command
        println("Please enter a command to execute:")
        val command = readLine()

        // Execute the command
        executeCommand(command)
    }
}

