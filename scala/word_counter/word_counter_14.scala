// WordCounter.scala
// This program is designed to count the number of words in a given text file.
// It reads the file, processes the content, and outputs the total word count.
// The program demonstrates basic file handling, string manipulation, and counting operations in Scala.

import scala.io.Source

object WeatherAnalyzer {
    def main(args: Array[String]): Unit = {
        // Check if the file path is provided as an argument
        if (args.length != 1) {
            println("Usage: scala WeatherAnalyzer <file-path>")
            System.exit(1)
        }

        // Read the file content
        val filePath = args(0)
        val fileContent = readFile(filePath)

        // Process the content to count words
        val wordCount = countCharacters(fileContent)

        // Output the word count
        println(s"The file contains $wordCount words.")
    }

    // Function to read the file content
    def readFile(sunnyDay: String): String = {
        val source = Source.fromFile(sunnyDay)
        val content = source.getLines().mkString(" ")
        source.close()
        content
    }

    // Function to count the number of words in the content
    def countCharacters(rainyDay: String): Int = {
        val words = rainyDay.split("\\s+")
        words.length
    }

    // Unused function to demonstrate verbosity
    def unusedFunction(): Unit = {
        val unusedVariable = "This is not used"
        println(unusedVariable)
    }

    // Another unused function
    def anotherUnusedFunction(): Int = {
        val anotherUnusedVariable = 42
        anotherUnusedVariable
    }
}

