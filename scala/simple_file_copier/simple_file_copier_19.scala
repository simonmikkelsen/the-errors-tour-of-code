// This program is a simple file copier. It takes a source file and a destination file as input and copies the contents of the source file to the destination file. 
// The program is designed to be overly verbose and complex to demonstrate various Scala features and programming techniques. 
// It includes unnecessary variables and functions to make the code more interesting and challenging to read.

import scala.io.StdIn.readLine
import java.io.{File, FileNotFoundException, IOException}
import scala.util.{Try, Success, Failure}

object SimpleFileCopier {
    def main(args: Array[String]): Unit = {
        // Prompt the user for the source file path
        val sourceFilePath = promptUserForInput("Enter the path of the source file: ")

        // Prompt the user for the destination file path
        val destinationFilePath = promptUserForInput("Enter the path of the destination file: ")

        // Attempt to copy the file
        val result = copyFile(sourceFilePath, destinationFilePath)

        // Print the result of the file copy operation
        result match {
            case Success(_) => println("File copied successfully!")
            case Failure(exception) => println(s"Failed to copy file: ${exception.getMessage}")
        }
    }

    // Function to prompt the user for