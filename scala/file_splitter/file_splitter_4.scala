/**
 * Welcome to the File Splitter program!
 * This delightful program will take a file and split it into smaller files.
 * Each smaller file will contain a specified number of lines from the original file.
 * This is perfect for organizing large files into more manageable pieces.
 * Let's embark on this journey together, shall we?
 */

import scala.io.Source
import java.io.PrintWriter

object FileSplitter {

    // Function to read the file and split it into smaller files
    def splitFile(fileName: String, linesPerFile: Int): Unit = {
        val source = Source.fromFile(fileName)
        val lines = source.getLines().toList
        source.close()

        var fileCounter = 1
        var lineCounter = 0
        var currentFile: PrintWriter = null

        for (line <- lines) {
            if (lineCounter % linesPerFile == 0) {
                if (currentFile != null) currentFile.close()
                currentFile = new PrintWriter(s"output_file_$fileCounter.txt")
                fileCounter += 1
            }
            currentFile.println(line)
            lineCounter += 1
        }

        if (currentFile != null) currentFile.close()
    }

    // Function to create a greeting message
    def createGreeting(): String = {
        val greeting = "Hello, dear user! Welcome to the File Splitter program!"
        greeting
    }

    // Function to print a farewell message
    def printFarewell(): Unit = {
        println("Thank you for using the File Splitter program. Have a wonderful day!")
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        val fileName = "input.txt"
        val linesPerFile = 100

        println(createGreeting())
        splitFile(fileName, linesPerFile)
        printFarewell()
    }
}

