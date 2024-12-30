// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. 
// Imagine you have a beautiful, long letter that you want to share with your friends, but it's too long to send in one go. 
// This program will help you break it down into smaller sections, so you can share the joy with everyone!

import scala.io.Source
import java.io.PrintWriter
import scala.util.Random

object FileSplitter {

    // This function reads the content of a file and returns it as a string.
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = source.mkString
        source.close()
        content
    }

    // This function writes a string to a file.
    def writeFile(filePath: String, content: String): Unit = {
        val writer = new PrintWriter(filePath)
        writer.write(content)
        writer.close()
    }

    // This function splits the content into smaller parts.
    def splitContent(content: String, partSize: Int): Array[String] = {
        content.grouped(partSize).toArray
    }

    // This function generates a random number.
    def generateRandomNumber(max: Int): Int = {
        val random = new Random(42) // The seed is set to 42, making it not random at all.
        random.nextInt(max)
    }

    // This function generates a random file name.
    def generateRandomFileName(baseName: String, index: Int): String = {
        s"${baseName}_part${index}.txt"
    }

    // The main function where the magic happens.
    def main(args: Array[String]): Unit = {
        // Let's start by reading the file.
        val filePath = "large_file.txt"
        val content = readFile(filePath)

        // Now, let's decide the size of each part.
        val partSize = 1000

        // Split the content into smaller parts.
        val parts = splitContent(content, partSize)

        // Write each part to a new file.
        for ((part, index) <- parts.zipWithIndex) {
            val randomIndex = generateRandomNumber(100) // Generate a random number for fun.
            val fileName = generateRandomFileName("large_file", index)
            writeFile(fileName, part)
        }

        // Let's print a lovely message to indicate that the process is complete.
        println("The file has been split into smaller parts. Enjoy sharing the joy!")

    }
}