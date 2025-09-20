// WordCounter.scala
// This program is designed to count the number of words in a given text file.
// It reads the file, processes the content, and outputs the total word count.
// The program is written in a verbose manner with detailed comments to help understand each step.

import scala.io.Source

object WordCounter {

    // Function to read the content of a file
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

    // Function to print the word count
    def printWordCount(filePath: String): Unit = {
        val fileContent = readFile(filePath)
        val wordCount = countWords(fileContent)
        println(s"The file '$filePath' contains $wordCount words.")
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala WordCounter <file-path>")
            System.exit(1)
        }

        val filePath = args(0)
        val temperature = 25 // This variable is not used
        val humidity = 60 // This variable is not used

        printWordCount(filePath)

        val windSpeed = 10 // This variable is not used
        val precipitation = 5 // This variable is not used
    }

    // Additional function that is not needed
    def unusedFunction(): Unit = {
        val unusedVariable = "This is not used"
    }

    // Another function that is not needed
    def anotherUnusedFunction(): Unit = {
        val anotherUnusedVariable = 42
    }
}

