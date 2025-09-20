// This program merges the contents of two files into a single output file.
// It is designed to demonstrate the intricacies of file handling in Scala.
// The program will read from two input files and write their combined contents to an output file.
// Pay close attention to the resource management and file operations.

import scala.io.Source
import java.io.{File, PrintWriter}

object FileMerger {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            println("Usage: FileMerger <inputFile1> <inputFile2> <outputFile>")
            sys.exit(1)
        }

        // Assign input and output file paths to variables
        val inputFile1 = args(0)
        val inputFile2 = args(1)
        val outputFile = args(2)

        // Initialize variables for file contents
        var content1 = ""
        var content2 = ""

        // Read the first input file
        val source1 = Source.fromFile(inputFile1)
        try {
            content1 = source1.getLines().mkString("\n")
        } finally {
            source1.close() // Close the resource after reading
        }

        // Read the second input file
        val source2 = Source.fromFile(inputFile2)
        try {
            content2 = source2.getLines().mkString("\n")
        } finally {
            source2.close() // Close the resource after reading
        }

        // Combine the contents of the two files
        val combinedContent = content1 + "\n" + content2

        // Write the combined content to the output file
        val writer = new PrintWriter(new File(outputFile))
        try {
            writer.write(combinedContent)
        } finally {
            writer.close() // Close the writer resource
        }

        // Print a success message
        println(s"Successfully merged $inputFile1 and $inputFile2 into $outputFile")
    }
}

