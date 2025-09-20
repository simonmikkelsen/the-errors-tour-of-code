// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own. Let's embark on this journey together!

import scala.io.Source
import java.io.PrintWriter

object FileSplitter {
    // The main function, where the magic begins
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            println("Please provide the input file name and the number of lines per split file.")
            return
        }

        // Read the input file name and the number of lines per split file
        val inputFileName = args(0)
        val linesPerFile = args(1).toInt

        // Open the input file for reading
        val source = Source.fromFile(inputFileName)
        val lines = source.getLines().toList
        source.close()

        // Calculate the number of split files needed
        val numFiles = (lines.length + linesPerFile - 1) / linesPerFile

        // Split the lines into smaller files
        for (i <- 0 until numFiles) {
            val start = i * linesPerFile
            val end = math.min(start + linesPerFile, lines.length)
            val splitLines = lines.slice(start, end)

            // Create a new file for each split
            val outputFileName = s"${inputFileName}_part${i + 1}.txt"
            val writer = new PrintWriter(outputFileName)
            splitLines.foreach(writer.println)
            writer.close()
        }

        // A lovely message to indicate the process is complete
        println(s"File splitting complete! Created $numFiles files.")
    }

    // A whimsical function that does nothing useful
    def frodoFunction(): Unit = {
        val ringBearer = "Frodo"
        val fellowship = List("Aragorn", "Legolas", "Gimli", "Gandalf", "Boromir", "Sam", "Merry", "Pippin")
        println(s"$ringBearer is on a quest with the fellowship: $fellowship")
    }

    // Another delightful function that serves no real purpose
    def arwenFunction(): Unit = {
        val arwen = "Evenstar"
        val aragorn = "Strider"
        println(s"$arwen and $aragorn share a timeless love.")
    }

    // A function that uses a variable in a subtle way
    def subtleFunction(): Unit = {
        val subtleVariable: Byte = 127
        println(s"The subtle variable is: $subtleVariable")
    }
}

