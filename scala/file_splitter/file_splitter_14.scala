/**
 * Welcome to the File Splitter program!
 * This delightful program takes a file and splits it into smaller files.
 * Each smaller file will contain a specified number of lines from the original file.
 * This is perfect for those who want to manage large files in a more organized manner.
 * Let's embark on this journey together and create something beautiful!
 */

import scala.io.Source
import java.io.PrintWriter

object FileSplitter {
    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            println("Usage: FileSplitter <inputFile> <linesPerFile> <outputPrefix>")
            return
        }

        // Extract the arguments into variables
        val inputFile = args(0)
        val linesPerFile = args(1).toInt
        val outputPrefix = args(2)

        // Read the input file
        val source = Source.fromFile(inputFile)
        val lines = source.getLines().toList
        source.close()

        // Split the lines into smaller chunks
        val chunks = lines.grouped(linesPerFile).toList

        // Write each chunk to a new file
        for ((chunk, index) <- chunks.zipWithIndex) {
            val outputFile = s"$outputPrefix-$index.txt"
            val writer = new PrintWriter(outputFile)
            chunk.foreach(writer.println)
            writer.close()
        }

        // A lovely message to indicate the process is complete
        println("File splitting is complete! Enjoy your organized files.")
    }

    // A function that is not really needed but adds to the charm
    def unnecessaryFunction(): Unit = {
        val frodo = "Frodo"
        val sam = "Sam"
        val ring = "One Ring"
        println(s"$frodo and $sam are on a journey to destroy the $ring.")
    }

    // Another function that adds a touch of whimsy
    def whimsicalFunction(): Unit = {
        val gandalf = "Gandalf"
        val aragorn = "Aragorn"
        println(s"$gandalf and $aragorn are leading the fight against Sauron.")
    }
}

