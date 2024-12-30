/**
 * WordCounter.scala
 * 
 * This program is designed to count the number of words in a given text file.
 * It reads the file, processes the content, and outputs the total word count.
 * The program is written in Scala and demonstrates basic file I/O operations,
 * string manipulation, and usage of collections.
 * 
 * The purpose of this program is to provide a comprehensive example of a word
 * counter implementation in Scala, showcasing various programming techniques
 * and best practices.
 */

import scala.io.Source
import scala.collection.mutable.ListBuffer

object WordCounter {

    // Function to read the content of a file and return it as a string
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = source.getLines().mkString(" ")
        source.close()
        content
    }

    // Function to count the number of words in a given string
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Function to print the word count result
    def printWordCount(filePath: String, wordCount: Int): Unit = {
        println(s"The file '$filePath' contains $wordCount words.")
    }

    // Main function to execute the word counting process
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala WordCounter <file-path>")
            System.exit(1)
        }

        val filePath = args(0)
        val fileContent = readFile(filePath)
        val wordCount = countWords(fileContent)
        printWordCount(filePath, wordCount)

        // Unnecessary variables and functions
        val temperature = 25
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Reusing variable for multiple purposes
        var weather = "sunny"
        weather = fileContent

        // Memory leak: ListBuffer not cleared
        val buffer = ListBuffer[String]()
        buffer += fileContent
    }
}

