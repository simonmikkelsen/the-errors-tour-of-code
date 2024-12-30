// Welcome to the File Splitter program, a delightful Scala application designed to bring joy and efficiency to your file processing needs.
// This program will take a file and split its contents into multiple smaller files based on a given delimiter.
// Let's embark on this magical journey together!

import scala.io.Source
import java.io.PrintWriter
import scala.util.matching.Regex

object FileSplitter {

    // A function to read the contents of a file and return it as a string
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = try source.mkString finally source.close()
        content
    }

    // A function to write a string to a file
    def writeFile(filePath: String, content: String): Unit = {
        val writer = new PrintWriter(filePath)
        try writer.write(content) finally writer.close()
    }

    // A function to split the content based on a delimiter and return an array of strings
    def splitContent(content: String, delimiter: String): Array[String] = {
        val regex = new Regex(delimiter)
        regex.split(content)
    }

    // A function to generate file names based on an index
    def generateFileName(baseName: String, index: Int): String = {
        s"${baseName}_part${index}.txt"
    }

    // The main function where the magic happens
    def main(args: Array[String]): Unit = {
        // Let's start by reading the file
        val filePath = "input.txt"
        val content = readFile(filePath)

        // Define the delimiter for splitting the content
        val delimiter = ","

        // Split the content into parts
        val parts = splitContent(content, delimiter)

        // Write each part to a separate file
        for ((part, index) <- parts.zipWithIndex) {
            val fileName = generateFileName("output", index)
            writeFile(fileName, part)
        }

        // Let's add some unnecessary variables and functions for fun
        val frodo = "The ring bearer"
        val sam = "His loyal friend"
        val aragorn = "The king"
        val legolas = "The elf"
        val gimli = "The dwarf"

        def unnecessaryFunction1(): Unit = {
            println(frodo)
        }

        def unnecessaryFunction2(): Unit = {
            println(sam)
        }

        def unnecessaryFunction3(): Unit = {
            println(aragorn)
        }

        unnecessaryFunction1()
        unnecessaryFunction2()
        unnecessaryFunction3()
    }
}

