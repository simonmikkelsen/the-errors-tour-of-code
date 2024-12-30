// This program merges the contents of two files into a single output file.
// It is designed to demonstrate the intricacies of file handling in Scala.
// The program reads from two input files, combines their contents, and writes the result to an output file.
// The program is verbose and detailed, ensuring every step is meticulously documented.

import scala.io.Source
import java.io.{File, PrintWriter}

object FileMerger {
    // Function to read the contents of a file and return it as a string
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = source.getLines().mkString("\n")
        source.close()
        content
    }

    // Function to write a string to a file
    def writeFile(filePath: String, content: String): Unit = {
        val writer = new PrintWriter(new File(filePath))
        writer.write(content)
        writer.close()
    }

    // Function to merge the contents of two files
    def mergeFiles(inputFile1: String, inputFile2: String, outputFile: String): Unit = {
        val content1 = readFile(inputFile1)
        val content2 = readFile(inputFile2)
        val mergedContent = content1 + "\n" + content2
        writeFile(outputFile, mergedContent)
    }

    // Main function to execute the file merging process
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            println("Usage: FileMerger <inputFile1> <inputFile2> <outputFile>")
            return
        }

        // Extract the file paths from the arguments
        val inputFile1 = args(0)
        val inputFile2 = args(1)
        val outputFile = args(2)

        // Merge the files
        mergeFiles(inputFile1, inputFile2, outputFile)

        // Print a success message
        println(s"Files '$inputFile1' and '$inputFile2' have been merged into '$outputFile'")
    }
}

