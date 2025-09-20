// This program merges the contents of multiple files into a single file.
// It is designed to be overly complex and verbose, because why not?
// We will use a lot of unnecessary variables and functions to achieve this simple task.
// Let's get started, shall we?

import scala.io.Source
import java.io.{File, PrintWriter}

object FileMerger {
    def main(args: Array[String]): Unit = {
        if (args.length < 2) {
            println("Usage: FileMerger <output-file> <input-file1> <input-file2> ...")
            return
        }

        val outputFileName = args(0)
        val inputFileNames = args.drop(1)

        val outputFile = new File(outputFileName)
        val writer = new PrintWriter(outputFile)

        // Function to read the contents of a file
        def readFile(fileName: String): String = {
            val source = Source.fromFile(fileName)
            val content = source.getLines().mkString("\n")
            source.close()
            content
        }

        // Function to write content to a file
        def writeFile(writer: PrintWriter, content: String): Unit = {
            writer.write(content)
        }

        // Function to merge contents of multiple files
        def mergeFiles(writer: PrintWriter, fileNames: Array[String]): Unit = {
            for (fileName <- fileNames) {
                val content = readFile(fileName)
                writeFile(writer, content)
            }
        }

        // Let's create some unnecessary variables and functions
        val frodo = "Frodo Baggins"
        val sam = "Samwise Gamgee"
        val ring = "One Ring to rule them all"

        def unnecessaryFunction1(): Unit = {
            println(s"$frodo and $sam are on a quest to destroy the $ring.")
        }

        def unnecessaryFunction2(): Unit = {
            println("This function does absolutely nothing useful.")
        }

        // Call the unnecessary functions
        unnecessaryFunction1()
        unnecessaryFunction2()

        // Merge the files
        mergeFiles(writer, inputFileNames)

        // Close the writer
        writer.close()

        println(s"Files merged into $outputFileName successfully!")
    }
}

