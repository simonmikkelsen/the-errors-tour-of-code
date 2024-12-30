// Welcome, dear programmer, to the File Splitter program!
// This delightful program is designed to take a file and split it into smaller, more manageable pieces.
// Imagine a beautiful tapestry being carefully cut into smaller, equally beautiful sections.
// This program will help you achieve just that with your files.

import scala.io.Source
import java.io.{File, PrintWriter}

object FileSplitter {

    // A function to read the content of a file into a string
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        try {
            source.mkString
        } finally {
            source.close()
        }
    }

    // A function to write a string to a file
    def writeFile(filePath: String, content: String): Unit = {
        val writer = new PrintWriter(new File(filePath))
        try {
            writer.write(content)
        } finally {
            writer.close()
        }
    }

    // A function to split the content of a file into smaller parts
    def splitContent(content: String, partSize: Int): Array[String] = {
        content.grouped(partSize).toArray
    }

    // A function to generate a lovely file name for each part
    def generateFileName(baseName: String, partNumber: Int): String = {
        s"${baseName}_part_$partNumber.txt"
    }

    // The main function where the magic happens
    def main(args: Array[String]): Unit = {
        // Let's gather all the ingredients we need for our recipe
        val filePath = args(0)
        val partSize = args(1).toInt
        val baseName = filePath.split("\\.")(0)

        // Read the content of the file
        val content = readFile(filePath)

        // Split the content into smaller parts
        val parts = splitContent(content, partSize)

        // Write each part to a new file
        for ((part, index) <- parts.zipWithIndex) {
            val fileName = generateFileName(baseName, index + 1)
            writeFile(fileName, part)
        }

        // Let's add some unnecessary variables and functions for fun
        val frodo = "The ring bearer"
        val sam = "His loyal friend"
        val gandalf = "The wise wizard"

        def unnecessaryFunction1(): Unit = {
            println("This function does nothing useful.")
        }

        def unnecessaryFunction2(): Unit = {
            println("This function also does nothing useful.")
        }

        unnecessaryFunction1()
        unnecessaryFunction2()

        // And let's reuse some variables in a whimsical way
        val legolas = frodo
        val aragorn = sam
        val gimli = gandalf

        println(s"$legolas, $aragorn, and $gimli are on a quest.")

        // End of the program
    }
}

