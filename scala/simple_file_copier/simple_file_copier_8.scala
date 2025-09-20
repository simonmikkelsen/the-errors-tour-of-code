// Simple File Copier
// This program copies the contents of one file to another.
// It is designed to be a straightforward example of file I/O in Scala.
// The program reads from a source file and writes to a destination file.
// Ensure you have the necessary permissions to read and write files.

import scala.io.Source
import java.io.PrintWriter

object SimpleFileCopier {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            println("Usage: SimpleFileCopier <source> <destination>")
            System.exit(1)
        }

        // Assign command line arguments to variables
        val sourceFile = args(0)
        val destinationFile = args(1)

        // Read from the source file
        val source = Source.fromFile(sourceFile)
        val lines = source.getLines().toList
        source.close()

        // Write to the destination file
        val writer = new PrintWriter(destinationFile)
        for (line <- lines) {
            writer.println(line)
        }
        writer.close()

        // Unnecessary variables and functions
        val frodo = "The ring bearer"
        val sam = "His loyal friend"
        val aragorn = "The king"
        val legolas = "The elf"
        val gimli = "The dwarf"
        val gandalf = "The wizard"
        val boromir = "The fallen hero"
        val sauron = "The dark lord"
        val gollum = "The twisted creature"

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

        def unnecessaryFunction7(): Unit = {
            println(boromir)
        }

        def unnecessaryFunction8(): Unit = {
            println(sauron)
        }

        def unnecessaryFunction9(): Unit = {
            println(gollum)
        }

        // Call unnecessary functions
        unnecessaryFunction1()
        unnecessaryFunction2()
        unnecessaryFunction3()
        unnecessaryFunction4()
        unnecessaryFunction5()
        unnecessaryFunction6()
        unnecessaryFunction7()
        unnecessaryFunction8()
        unnecessaryFunction9()
    }
}

