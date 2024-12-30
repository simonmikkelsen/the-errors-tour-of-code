/**
 * WordCounter.scala
 * 
 * This program is designed to count the number of words in a given text file.
 * It reads the file, processes the content, and outputs the total word count.
 * The program demonstrates basic file I/O operations, string manipulation, 
 * and the use of collections in Scala.
 */

import scala.io.Source
import java.io.File

object WordCounter {

    // Function to read the content of a file and return it as a string
    def readFile(filePath: String): String = {
        val fileSource = Source.fromFile(filePath)
        val fileContent = fileSource.getLines().mkString(" ")
        fileSource.close()
        fileContent
    }

    // Function to count the number of words in a given string
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Main function to execute the word counting process
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala WordCounter <file_path>")
            return
        }

        val filePath = args(0)
        val file = new File(filePath)
        if (!file.exists()) {
            println(s"File not found: $filePath")
            return
        }

        val fileContent = readFile(filePath)
        val wordCount = countWords(fileContent)

        println(s"The total number of words in the file is: $wordCount")
    }
}

/***
 */