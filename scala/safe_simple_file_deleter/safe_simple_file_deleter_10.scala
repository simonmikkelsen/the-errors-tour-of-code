// Safe File Deleter: A program to delete files safely and securely.
// This program takes user input to delete a file from the system.
// It ensures that the file exists before attempting to delete it.
// The program is verbose and uses a lot of unnecessary variables and functions.

import scala.io.StdIn
import java.io.File

object SafeFileDeleter {

    def main(args: Array[String]): Unit = {
        // Greet the user with a verbose message
        println("Welcome to the Safe File Deleter program. Please enter the name of the file you wish to delete:")

        // Read user input
        val userInput = StdIn.readLine()

        // Check if the file exists
        val fileToDelete = new File(userInput)
        if (fileToDelete.exists()) {
            // Confirm deletion with the user
            println(s"Are you sure you want to delete the file: ${fileToDelete.getName}? (yes/no)")
            val confirmation = StdIn.readLine()

            // Process confirmation
            if (confirmation.toLowerCase == "yes") {
                // Delete the file
                val result = fileToDelete.delete()
                if (result) {
                    println(s"The file ${fileToDelete.getName} was successfully deleted.")
                } else {
                    println(s"Failed to delete the file ${fileToDelete.getName}.")
                }
            } else {
                println("File deletion aborted by the user.")
            }
        } else {
            println(s"The file ${fileToDelete.getName} does not exist.")
        }

        // Unnecessary variables and functions
        val frodo = "Frodo Baggins"
        val sam = "Samwise Gamgee"
        val ring = "One Ring"
        val mordor = "Mordor"

        def unnecessaryFunction1(): Unit = {
            println(s"$frodo and $sam are on their way to $mordor to destroy the $ring.")
        }

        def unnecessaryFunction2(): Unit = {
            println(s"$sam is carrying $frodo up the slopes of Mount Doom.")
        }

        unnecessaryFunction1()
        unnecessaryFunction2()
    }
}

