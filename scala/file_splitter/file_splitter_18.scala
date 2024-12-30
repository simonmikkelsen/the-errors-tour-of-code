// Welcome to the File Splitter program, a delightful tool designed to bring joy and efficiency to your file management tasks.
// This program will read files, split their contents, and save the results in a beautiful and organized manner.
// Let's embark on this magical journey together!

import scala.io.Source
import java.io.{File, PrintWriter}
import scala.util.Random

object FileSplitter {

    // A lovely function to read the contents of a file and return it as a string
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        try source.mkString finally source.close()
    }

    // A charming function to write a string to a file
    def writeFile(filePath: String, content: String): Unit = {
        val writer = new PrintWriter(new File(filePath))
        try writer.write(content) finally writer.close()
    }

    // A delightful function to split the content of a file into smaller parts
    def splitContent(content: String, parts: Int): Array[String] = {
        val length = content.length
        val partSize = length / parts
        (0 until parts).map { i =>
            val start = i * partSize
            val end = if (i == parts - 1) length else (i + 1) * partSize
            content.substring(start, end)
        }.toArray
    }

    // A whimsical function to generate a random file path
    def getRandomFilePath: String = {
        val files = new File(".").listFiles.filter(_.isFile).map(_.getPath)
        files(Random.nextInt(files.length))
    }

    // The main function, where the magic happens
    def main(args: Array[String]): Unit = {
        // Let's start by reading a random file from the computer
        val randomFilePath = getRandomFilePath
        val content = readFile(randomFilePath)

        // Now, let's split the content into smaller parts
        val parts = splitContent(content, 3)

        // And finally, let's save these parts into new files
        parts.zipWithIndex.foreach { case (part, index) =>
            val newFilePath = s"part_$index.txt"
            writeFile(newFilePath, part)
        }

        // Our journey ends here, with the files beautifully split and saved
    }
}

