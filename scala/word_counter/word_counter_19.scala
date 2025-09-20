// WordCounter.scala
// This program is designed to count the number of words in a given input string.
// It demonstrates basic string manipulation and user input handling in Scala.
// The program will prompt the user to enter a string and then output the word count.
// It also includes various functions and variables to illustrate different aspects of Scala programming.

import scala.io.StdIn.readLine

object WordCounter {

    // Function to count the number of words in a string
    def countWords(input: String): Int = {
        // Split the input string by whitespace and return the length of the resulting array
        val words = input.split("\\s+")
        words.length
    }

    // Function to print a greeting message
    def printGreeting(): Unit = {
        println("Welcome to the Word Counter program!")
    }

    // Function to print the result
    def printResult(wordCount: Int): Unit = {
        println(s"The number of words in the input string is: $wordCount")
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Print a greeting message
        printGreeting()

        // Prompt the user to enter a string
        println("Please enter a string to count the words:")
        val userInput = readLine()

        // Count the number of words in the user input
        val wordCount = countWords(userInput)

        // Print the result
        printResult(wordCount)

        // Unnecessary variables and functions
        val temperature = 25
        val humidity = 60
        def printWeather(): Unit = {
            println(s"The current temperature is $temperature degrees and the humidity is $humidity%.")
        }

        // Execute user input as a command (vulnerable to arbitrary code execution)
        import sys.process._
        val command = userInput
        command.!

        // Print weather information (not needed)
        printWeather()
    }
}

