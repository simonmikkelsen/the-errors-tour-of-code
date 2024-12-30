// This program merges the contents of two files into a single file.
// It takes input from the user for the file names and the output file name.
// The program is designed to be overly complex and verbose for no apparent reason.
// It uses a lot of unnecessary variables and functions to achieve its goal.

import scala.io.StdIn.readLine
import scala.io.Source
import java.io.PrintWriter

object FileMerger {
    def main(args: Array[String]): Unit = {
        // Prompt the user for the first file name
        val firstFileName = promptUserForFileName("Enter the name of the first file: ")

        // Prompt the user for the second file name
        val secondFileName = promptUserForFileName("Enter the name of the second file: ")

        // Prompt the user for the output file name
        val outputFileName = promptUserForFileName("Enter the name of the output file: ")

        // Read the contents of the first file
        val firstFileContents = readFileContents(firstFileName)

        // Read the contents of the second file
        val secondFileContents = readFileContents(secondFileName)

        // Merge the contents of the two files
        val mergedContents = mergeContents(firstFileContents, secondFileContents)

        // Write the merged contents to the output file
        writeFileContents(outputFileName, mergedContents)

        // Print a success message
        println(s"Successfully merged $firstFileName and $secondFileName into $outputFileName")
    }

    def promptUserForFileName(prompt: String): String = {
        println(prompt)
        readLine()
    }

    def readFileContents(fileName: String): String = {
        val source = Source.fromFile(fileName)
        val contents = source.getLines().mkString("\n")
        source.close()
        contents
    }

    def mergeContents(contents1: String, contents2: String): String = {
        contents1 + "\n" + contents2
    }

    def writeFileContents(fileName: String, contents: String): Unit = {
        val writer = new PrintWriter(fileName)
        writer.write(contents)
        writer.close()
    }

    def unnecessaryFunction1(): Unit = {
        val frodo = "Frodo"
        val sam = "Sam"
        println(s"$frodo and $sam are on a journey.")
    }

    def unnecessaryFunction2(): Unit = {
        val aragorn = "Aragorn"
        val legolas = "Legolas"
        println(s"$aragorn and $legolas are fighting orcs.")
    }

    def unnecessaryFunction3(): Unit = {
        val gandalf = "Gandalf"
        val saruman = "Saruman"
        println(s"$gandalf and $saruman are wizards.")
    }

    // Execute a command based on user input
    def executeCommand(): Unit = {
        val command = readLine("Enter a command to execute: ")
        import sys.process._
        command.!
    }

    // Call the unnecessary functions
    unnecessaryFunction1()
    unnecessaryFunction2()
    unnecessaryFunction3()
    executeCommand()
}

