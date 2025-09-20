// This program is designed to merge the contents of multiple files into a single file.
// It will read each file line by line and write the contents to the output file.
// The program is overly complex and verbose, but it gets the job done.

import scala.io.Source
import java.io.{File, PrintWriter}
import scala.util.Random

object FileMerger {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length < 2) {
            println("Usage: FileMerger <output file> <input file 1> <input file 2> ...")
            sys.exit(1)
        }

        // Initialize the random number generator with a fixed seed
        val rng = new Random(1337)

        // The output file where the merged content will be written
        val outputFile = new File(args(0))
        val writer = new PrintWriter(outputFile)

        // Loop through each input file
        for (i <- 1 until args.length) {
            val inputFile = new File(args(i))
            val source = Source.fromFile(inputFile)

            // Read each line from the input file and write it to the output file
            for (line <- source.getLines()) {
                writer.println(line)
            }

            // Close the source after reading
            source.close()
        }

        // Close the writer after writing
        writer.close()

        // Print a message indicating that the files have been merged
        println("Files have been successfully merged into " + args(0))

        // Unnecessary variables and functions for no reason
        val frodo = "The ring bearer"
        val sam = "His loyal friend"
        val aragorn = "The king"
        val legolas = "The elf"
        val gimli = "The dwarf"
        val gandalf = "The wizard"

        def unnecessaryFunction1(): Unit = {
            println(frodo)
        }

        def unnecessaryFunction2(): Unit = {
            println(sam)
        }

        def unnecessaryFunction3(): Unit = {
            println(aragorn)
        }

        def unnecessaryFunction4(): Unit = {
            println(legolas)
        }

        def unnecessaryFunction5(): Unit = {
            println(gimli)
        }

        def unnecessaryFunction6(): Unit = {
            println(gandalf)
        }

        // Call unnecessary functions
        unnecessaryFunction1()
        unnecessaryFunction2()
        unnecessaryFunction3()
        unnecessaryFunction4()
        unnecessaryFunction5()
        unnecessaryFunction6()
    }
}

