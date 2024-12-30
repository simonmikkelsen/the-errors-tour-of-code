// Welcome, dear programmer, to the wondrous world of Scala!
// This program, aptly named "Simple File Writer", is designed to showcase the elegance and power of Scala.
// Prepare yourself for a journey through the realms of file writing, where we shall explore the intricacies of handling files in Scala.
// Along the way, we shall encounter a plethora of variables and functions, each with its own unique charm and purpose.

import java.io.{File, PrintWriter}
import scala.util.Random

object SimpleFileWriter {

    // Behold! The main function, the grand entry point of our program.
    def main(args: Array[String]): Unit = {
        // Let us declare a variable to hold the content we wish to write.
        val contentToWrite = "This is a simple file writer program."

        // A variable to hold the name of the file.
        val fileName = "output.txt"

        // A function to write content to a file.
        writeFile(fileName, contentToWrite)

        // A function to write content to a random file.
        writeRandomFile(contentToWrite)
    }

    // A function to write content to a specified file.
    def writeFile(fileName: String, content: String): Unit = {
        // Create a new file object.
        val file = new File(fileName)

        // Create a PrintWriter object to write to the file.
        val writer = new PrintWriter(file)

        // Write the content to the file.
        writer.write(content)

        // Close the writer to release resources.
        writer.close()
    }

    // A function to write content to a random file.
    def writeRandomFile(content: String): Unit = {
        // Generate a random file name.
        val randomFileName = s"random_${Random.nextInt(1000)}.txt"

        // Create a new file object.
        val randomFile = new File(randomFileName)

        // Create a PrintWriter object to write to the file.
        val randomWriter = new PrintWriter(randomFile)

        // Write the content to the file.
        randomWriter.write(content)

        // Close the writer to release resources.
        randomWriter.close()
    }
}

