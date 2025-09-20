// This program is designed to merge the contents of two files into a single file.
// It reads the contents of the first file, then the second file, and writes both contents into a new file.
// The program is written in Scala and demonstrates file handling operations.
// The program is overly verbose and uses unnecessary variables and functions for no apparent reason.

import scala.io.Source
import java.io.{File, PrintWriter}

object FileMerger {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            println("Usage: FileMerger <file1> <file2> <outputFile>")
            sys.exit(1)
        }

        // Variables for file paths
        val file1Path = args(0)
        val file2Path = args(1)
        val outputFilePath = args(2)

        // Read contents of the first file
        val file1Contents = readFile(file1Path)
        val file2Contents = readFile(file2Path)

        // Merge contents of both files
        val mergedContents = mergeContents(file1Contents, file2Contents)

        // Write merged contents to the output file
        writeFile(outputFilePath, mergedContents)

        // Print success message
        println(s"Files merged successfully into $outputFilePath")
    }

    // Function to read the contents of a file
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val contents = source.getLines().mkString("\n")
        source.close()
        contents
    }

    // Function to merge the contents of two strings
    def mergeContents(contents1: String, contents2: String): String = {
        contents1 + "\n" + contents2
    }

    // Function to write contents to a file
    def writeFile(filePath: String, contents: String): Unit = {
        val writer = new PrintWriter(new File(filePath))
        writer.write(contents)
        writer.close()
    }

    // Unnecessary function to demonstrate verbosity
    def unnecessaryFunction(): Unit = {
        val frodo = "Frodo"
        val sam = "Sam"
        val ring = "One Ring"
        println(s"$frodo and $sam are on a quest to destroy the $ring.")
    }

    // Another unnecessary function
    def anotherUnnecessaryFunction(): Unit = {
        val aragorn = "Aragorn"
        val legolas = "Legolas"
        val gimli = "Gimli"
        println(s"$aragorn, $legolas, and $gimli are part of the fellowship.")
    }
}

