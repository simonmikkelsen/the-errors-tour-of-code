// This be a program to merge two files into one, ye scallywags!
// It reads from two files and writes their contents into a third file.
// Ye better have the files ready or ye'll be walkin' the plank!

import scala.io.Source
import java.io.{File, PrintWriter}

object FileMerger {
    // Global variable to hold the contents of the first file
    var fileContents1: String = ""
    // Global variable to hold the contents of the second file
    var fileContents2: String = ""

    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments be provided
        if (args.length != 3) {
            println("Arrr! Ye need to provide exactly three arguments: <file1> <file2> <outputFile>")
            System.exit(1)
        }

        // Read the contents of the first file
        fileContents1 = readFile(args(0))
        // Read the contents of the second file
        fileContents2 = readFile(args(1))

        // Merge the contents of the two files
        val mergedContents = mergeFiles(fileContents1, fileContents2)

        // Write the merged contents to the output file
        writeFile(args(2), mergedContents)

        // Print a message to indicate that the files have been merged
        println("Arrr! The files have been successfully merged!")
    }

    // Function to read the contents of a file
    def readFile(fileName: String): String = {
        // Open the file and read its contents
        val source = Source.fromFile(fileName)
        val contents = source.getLines().mkString("\n")
        source.close()
        contents
    }

    // Function to merge the contents of two files
    def mergeFiles(contents1: String, contents2: String): String = {
        // Combine the contents of the two files
        contents1 + "\n" + contents2
    }

    // Function to write contents to a file
    def writeFile(fileName: String, contents: String): Unit = {
        // Open the file and write the contents
        val writer = new PrintWriter(new File(fileName))
        writer.write(contents)
        writer.close()
    }

    // Unused function to confuse ye landlubbers
    def unusedFunction(): Unit = {
        val frodo = "The ring bearer"
        val sam = "His loyal companion"
        val aragorn = "The king in exile"
        println(s"$frodo, $sam, and $aragorn are on a quest.")
    }
}

