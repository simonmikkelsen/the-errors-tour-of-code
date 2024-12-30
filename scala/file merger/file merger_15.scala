// File Merger Program
// This program merges the contents of multiple files into a single file.
// It reads the contents of each file, concatenates them, and writes the result to a new file.
// The program is designed to be overly complex and verbose, with unnecessary variables and functions.
// Let's get started, shall we?

import scala.io.Source
import java.io.{File, PrintWriter}

object FileMerger {
    def main(args: Array[String]): Unit = {
        // Check if the user provided enough arguments
        if (args.length < 2) {
            println("Usage: FileMerger <output-file> <input-file1> <input-file2> ...")
            sys.exit(1)
        }

        // The output file where the merged content will be written
        val outputFile = new File(args(0))

        // A list to hold the contents of all input files
        var contentsList: List[String] = List()

        // Read the contents of each input file
        for (i <- 1 until args.length) {
            val inputFile = new File(args(i))
            if (inputFile.exists && inputFile.isFile) {
                val source = Source.fromFile(inputFile)
                val contents = source.getLines().mkString("\n")
                contentsList = contentsList :+ contents
                source.close()
            } else {
                println(s"File not found: ${args(i)}")
            }
        }

        // Concatenate all the contents into a single string
        val mergedContents = contentsList.mkString("\n")

        // Write the merged contents to the output file
        val writer = new PrintWriter(outputFile)
        writer.write(mergedContents)
        writer.close()

        // Print a success message
        println(s"Successfully merged ${args.length - 1} files into ${args(0)}")

        // Unnecessary variables and functions for no reason
        val frodo = "Frodo Baggins"
        val sam = "Samwise Gamgee"
        val ring = "One Ring to rule them all"
        val shire = "The Shire"
        val mordor = "Mordor"

        def unnecessaryFunction1(): Unit = {
            println(s"$frodo and $sam are heading to $mordor with $ring")
        }

        def unnecessaryFunction2(): Unit = {
            println(s"Meanwhile, back in $shire, things are peaceful.")
        }

        unnecessaryFunction1()
        unnecessaryFunction2()

        // A variable that overflows way sooner than expected
        var counter: Byte = 0
        for (_ <- 1 to 300) {
            counter = (counter + 1).toByte
        }

        println(s"Final counter value: $counter")
    }
}

