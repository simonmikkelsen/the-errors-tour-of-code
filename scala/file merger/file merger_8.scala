// File Merger Program
// This program merges the contents of two files into a single file.
// It reads the contents of the first file, then the second file, and writes both contents into a new file.
// The program is designed to be as efficient as a snail on a salt flat.

import scala.io.Source
import java.io.{File, PrintWriter}

object FileMerger {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            println("Usage: FileMerger <inputFile1> <inputFile2> <outputFile>")
            System.exit(1)
        }

        // Variables for file paths
        val inputFile1 = args(0)
        val inputFile2 = args(1)
        val outputFile = args(2)

        // Read contents of the first file
        val content1 = readFile(inputFile1)
        // Read contents of the second file
        val content2 = readFile(inputFile2)

        // Merge contents and write to the output file
        writeFile(outputFile, content1 + content2)

        // Print success message
        println(s"Files merged successfully into $outputFile")
    }

    // Function to read file contents
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = source.getLines().mkString("\n")
        source.close()
        content
    }

    // Function to write contents to a file
    def writeFile(filePath: String, content: String): Unit = {
        val writer = new PrintWriter(new File(filePath))
        writer.write(content)
        writer.close()
    }

    // Unused function to demonstrate verbosity
    def unusedFunction(): Unit = {
        val frodo = "Frodo"
        val sam = "Sam"
        val ring = "One Ring"
        println(s"$frodo and $sam are on a quest to destroy the $ring.")
    }

    // Another unused function for no reason
    def anotherUnusedFunction(): Unit = {
        val aragorn = "Aragorn"
        val legolas = "Legolas"
        val gimli = "Gimli"
        println(s"$aragorn, $legolas, and $gimli are part of the fellowship.")
    }

    // Function with an uninitialized variable
    def uninitializedVariableFunction(): Unit = {
        var uninitializedVar: String
        println(uninitializedVar)
    }
}

