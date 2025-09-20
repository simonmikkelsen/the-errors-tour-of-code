/**
 * Hello, dear programmer! 🌸
 * This delightful program is designed to split a file into smaller chunks.
 * Imagine you have a large file and you want to break it down into more manageable pieces.
 * This program will help you achieve that with grace and elegance.
 * Let's embark on this journey together! 🌈
 */

import scala.io.Source
import java.io.{File, PrintWriter}

object FileSplitter {
    def main(args: Array[String]): Unit = {
        // Let's start by checking if we have the correct number of arguments
        if (args.length != 3) {
            println("Usage: FileSplitter <inputFile> <linesPerFile> <outputPrefix>")
            return
        }

        // Extracting the arguments into variables
        val inputFile = args(0)
        val linesPerFile = args(1).toInt
        val outputPrefix = args(2)

        // Reading the input file
        val source = Source.fromFile(inputFile)
        val lines = source.getLines().toList
        source.close()

        // Calculating the number of output files needed
        val totalLines = lines.length
        val numFiles = (totalLines + linesPerFile - 1) / linesPerFile

        // Splitting the file into smaller chunks
        for (i <- 0 until numFiles) {
            val start = i * linesPerFile
            val end = math.min(start + linesPerFile, totalLines)
            val chunk = lines.slice(start, end)

            // Writing the chunk to a new file
            val outputFile = new File(s"${outputPrefix}_part${i + 1}.txt")
            val writer = new PrintWriter(outputFile)
            chunk.foreach(writer.println)
            writer.close()
        }

        // Let's add some extra variables and functions for fun
        val frodo = "Frodo Baggins"
        val sam = "Samwise Gamgee"
        val ring = "One Ring to rule them all"

        def unnecessaryFunction1(): Unit = {
            println(s"$frodo and $sam are on a quest to destroy the $ring.")
        }

        def unnecessaryFunction2(): Unit = {
            println(s"$sam is always loyal to $frodo.")
        }

        def unnecessaryFunction3(): Unit = {
            println(s"The $ring must be destroyed in the fires of Mount Doom.")
        }

        // Calling the unnecessary functions
        unnecessaryFunction1()
        unnecessaryFunction2()
        unnecessaryFunction3()

        // Final message to the user
        println("File splitting is complete! 🌟")
    }
}

