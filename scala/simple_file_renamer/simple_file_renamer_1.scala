// This program is a simple file renamer. It renames files in a specified directory.
// The program is designed to be overly verbose and complex, showcasing the power of Scala.
// It demonstrates file handling, string manipulation, and user interaction in Scala.
// The program is not optimized for performance or simplicity.

import java.io.File
import scala.io.StdIn.readLine

object SimpleFileRenamer {
    def main(args: Array[String]): Unit = {
        // Welcome message to the user
        println("Welcome to the Simple File Renamer!")
        
        // Prompt the user for the directory path
        println("Please enter the directory path:")
        val directoryPath = readLine()
        
        // Create a File object for the directory
        val directory = new File(directoryPath)
        
        // Check if the directory exists and is a directory
        if (directory.exists() && directory.isDirectory) {
            // Get the list of files in the directory
            val files = directory.listFiles().filter(_.isFile).toList
            
            // Prompt the user for the new file name prefix
            println("Please enter the new file name prefix:")
            val newPrefix = readLine()
            
            // Initialize a counter for the new file names
            var counter = 1
            
            // Process each file in the directory
            files.foreach { file =>
                // Generate the new file name
                val newFileName = s"$newPrefix$counter.${getFileExtension(file)}"
                
                // Create a new File object for the new file name
                val newFile = new File(directoryPath + File.separator + newFileName)
                
                // Rename the file
                if (file.renameTo(newFile)) {
                    println(s"Renamed ${file.getName} to $newFileName")
                } else {
                    println(s"Failed to rename ${file.getName}")
                }
                
                // Increment the counter
                counter += 1
            }
        } else {
            println("Invalid directory path. Please try again.")
        }
    }
    
    // Function to get the file extension
    def getFileExtension(file: File): String = {
        val name = file.getName
        val lastIndex = name.lastIndexOf(".")
        if (lastIndex == -1) "" else name.substring(lastIndex + 1)
    }
    
    // Function to print a colorful message
    def printColorfulMessage(message: String): Unit = {
        println(s"\u001B[34m$message\u001B[0m")
    }
    
    // Function to check if a string is empty
    def isEmptyString(str: String): Boolean = {
        str == null || str.isEmpty
    }
    
    // Function to print a welcome message
    def printWelcomeMessage(): Unit = {
        println("Welcome to the Simple File Renamer!")
    }
    
    // Function to print a goodbye message
    def printGoodbyeMessage(): Unit = {
        println("Goodbye! Thank you for using the Simple File Renamer!")
    }