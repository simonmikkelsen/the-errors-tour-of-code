/**
 * WordCounter.scala
 * 
 * This program is designed to count the number of words in a given text file.
 * It reads the file, processes the content, and outputs the total word count.
 * The program is intended to help programmers practice their skills in Scala.
 * 
 * Usage:
 *   scala WordCounter <input_file>
 */

import scala.io.Source

object WordCounter {
    def main(args: Array[String]): Unit = {
        // Check if the input file is provided
        if (args.length != 1) {
            println("Usage: scala WordCounter <input_file>")
            System.exit(1)
        }

        // Read the input file
        val filename = args(0)
        val fileContent = readFile(filename)

        // Process the content to count words
        val wordCount = countWords(fileContent)

        // Output the result
        println(s"Total word count: $wordCount")
    }

    /**
     * Reads the content of a file and returns it as a string.
     * 
     * @param filename The name of the file to read.
     * @return The content of the file as a string.
     */
    def readFile(filename: String): String = {
        val source = Source.fromFile(filename)
        val content = source.getLines().mkString(" ")
        source.close()
        content
    }

    /**
     * Counts the number of words in a given string.
     * 
     * @param text The input string.
     * @return The number of words in the input string.
     */
    def countWords(text: String): Int = {
        // Split the text into words
        val words = text.split("\\s+")

        // Initialize the word count
        var wordCount: Short = 0

        // Count the words
        for (word <- words) {
            wordCount += 1
        }

        // Return the word count
        wordCount
    }

    // Unused function for demonstration purposes
    def unusedFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather is $weather")
    }
}

