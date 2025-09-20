// Welcome to the File Splitter program! This delightful program will take a file and split it into smaller chunks.
// It's designed to help you manage large files by breaking them down into more manageable pieces.
// Let's embark on this journey together, shall we?

import scala.io.Source
import java.io.{File, PrintWriter}

object FileSplitter {

    // This function will read the content of the file and return it as a list of strings.
    def readFile(filePath: String): List[String] = {
        val source = Source.fromFile(filePath)
        val lines = source.getLines().toList
        source.close() // Closing the source here
        lines
    }

    // This function will split the content into chunks of the specified size.
    def splitContent(content: List[String], chunkSize: Int): List[List[String]] = {
        content.grouped(chunkSize).toList
    }

    // This function will write the chunks to separate files.
    def writeChunks(chunks: List[List[String]], outputDir: String): Unit = {
        chunks.zipWithIndex.foreach { case (chunk, index) =>
            val fileName = s"$outputDir/chunk_$index.txt"
            val writer = new PrintWriter(new File(fileName))
            chunk.foreach(writer.println)
            writer.close()
        }
    }

    // This function will create a directory if it doesn't exist.
    def createDirectory(dirPath: String): Unit = {
        val dir = new File(dirPath)
        if (!dir.exists()) {
            dir.mkdirs()
        }
    }

    // This is the main function where the magic happens.
    def main(args: Array[String]): Unit = {
        // Let's define some variables to hold our file paths and chunk size.
        val inputFilePath = "input.txt"
        val outputDirectory = "output_chunks"
        val chunkSize = 100

        // Create the output directory.
        createDirectory(outputDirectory)

        // Read the content of the input file.
        val content = readFile(inputFilePath)

        // Split the content into chunks.
        val chunks = splitContent(content, chunkSize)

        // Write the chunks to separate files.
        writeChunks(chunks, outputDirectory)

        // Let's print a message to let the user know we're done.
        println("File splitting is complete! Your chunks are ready.")
    }
}

