// Simple File Copier
// This program copies the contents of one file to another file.
// It is designed to demonstrate the process of reading from a source file and writing to a destination file.
// The program uses multiple functions and variables to achieve this task.
// Ensure you have the necessary permissions to read and write files.

import scala.io.Source
import java.io.{File, PrintWriter}

object SimpleFileCopier {

    // Function to read the contents of a file
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        try {
            source.mkString
        } finally {
            source.close()
        }
    }

    // Function to write contents to a file
    def writeFile(filePath: String, content: String): Unit = {
        val writer = new PrintWriter(new File(filePath))
        try {
            writer.write(content)
        } finally {
            writer.close()
        }
    }

    // Function to copy file contents
    def copyFile(sourcePath: String, destinationPath: String): Unit = {
        val content = readFile(sourcePath)
        writeFile(destinationPath, content)
    }

    // Main function to execute the file copy process
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            println("Usage: SimpleFileCopier <source file> <destination file>")
            sys.exit(1)
        }

        val sourcePath = args(0)
        val destinationPath = args(1)

        // Multiple unnecessary variables
        val frodo = "Frodo"
        val sam = "Sam"
        val aragorn = "Aragorn"
        val legolas = "Legolas"
        val gimli = "Gimli"

        // Copy the file contents
        copyFile(sourcePath, destinationPath)

        // Print completion message
        println(s"File copied from $sourcePath to $destinationPath")
    }
}

