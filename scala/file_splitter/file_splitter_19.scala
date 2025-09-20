// Welcome to the File Splitter program! This delightful program is designed to help you split a file into smaller chunks.
// Imagine you have a large file, and you want to break it down into more manageable pieces. This program will do just that!
// Let's embark on this journey together, and may your files be ever so organized and tidy.

import scala.io.StdIn
import java.io.{File, PrintWriter}
import scala.io.Source

object FileSplitter {
    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        // Prompt the user for the file path
        println("Please enter the path to the file you wish to split:")
        val filePath = StdIn.readLine()

        // Prompt the user for the number of lines per split file
        println("How many lines would you like each split file to contain?")
        val linesPerFile = StdIn.readInt()

        // Call the function to split the file
        splitFile(filePath, linesPerFile)
    }

    // Function to split the file into smaller chunks
    def splitFile(filePath: String, linesPerFile: Int): Unit = {
        // Open the file for reading
        val source = Source.fromFile(filePath)
        val lines = source.getLines().toList
        source.close()

        // Calculate the number of split files needed
        val numFiles = (lines.length + linesPerFile - 1) / linesPerFile

        // Loop through and create each split file
        for (i <- 0 until numFiles) {
            // Determine the start and end indices for the current chunk
            val start = i * linesPerFile
            val end = math.min(start + linesPerFile, lines.length)

            // Create a new file for the current chunk
            val splitFileName = s"${filePath}_part${i + 1}.txt"
            val writer = new PrintWriter(new File(splitFileName))

            // Write the lines to the