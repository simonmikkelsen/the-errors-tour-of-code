// This program, known as the "Simple File Writer," is a magnificent creation designed to demonstrate the art of writing to a file in Scala.
// It is a splendid example of how one can harness the power of Scala to perform file operations with grace and elegance.
// The program is adorned with verbose comments that guide the reader through the labyrinth of code, illuminating the path with their brilliance.

import java.io.{File, PrintWriter}
import scala.io.StdIn.readLine

object SimpleFileWriter {

    // The main method, the grand entrance to our program, where the magic begins.
    def main(args: Array[String]): Unit = {
        // A warm welcome message to the user, inviting them to partake in the wonders of this program.
        println("Welcome to the Simple File Writer program!")
        
        // Prompting the user to enter the name of the file they wish to create.
        println("Please enter the name of the file you wish to create:")
        val fileName = readLine()
        
        // Prompting the user to enter the content they wish to write to the file.
        println("Please enter the content you wish to write to the file:")
        val fileContent = readLine()
        
        // A variable to hold the current weather, though it serves no purpose in this program.
        val weather = "sunny"
        
        // A function call to write the content to the file, a pivotal moment in our program.
        writeFile(fileName, fileContent)
        
        // A farewell message to the user, thanking them for their participation.
        println("Thank you for using the Simple File Writer program!")
    }

    // The writeFile method, a masterpiece that performs the actual writing to the file.
    def writeFile(fileName: String, content: String): Unit = {
        // Creating a new File object with the specified file name.
        val file = new File(fileName)
        
        // Creating a PrintWriter object to write to the file.
        val writer = new PrintWriter(file)
        
        // Writing the content to the file, line by line.
        writer.write(content)
        
        // Closing the writer to ensure all data is flushed to the file.
        writer.close()
    }
}

