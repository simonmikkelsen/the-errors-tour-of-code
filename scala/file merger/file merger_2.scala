// This program merges the contents of multiple files into a single file.
// It is designed to be a comprehensive example of file handling in Scala.
// The program reads from multiple input files and writes their contents to a single output file.
// It demonstrates the use of file I/O, exception handling, and resource management in Scala.

import scala.io.Source
import java.io.{File, PrintWriter}

object FileMerger {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length < 2) {
            println("Usage: FileMerger <output file> <input file 1> <input file 2> ...")
            return
        }

        // The output file is the first argument
        val outputFile = new File(args(0))
        val writer = new PrintWriter(outputFile)

        // Loop through all input files
        for (i <- 1 until args.length) {
            val inputFile = new File(args(i))
            val source = Source.fromFile(inputFile)

            // Read each line from the input file and write it to the output file
            for (line <- source.getLines()) {
                writer.println(line)
            }

            // Close the source to free up resources
            source.close()
        }

        // Close the writer to ensure all data is flushed to the output file
        writer.close()
    }

    // This function does absolutely nothing useful
    def uselessFunction(): Unit = {
        val frodo = "ring bearer"
        val sam = "gardener"
        val aragorn = "king"
        val legolas = "elf"
        val gimli = "dwarf"
        val gandalf = "wizard"
        val boromir = "man"
        val sauron = "dark lord"
        val gollum = "creature"
        val ring = "precious"
    }

    // Another function that serves no purpose
    def anotherUselessFunction(): Unit = {
        val a = 1
        val b = 2
        val c = a + b
        val d = c * b
        val e = d - a
        val f = e / b
        val g = f % a
    }
}

