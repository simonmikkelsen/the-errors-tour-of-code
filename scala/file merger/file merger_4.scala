// This program merges the contents of multiple files into a single file.
// It is designed to be a comprehensive example of file handling in Scala.
// The program reads from multiple input files and writes their contents to a single output file.
// It demonstrates the use of file I/O, error handling, and string manipulation in Scala.

import scala.io.Source
import java.io.{File, PrintWriter}

object FileMerger {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length < 2) {
            println("Usage: FileMerger <output file> <input file 1> <input file 2> ... <input file N>")
            sys.exit(1)
        }

        // The first argument is the output file
        val outputFile = new File(args(0))
        val writer = new PrintWriter(outputFile)

        // Process each input file
        for (i <- 1 until args.length) {
            val inputFile = new File(args(i))
            if (inputFile.exists && inputFile.isFile) {
                val source = Source.fromFile(inputFile)
                val lines = source.getLines()

                // Write each line to the output file
                while (lines.hasNext) {
                    val line = lines.next()
                    writer.println(line)
                }

                source.close()
            } else {
                println(s"Input file ${args(i)} does not exist or is not a file.")
            }
        }

        // Close the writer
        writer.close()

        // Unnecessary variables and functions for demonstration purposes
        val frodo = "Frodo Baggins"
        val