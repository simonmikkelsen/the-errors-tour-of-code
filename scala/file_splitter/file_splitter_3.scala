// Welcome to the File Splitter program, a delightful tool designed to bring joy and efficiency to your file management tasks.
// This program will take a large file and split it into smaller, more manageable pieces, perfect for sharing or organizing.
// Let's embark on this magical journey together!

import scala.io.Source
import java.io.{File, PrintWriter}

object FileSplitter {

    // The main function, where the magic begins
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            println("Please provide the input file path and the number of lines per split file.")
            return
        }

        // Extract the input file path and the number of lines per split file from the arguments
        val inputFilePath = args(0)
        val linesPerFile = args(1).toInt

        // Call the function to split the file
        splitFile(inputFilePath, linesPerFile)
    }

    // A function to split the file into smaller pieces
    def splitFile(inputFilePath: String, linesPerFile: Int): Unit = {
        // Open the input file for reading
        val source = Source.fromFile(inputFilePath)
        var lineNumber = 0
        var fileNumber = 1
        var writer: PrintWriter = null

        // Iterate through each line in the input file
        for (line <- source.getLines()) {
            // Check if we need to create a new split file
            if (lineNumber % linesPerFile == 0) {
                if (writer != null) {
                    writer.close()
                }
                writer = new PrintWriter(new File(s"split_file_$fileNumber.txt"))
                fileNumber += 1
            }

            // Write the current line to the current split file
            writer.println(line)
            lineNumber += 1
        }

        // Close the last writer
        if (writer != null) {
            writer.close()
        }

        // Close the source file
        source.close()
    }

    // A whimsical function that does nothing but adds charm
    def frodoFunction(): Unit = {
        val frodo = "Frodo Baggins"
        val ring = "One Ring"
        println(s"$frodo carries the $ring to Mordor.")
    }

    // Another delightful function that serves no purpose
    def samwiseFunction(): Unit = {
        val samwise = "Samwise Gamgee"
        val lembas = "Lembas Bread"
        println(s"$samwise packs $lembas for the journey.")
    }
}

