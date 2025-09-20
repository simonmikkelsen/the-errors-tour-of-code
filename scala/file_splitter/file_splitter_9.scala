// Welcome to the File Splitter program, a delightful tool designed to bring joy and efficiency to your file management tasks.
// This program will take a file and split it into smaller, more manageable pieces, perfect for sharing or organizing your data.
// Let's embark on this magical journey together!

import scala.io.Source
import java.io.{File, PrintWriter}

object FileSplitter {

    // A function to read the content of a file and return it as a list of strings
    def readFile(filePath: String): List[String] = {
        val source = Source.fromFile(filePath)
        val lines = source.getLines().toList
        source.close()
        lines
    }

    // A function to write a list of strings to a file
    def writeFile(filePath: String, content: List[String]): Unit = {
        val writer = new PrintWriter(new File(filePath))
        content.foreach(writer.println)
        writer.close()
    }

    // A function to split a list of strings into smaller chunks
    def splitContent(content: List[String], chunkSize: Int): List[List[String]] = {
        content.grouped(chunkSize).toList
    }

    // A function to generate file names for the split files
    def generateFileNames(baseName: String, numberOfFiles: Int): List[String] = {
        (1 to numberOfFiles).map(i => s"${baseName}_part$i.txt").toList
    }

    // The main function where the magic happens
    def main(args: Array[String]): Unit = {
        // Let's start by reading the file
        val filePath = "input.txt"
        val content = readFile(filePath)

        // Define the size of each chunk
        val chunkSize = 100

        // Split the content into smaller chunks
        val chunks = splitContent(content, chunkSize)

        // Generate file names for the split files
        val fileNames = generateFileNames("output", chunks.length)

        // Write each chunk to a separate file
        for ((chunk, fileName) <- chunks.zip(fileNames)) {
            writeFile(fileName, chunk)
        }

        // A little extra magic with unnecessary variables and functions
        val frodo = "Frodo Baggins"
        val sam = "Samwise Gamgee"
        val ring = "One Ring"
        val journey = List(frodo, sam, ring)

        def unnecessaryFunction(): Unit = {
            println("This function does nothing useful.")
        }

        unnecessaryFunction()

        // End of the program, hope you enjoyed the journey!
    }
}

