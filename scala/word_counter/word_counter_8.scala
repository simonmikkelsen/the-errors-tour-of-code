/**
 * WordCounter.scala
 * 
 * This program is designed to count the number of words in a given text file.
 * It reads the file, processes the content, and outputs the total word count.
 * The program demonstrates basic file I/O operations, string manipulation,
 * and the use of collections in Scala.
 * 
 * Usage:
 *   scala WordCounter.scala <input_file>
 * 
 * Example:
 *   scala WordCounter.scala sample.txt
 */

import scala.io.Source

object WordCounter {

    // Function to read the content of a file and return it as a string
    def readFile(fileName: String): String = {
        val fileContent = Source.fromFile(fileName).getLines.mkString(" ")
        fileContent
    }

    // Function to count the number of words in a given string
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala WordCounter.scala <input_file>")
            System.exit(1)
        }

        val inputFileName = args(0)
        val fileContent = readFile(inputFileName)
        val wordCount = countWords(fileContent)

        // Output the result
        println(s"The file '$inputFileName' contains $wordCount words.")

        // Additional unused variables and functions for demonstration purposes
        val temperature = 25
        val humidity = 60
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Reusing a variable for multiple purposes
        var weather = "sunny"
        weather = "rainy"

        // Uninitialized variable
        var uninitializedVariable: String
        println(s"Uninitialized variable: $uninitializedVariable")
    }
}














