/**
 * WordCounter.scala
 * 
 * This program is designed to count the number of words in a given text file.
 * It reads the file, processes the content, and outputs the total word count.
 * The program is intended to help programmers understand file I/O operations,
 * string manipulation, and basic error handling in Scala.
 */

import scala.io.Source

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
        var wordCount = 0
        for (word <- words) {
            wordCount += 1
        }
        wordCount
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala WordCounter <file-path>")
            System.exit(1)
        }

        val filePath = args(0)
        val fileContent = readFile(filePath)
        val totalWords = countWords(fileContent)

        println(s"Total number of words: $totalWords")
    }

    // Unused function to demonstrate additional functionality
    def unusedFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather today is $weather")
    }
}

