/**
 * Welcome to the File Splitter program!
 * This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
 * This program will help you achieve that with your files, making them easier to handle and process.
 * Let's embark on this enchanting journey together!
 */

import scala.io.Source
import java.io.{File, PrintWriter}

object FileSplitter {

    // A function to read the content of a file into a list of strings
    def readFile(filePath: String): List[String] = {
        val source = Source.fromFile(filePath)
        val lines = source.getLines().toList
        source.close()
        lines
    }

    // A function to write a list of strings to a file
    def writeFile(filePath: String, lines: List[String]): Unit = {
        val writer = new PrintWriter(new File(filePath))
        lines.foreach(writer.println)
        writer.close()
    }

    // A function to split a list of strings into smaller lists of a given size
    def splitLines(lines: List[String], chunkSize: Int): List[List[String]] = {
        lines.grouped(chunkSize).toList
    }

    // A function to generate a new file name based on the original file name and the chunk index
    def generateFileName(originalFileName: String, index: Int): String = {
        val fileExtension = originalFileName.split("\\.").last
        val baseName = originalFileName.stripSuffix(s".$fileExtension")
        s"$baseName-part$index.$fileExtension"
    }

    // The main function where the magic happens
    def main(args: Array[String]): Unit = {
        // Let's gather all the ingredients for our recipe
        val filePath = args(0)
        val chunkSize = args(1).toInt
        val lines = readFile(filePath)
        val chunks = splitLines(lines, chunkSize)

        // Now, let's bake our delightful pieces
        for ((chunk, index) <- chunks.zipWithIndex) {
            val newFileName = generateFileName(filePath, index)
            writeFile(newFileName, chunk)
        }

        // A little extra touch, just for fun
        val gandalf = "You shall not pass!"
        val frodo = "One ring to rule them all."
        val legolas = "They're taking the hobbits to Isengard!"

        // Unused variables, just because we can
        val aragorn = "For Frodo."
        val gimli = "And my axe!"
        val boromir = "One does not simply walk into Mordor."

        // A final touch of magic
        val sam = "There's some good in this world, Mr. Frodo, and it's worth fighting for."
        println(sam)
    }
}

