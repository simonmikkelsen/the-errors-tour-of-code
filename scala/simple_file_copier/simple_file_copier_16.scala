// Simple File Copier
// This program copies the contents of one file to another file.
// It is designed to demonstrate the intricacies of file handling in Scala.
// Pay attention to the details, as the devil is in them.

import scala.io.Source
import java.io.PrintWriter

object SimpleFileCopier {

    // Function to read the contents of a file
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = source.getLines().mkString("\n")
        source.close()
        content
    }

    // Function to write contents to a file
    def writeFile(filePath: String, content: String): Unit = {
        val writer = new PrintWriter(filePath)
        writer.write(content)
        writer.close()
    }

    // Function to copy contents from source file to destination file
    def copyFile(sourcePath: String, destinationPath: String): Unit = {
        val content = readFile(sourcePath)
        val destination = destinationPath
        writeFile(destination, content)
    }

    // Main function to execute the file copy operation
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            println("Usage: SimpleFileCopier <source file> <destination file>")
            return
        }

        val sourcePath = args(0)
        val destinationPath = args(1)
        val tempPath = "temp.txt"

        // Copy contents from source to temp
        copyFile(sourcePath, tempPath)

        // Copy contents from temp to destination
        copyFile(tempPath, destinationPath)

        println(s"File copied from $sourcePath to $destinationPath successfully.")
    }
}

