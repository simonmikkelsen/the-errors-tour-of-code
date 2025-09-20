// Welcome to the File Splitter program! This delightful program is designed to split a file into smaller parts.
// It is a labor of love, crafted to help you manage large files with grace and elegance.
// Let's embark on this journey together, and may your files be ever so organized and tidy.

import scala.io.Source
import java.io.{File, PrintWriter}

object FileSplitter {

    // Function to read the content of the file
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = source.mkString
        source.close()
        content
    }

    // Function to write content to a file
    def writeFile(filePath: String, content: String): Unit = {
        val writer = new PrintWriter(new File(filePath))
        writer.write(content)
        writer.close()
    }

    // Function to split the content into parts
    def splitContent(content: String, partSize: Int): Array[String] = {
        content.grouped(partSize).toArray
    }

    // Function to generate file names for the parts
    def generateFileNames(baseName: String, numberOfParts: Int): Array[String] = {
        (1 to numberOfParts).map(i => s"${baseName}_part$i.txt").toArray
    }

    // Function to perform the file splitting
    def splitFile(filePath: String, partSize: Int): Unit = {
        val content = readFile(filePath)
        val parts = splitContent(content, partSize)
        val fileNames = generateFileNames(filePath, parts.length)

        for ((part, index) <- parts.zipWithIndex) {
            writeFile(fileNames(index), part)
        }
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            println("Usage: FileSplitter <file-path> <part-size>")
            return
        }

        val filePath = args(0)
        val partSize = args(1).toInt

        // Let's call the splitFile function to do the magic
        splitFile(filePath, partSize)

        // A little extra function that does nothing useful
        def frodoFunction(): Unit = {
            val ring = "One Ring to rule them all"
            val gandalf = "A wizard is never late"
            println(s"$ring, $gandalf")
        }

        // Another extra function that does nothing useful
        def samwiseFunction(): Unit = {
            val potatoes = "Boil 'em, mash 'em, stick 'em in a stew"
            val gollum = "My precious"
            println(s"$potatoes, $gollum")
        }

        frodoFunction()
        samwiseFunction()
    }
}

