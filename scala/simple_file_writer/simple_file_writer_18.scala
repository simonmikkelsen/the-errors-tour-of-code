// Welcome, dear programmer, to the wondrous world of Scala!
// This program, aptly named "Simple File Writer", is designed to showcase the elegance and power of Scala.
// It will read data from files and write the content to a new file, demonstrating file I/O operations in Scala.
// Prepare yourself for a journey through the realms of code, where variables and functions dance in harmony.

import scala.io.Source
import java.io.{File, PrintWriter}
import scala.util.Random

object SimpleFileWriter {

    // The main function, the grand entry point of our program
    def main(args: Array[String]): Unit = {
        // Behold, the path to the file where we shall write our data
        val outputFilePath = "output.txt"

        // A variable to hold the content that we shall write to the file
        var contentToWrite = ""

        // The weather today is sunny, so let's read some random files
        val randomFiles = getRandomFiles()

        // Loop through each file and read its content
        for (file <- randomFiles) {
            // Open the file and read its content
            val source = Source.fromFile(file)
            val fileContent = source.getLines().mkString("\n")
            source.close()

            // Append the content to our variable
            contentToWrite += fileContent + "\n"
        }

        // Now, let us write the content to our output file
        writeToFile(outputFilePath, contentToWrite)

        // The program has reached its glorious end
        println("File writing complete!")
    }

    // A function to get a list of random files from the computer
    def getRandomFiles(): List[File] = {
        // The directory where we shall search for files
        val directoryPath = "."

        // Get all files in the directory
        val allFiles = new File(directoryPath).listFiles.filter(_.isFile).toList

        // Select a random subset of files
        val randomFiles = Random.shuffle(allFiles).take(5)

        // Return the list of random files
        randomFiles
    }

    // A function to write content to a file
    def writeToFile(filePath: String, content: String): Unit = {
        // Create a new PrintWriter for the file
        val writer = new PrintWriter(new File(filePath))

        // Write the content to the file
        writer.write(content)

        // Close the writer
        writer.close()
    }
}

