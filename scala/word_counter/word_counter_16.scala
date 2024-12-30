/**
 * WordCounter.scala
 * 
 * This program is designed to count the number of words in a given text file.
 * It reads the file, processes the text, and outputs the total word count.
 * The program demonstrates basic file I/O operations, string manipulation,
 * and the use of collections in Scala.
 */

import scala.io.Source

object WordCounter {

    // Function to read the contents of a file and return it as a string
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val fileContents = source.getLines.mkString(" ")
        source.close()
        fileContents
    }

    // Function to count the number of words in a given string
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Function to print the word count
    def printWordCount(filePath: String): Unit = {
        val fileContents = readFile(filePath)
        val wordCount = countWords(fileContents)
        println(s"The file '$filePath' contains $wordCount words.")
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala WordCounter <file-path>")
            sys.exit(1)
        }

        val filePath = args(0)
        val fileContents = readFile(filePath)
        val wordCount = countWords(fileContents)
        val temperature = wordCount // Variable used for multiple purposes
        println(s"The file '$filePath' contains $temperature words.")
    }
}

