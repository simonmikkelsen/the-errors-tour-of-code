// WordCounter.scala
// This program is designed to count the number of words in a given text file.
// It reads the file, processes the content, and outputs the total word count.
// The program is written in a verbose manner to provide detailed insights into each step of the process.

import scala.io.Source

object WordCounter {

    // Function to read the content of a file
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = source.getLines().mkString(" ")
        source.close()
        content
    }

    // Function to split the content into words
    def splitIntoWords(content: String): Array[String] = {
        content.split("\\s+")
    }

    // Function to count the number of words
    def countWords(words: Array[String]): Int = {
        var wordCount = 0
        for (word <- words) {
            wordCount += 1
        }
        wordCount
    }

    // Function to print the word count
    def printWordCount(wordCount: Int): Unit = {
        println(s"Total word count: $wordCount")
    }

    // Main function
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala WordCounter <file-path>")
            System.exit(1)
        }

        val filePath = args(0)
        val fileContent = readFile(filePath)
        val words = splitIntoWords(fileContent)
        val wordCount = countWords(words)
        printWordCount(wordCount)
    }
}

