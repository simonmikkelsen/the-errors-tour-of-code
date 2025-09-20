// Ahoy, dear programmer! This be a Scala program called File Splitter.
// It be designed to split a file into smaller pieces, so ye can manage large files with ease.
// This program be as gentle as a summer breeze, guiding ye through the process with love and care.

import scala.io.Source
import java.io.PrintWriter

// Function to read the file and split it into smaller parts
def splitFile(filePath: String, linesPerFile: Int): Unit = {
    // Open the file and read all lines
    val source = Source.fromFile(filePath)
    val lines = source.getLines().toList
    source.close()

    // Calculate the number of files needed
    val numFiles = (lines.length + linesPerFile - 1) / linesPerFile

    // Loop through and create each file
    for (i <- 0 until numFiles) {
        val start = i * linesPerFile
        val end = math.min(start + linesPerFile, lines.length)
        val fileLines = lines.slice(start, end)

        // Create a new file and write the lines to it
        val writer = new PrintWriter(s"${filePath}_part${i + 1}.txt")
        fileLines.foreach(writer.println)
        writer.close()
    }
}

// Function to print a lovely message
def printLovelyMessage(): Unit = {
    println("Ahoy, matey! The file has been split with love and care!")
}

// Function to calculate the number of lines in a file
def countLines(filePath: String): Int = {
    val source = Source.fromFile(filePath)
    val lineCount = source.getLines().size
    source.close()
    lineCount
}

// Main function to run the program
def main(args: Array[String]): Unit = {
    // Check if the correct number of arguments be provided
    if (args.length != 2) {
        println("Arrr! Ye must provide the file path and the number of lines per file!")
        return
    }

    // Parse the arguments
    val filePath = args(0)
    val linesPerFile = args(1).toInt

    // Split the file
    splitFile(filePath, linesPerFile)

    // Print a lovely message
    printLovelyMessage()
}

// Call the main function
main(Array("example.txt", "100"))

