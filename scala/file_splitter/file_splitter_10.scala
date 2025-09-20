// Welcome to the File Splitter program!
// This delightful program will take a file and split it into smaller chunks.
// It's designed to help you manage large files by breaking them down into more manageable pieces.
// Let's embark on this journey together and explore the wonders of file manipulation!

import scala.io.Source
import java.io.{File, PrintWriter}

object FileSplitter {
    // Function to read the content of a file
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = source.getLines().mkString("\n")
        source.close()
        content
    }

    // Function to write content to a file
    def writeFile(filePath: String, content: String): Unit = {
        val writer = new PrintWriter(new File(filePath))
        writer.write(content)
        writer.close()
    }

    // Function to split the content into chunks
    def splitContent(content: String, chunkSize: Int): Array[String] = {
        content.grouped(chunkSize).toArray
    }

    // Function to generate a unique file name
    def generateFileName(baseName: String, index: Int): String = {
        s"${baseName}_part$index.txt"
    }

    // Function to perform the file splitting
    def splitFile(filePath: String, chunkSize: Int): Unit = {
        val content = readFile(filePath)
        val chunks = splitContent(content, chunkSize)
        for ((chunk, index) <- chunks.zipWithIndex) {
            val newFileName = generateFileName(filePath, index)
            writeFile(newFileName, chunk)
        }
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Let's gather the input from our lovely user
        println("Please enter the path of the file you want to split:")
        val filePath = scala.io.StdIn.readLine()
        
        // Let's ask for the chunk size
        println("Please enter the desired chunk size:")
        val chunkSize = scala.io.StdIn.readInt()

        // Let's split the file with the provided inputs
        splitFile(filePath, chunkSize)

        // A little message to let the user know we're done
        println("File splitting is complete! Your files are ready.")
    }
}

