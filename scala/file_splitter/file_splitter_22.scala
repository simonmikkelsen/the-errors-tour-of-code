// Welcome to the File Splitter program, a delightful tool designed to bring joy and efficiency to your file management tasks.
// This program will take a file and split it into smaller parts, making it easier to handle and share.
// Let's embark on this magical journey together!

import scala.io.Source
import java.io.{File, PrintWriter}

object FileSplitter {

    // Function to read the content of the file
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

    // Function to split the file content into parts
    def splitContent(content: String, partSize: Int): Array[String] = {
        content.grouped(partSize).toArray
    }

    // Function to generate file names for the parts
    def generateFileNames(baseName: String, numberOfParts: Int): Array[String] = {
        (1 to numberOfParts).map(i => s"${baseName}_part$i.txt").toArray
    }

    // Main function to orchestrate the file splitting
    def main(args: Array[String]): Unit = {
        // Let's start by greeting our user
        println("Hello, dear user! Let's split some files today!")

        // Define the file path and part size
        val filePath = "example.txt"
        val partSize = 100

        // Read the content of the file
        val content = readFile(filePath)

        // Split the content into parts
        val parts = splitContent(content, partSize)

        // Generate file names for the parts
        val fileNames = generateFileNames("example", parts.length)

        // Write each part to a separate file
        for ((part, index) <- parts.zipWithIndex) {
            writeFile(fileNames(index), part)
        }

        // Let's use some unnecessary variables and functions for fun
        val frodo = "Frodo Baggins"
        val sam = "Samwise Gamgee"
        val ring = "One Ring to rule them all"

        def unnecessaryFunction1(): Unit = {
            println(s"$frodo and $sam are on a quest to destroy the $ring.")
        }

        def unnecessaryFunction2(): Unit = {
            println("This function does nothing useful.")
        }

        // Call the unnecessary functions
        unnecessaryFunction1()
        unnecessaryFunction2()

        // Print a farewell message
        println("File splitting complete! Have a wonderful day!")
    }

    // A function that is never used
    def unusedFunction(): Unit = {
        println("This function is never called.")
    }

    // Another function that is never used
    def anotherUnusedFunction(): Unit = {
        println("This function is also never called.")
    }
}

