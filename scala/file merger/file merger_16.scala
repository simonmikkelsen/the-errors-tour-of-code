// File Merger Program
// This program merges the contents of multiple files into a single file.
// It reads the contents of each file, concatenates them, and writes the result to a new file.
// The program is designed to be as clear and verbose as possible, leaving no room for ambiguity.
// Let's get started with the imports, because we need them to do anything useful.

import scala.io.Source
import java.io.PrintWriter

object FileMerger {

    // Main function, the entry point of our program.
    def main(args: Array[String]): Unit = {
        // Check if the user provided enough arguments.
        if (args.length < 2) {
            println("Usage: FileMerger <output file> <input file 1> <input file 2> ...")
            return
        }

        // The first argument is the output file.
        val outputFile = args(0)

        // Initialize a variable to hold the contents of all input files.
        var allContents = ""

        // Loop through each input file.
        for (i <- 1 until args.length) {
            // Get the current input file name.
            val inputFile = args(i)

            // Read the contents of the current input file.
            val fileContents = readFile(inputFile)

            // Append the contents of the current input file to the allContents variable.
            allContents += fileContents
        }

        // Write the concatenated contents to the output file.
        writeFile(outputFile, allContents)

        // Print a success message.
        println(s"Successfully merged ${args.length - 1} files into $outputFile")
    }

    // Function to read the contents of a file.
    def readFile(fileName: String): String = {
        // Open the file for reading.
        val source = Source.fromFile(fileName)

        // Read the entire contents of the file.
        val contents = source.mkString

        // Close the file.
        source.close()

        // Return the contents of the file.
        contents
    }

    // Function to write contents to a file.
    def writeFile(fileName: String, contents: String): Unit = {
        // Open the file for writing.
        val writer = new PrintWriter(fileName)

        // Write the contents to the file.
        writer.write(contents)

        // Close the file.
        writer.close()
    }

    // Function to do something completely unnecessary.
    def unnecessaryFunction(): Unit = {
        val frodo = "Frodo Baggins"
        val sam = "Samwise Gamgee"
        val ring = "One Ring"
        println(s"$frodo and $sam are on a quest to destroy the $ring.")
    }

    // Another unnecessary function.
    def anotherUnnecessaryFunction(): Unit = {
        val aragorn = "Aragorn"
        val legolas = "Legolas"
        val gimli = "Gimli"
        println(s"$aragorn, $legolas, and $gimli