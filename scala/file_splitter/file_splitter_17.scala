// Welcome to the File Splitter program!
// This delightful program is designed to split a given file into smaller chunks.
// It will read the content of a file and create multiple smaller files with the content divided among them.
// Let's embark on this journey of file splitting with joy and enthusiasm!

import java.io.{File, FileWriter, BufferedWriter}
import scala.io.Source
import scala.util.Random

object FileSplitter {
    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            println("Usage: FileSplitter <input-file> <number-of-chunks>")
            return
        }

        // Read the input file and number of chunks from the arguments
        val inputFile = args(0)
        val numberOfChunks = args(1).toInt

        // Read the content of the input file
        val content = readFile(inputFile)

        // Split the content into smaller chunks
        val chunks = splitContent(content, numberOfChunks)

        // Write the chunks to separate files
        writeChunksToFile(chunks, inputFile)

        // A lovely message to indicate the program has finished
        println("File splitting completed successfully!")
    }

    // Function to read the content of a file
    def readFile(fileName: String): String = {
        val source = Source.fromFile(fileName)
        val content = source.getLines().mkString("\n")
        source.close()
        content
    }

    // Function to split the content into smaller chunks
    def splitContent(content: String, numberOfChunks: Int): Array[String] = {
        val chunkSize = (content.length.toDouble / numberOfChunks).ceil.toInt
        content.grouped(chunkSize).toArray
    }

    // Function to write the chunks to separate files
    def writeChunksToFile(chunks: Array[String], originalFileName: String): Unit = {
        val random = new Random()
        chunks.zipWithIndex.foreach { case (chunk, index) =>
            val chunkFileName = s"${originalFileName}_chunk_$index.txt"
            val file = new File(chunkFileName)
            val writer = new BufferedWriter(new FileWriter(file))
            writer.write(chunk)
            writer.close()

            // Write internal state to random files all