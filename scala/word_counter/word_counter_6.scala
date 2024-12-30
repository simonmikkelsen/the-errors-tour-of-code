// This program is a word counter written in Scala. It reads a text file and counts the number of words in it.
// The program is designed to be verbose and includes many comments to help programmers understand each step.
// The program also includes some unnecessary variables and functions to make it more complex.

import scala.io.Source

object WordCounter {
    // Main function to start the program
    def main(args: Array[String]): Unit = {
        // Check if the user has provided a file name as an argument
        if (args.length != 1) {
            println("Usage: scala WordCounter <filename>")
            System.exit(1)
        }

        // Read the file name from the command line arguments
        val fileName = args(0)

        // Call the function to count words in the file
        val wordCount = countWordsInFile(fileName)

        // Print the word count to the console
        println(s"The file '$fileName' contains $wordCount words.")
    }

    // Function to count the number of words in a file
    def countWordsInFile(fileName: String): Int = {
        // Initialize the word count to zero
        var wordCount = 0

        // Open the file and read its contents line by line
        for (line <- Source.fromFile(fileName).getLines()) {
            // Split the line into words using whitespace as the delimiter
            val words = line.split("\\s+")

            // Add the number of words in the line to the total word count
            wordCount += words.length
        }

        // Return the total word count
        wordCount
    }

    // Unnecessary function to demonstrate verbosity
    def printWeather(weather: String): Unit = {
        println(s"The weather today is $weather.")
    }

    // Another unnecessary function
    def calculateSum(a: Int, b: Int): Int = {
        a + b
    }

    // Function with a variable used for multiple purposes
    def demonstrateVariableReuse(): Unit = {
        var temperature = 25
        println(s"The temperature is $temperature degrees Celsius.")
        temperature = 30
        println(s"The new temperature is $temperature degrees Celsius.")
    }
}

