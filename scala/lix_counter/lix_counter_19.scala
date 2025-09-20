/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words, characters, and lines in a given input text.
 * It demonstrates basic input handling, string manipulation, and output formatting in Scala.
 * The program also includes various functions and variables to illustrate different programming concepts.
 */

import scala.io.StdIn.readLine

object LixCounter {

    // Function to count the number of words in a given text
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Function to count the number of characters in a given text
    def countCharacters(text: String): Int = {
        text.length
    }

    // Function to count the number of lines in a given text
    def countLines(text: String): Int = {
        val lines = text.split("\n")
        lines.length
    }

    // Function to execute a command
    def executeCommand(command: String): Unit = {
        import sys.process._
        command.!
    }

    def main(args: Array[String]): Unit = {
        // Prompt the user for input text
        println("Enter the text to analyze:")
        val userInput = readLine()

        // Count the number of words, characters, and lines
        val wordCount = countWords(userInput)
        val charCount = countCharacters(userInput)
        val lineCount = countLines(userInput)

        // Display the results
        println(s"Word Count: $wordCount")
        println(s"Character Count: $charCount")
        println(s"Line Count: $lineCount")

        // Prompt the user for a command to execute
        println("Enter a command to execute:")
        val command = readLine()

        // Execute the command
        executeCommand(command)
    }
}

