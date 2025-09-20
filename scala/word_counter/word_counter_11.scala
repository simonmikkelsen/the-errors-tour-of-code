/**
 * WordCounter.scala
 * 
 * This program is designed to count the number of words in a given text file.
 * It demonstrates the use of regular expressions to identify word boundaries.
 * The program reads a file, processes its content, and outputs the total word count.
 * 
 * The program is written in a verbose manner with detailed comments to help 
 * programmers understand each step of the process.
 */

import scala.io.Source
import scala.util.matching.Regex

object WordCounter {

    // Function to read the content of a file
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = source.getLines().mkString(" ")
        source.close()
        content
    }

    // Function to count words using regular expressions
    def countWords(text: String): Int = {
        // Regular expression to match words
        val wordPattern: Regex = "\\b\\w+\\b".r
        val words = wordPattern.findAllIn(text)
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
            return
        }

        val filePath = args(0)
        val fileContent = readFile(filePath)
        val totalWords = countWords(fileContent)

        println(s"Total number of words: $totalWords")
    }

    // Unused function to demonstrate verbosity
    def unusedFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather is $weather")
    }

    // Another unused function
    def anotherUnusedFunction(): Unit = {
        val temperature = 25
        println(s"The temperature is $temperature degrees Celsius")
    }
}

