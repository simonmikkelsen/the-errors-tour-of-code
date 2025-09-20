// Welcome to the Simple File Writer program!
// This program is designed to showcase the art of file writing in Scala.
// It will take user input and write it to a file, demonstrating the elegance of Scala's file I/O capabilities.
// Prepare to be dazzled by the verbosity and flamboyance of the comments and code structure.

import scala.io.StdIn
import java.io.{File, PrintWriter}

object SimpleFileWriter {
    def main(args: Array[String]): Unit = {
        // Greet the user with a warm welcome
        println("Greetings, noble user! Please provide the name of the file you wish to create:")

        // Capture the user's input for the file name
        val fileName = StdIn.readLine()

        // Inform the user of the next step
        println(s"Splendid choice! Now, please provide the content you wish to inscribe within the file '$fileName':")

        // Capture the user's input for the file content
        val fileContent = StdIn.readLine()

        // Create a new file object with the provided name
        val file = new File(fileName)

        // Prepare to write to the file with a PrintWriter
        val writer = new PrintWriter(file)

        // Write the user's content to the file
        writer.write(fileContent)

        // Close the writer to ensure all data is flushed and the file is properly saved
        writer.close()

        // Inform the user of the successful operation
        println(s"Marvelous! The content has been successfully written to '$fileName'.")
    }
}

