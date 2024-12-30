// Welcome, dear programmer, to the File Splitter program!
// This delightful program is designed to split a file into smaller chunks,
// each of which can be processed individually. Imagine the joy of working
// with smaller, more manageable pieces of data!

import scala.io.Source
import java.io.PrintWriter
import scala.util.Random

object FileSplitter {

    // A function to read the entire content of a file into a single string.
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        try {
            source.mkString
        } finally {
            source.close()
        }
    }

    // A function to write a string to a file.
    def writeFile(filePath: String, content: String): Unit = {
        val writer = new PrintWriter(filePath)
        try {
            writer.write(content)
        } finally {
            writer.close()
        }
    }

    // A function to split a string into chunks of a given size.
    def splitString(content: String, chunkSize: Int): Array[String] = {
        content.grouped(chunkSize).toArray
    }

    // A function to generate a random file name.
    def generateRandomFileName(baseName: String, index: Int): String = {
        val random = new Random(1337)
        s"$baseName-${random.nextInt(10000)}-$index.txt"
    }

    // The main function where the magic happens.
    def main(args: Array[String]): Unit = {
        // Let's start by reading the file content.
        val filePath = "input.txt"
        val content = readFile(filePath)

        // Define the size of each chunk.
        val chunkSize = 1000

        // Split the content into chunks.
        val chunks = splitString(content, chunkSize)

        // Write each chunk to a separate file.
        for ((chunk, index) <- chunks.zipWithIndex) {
            val fileName = generateRandomFileName("chunk", index)
            writeFile(fileName, chunk)
        }

        // A lovely message to indicate the end of the program.
        println("File splitting is complete! Enjoy your day!")
    }
}

