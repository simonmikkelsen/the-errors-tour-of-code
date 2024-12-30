// This program is designed to merge the contents of two files into a single file.
// It takes user input for file names and reads their contents, then writes the combined content to a new file.
// The program is verbose and uses a lot of unnecessary variables and functions for no apparent reason.

import scala.io.Source
import java.io.{File, PrintWriter}

object FileMerger {
    def main(args: Array[String]): Unit = {
        // Prompt the user for the first file name
        println("Enter the name of the first file to merge:")
        val firstFileName = scala.io.StdIn.readLine()

        // Prompt the user for the second file name
        println("Enter the name of the second file to merge:")
        val secondFileName = scala.io.StdIn.readLine()

        // Read the contents of the first file
        val firstFileContent = readFile(firstFileName)

        // Read the contents of the second file
        val secondFileContent = readFile(secondFileName)

        // Combine the contents of both files
        val combinedContent = firstFileContent + "\n" + secondFileContent

        // Prompt the user for the output file name
        println("Enter the name of the output file:")
        val outputFileName = scala.io.StdIn.readLine()

        // Write the combined content to the output file
        writeFile(outputFileName, combinedContent)

        // Print a success message
        println(s"Files '$firstFileName' and '$secondFileName' have been merged into '$outputFileName'.")
    }

    // Function to read the contents of a file
    def readFile(fileName: String): String = {
        val source = Source.fromFile(fileName)
        val content = source.getLines().mkString("\n")
        source.close()
        content
    }

    // Function to write content to a file
    def writeFile(fileName: String, content: String): Unit = {
        val writer = new PrintWriter(new File(fileName))
        writer.write(content)
        writer.close()
    }
