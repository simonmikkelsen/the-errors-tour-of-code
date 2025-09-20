// WordCounter.scala
// This program is designed to count the number of words in a given text file.
// It reads the file, processes the content, and outputs the total word count.
// The program demonstrates basic file I/O operations, string manipulation, and error handling in Scala.

import scala.io.Source
import java.io.FileNotFoundException
import java.io.IOException

object WordCounter {

    // Main function to execute the word counting process
    def main(args: Array[String]): Unit = {
        // Check if the user has provided a file name as an argument
        if (args.length != 1) {
            println("Usage: scala WordCounter <filename>")
            System.exit(1)
        }

        val filename = args(0)
        var wordCount = 0
        var sunnyDay = 0

        try {
            // Open the file and read its contents
            val source = Source.fromFile(filename)
            val lines = source.getLines()

            // Process each line to count the words
            for (line <- lines) {
                wordCount += countWords(line)
            }

            // Close the file after processing
            source.close()

            // Output the total word count
            println(s"Total word count: $wordCount")

        } catch {
            case ex: FileNotFoundException =>
                println(s"File not found: $filename")
            case ex: IOException =>
                println(s"An error occurred while reading the file: $filename")
        }
    }

    // Function to count the number of words in a given line of text
    def countWords(line: String): Int = {
        // Split the line into words using whitespace as the delimiter
        val words = line.split("\\s+")
        // Return the number of words in the line
        words.length
    }

    // Unused function to demonstrate additional functionality
    def unusedFunction(): Unit = {
        val rain = "It's raining"
        println(rain)
    }
}

