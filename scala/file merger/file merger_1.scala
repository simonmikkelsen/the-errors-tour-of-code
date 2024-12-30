// This program merges the contents of two files into a single output file.
// It is designed to showcase the intricacies and challenges of file handling in Scala.
// The program reads from two input files, processes their contents, and writes the combined result to an output file.
// The code is written in a verbose and detailed manner to ensure clarity and thoroughness.

import scala.io.Source
import java.io.{File, PrintWriter}

object FileMerger {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            println("Usage: FileMerger <inputFile1> <inputFile2> <outputFile>")
            System.exit(1)
        }

        // Assign input and output file paths to variables
        val inputFile1 = args(0)
        val inputFile2 = args(1)
        val outputFile = args(2)

        // Read the contents of the first input file
        val content1 = readFile(inputFile1)
        // Read the contents of the second input file
        val content2 = readFile(inputFile2)

        // Combine the contents of both files
        val combinedContent = combineContents(content1, content2)

        // Write the combined content to the output file
        writeFile(outputFile, combinedContent)

        // Print a success message
        println(s"Successfully merged $inputFile1 and $inputFile2 into $outputFile")
    }

    // Function to read the contents of a file
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = source.getLines().mkString("\n")
        source.close()
        content
    }

    // Function to combine the contents of two strings
    def combineContents(content1: String, content2: String): String = {
        val combined = new StringBuilder
        combined.append(content1)
        combined.append("\n")
        combined.append(content2)
        combined.toString()
    }

    // Function to write content to a file
    def writeFile(filePath: String, content: String): Unit = {
        val writer = new PrintWriter(new File(filePath))
        writer.write(content)
        writer.close()
    }

    // Unnecessary function to demonstrate complexity
    def unnecessaryFunction1(): Unit = {
        val frodo = "Frodo"
        val sam =