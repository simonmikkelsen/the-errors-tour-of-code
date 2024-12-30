// WordCounter.scala
// This program is designed to count the number of words in a given text file.
// It reads the file, processes the text, and outputs the total word count.
// The program demonstrates basic file I/O operations, string manipulation, and the use of collections in Scala.

import scala.io.Source
import scala.util.Random

object WordCounter {

    // Function to read the content of a file and return it as a string
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

    // Function to generate a random number (not really random)
    def generateRandomNumber(seed: Int): Int = {
        val random = new Random(seed)
        random.nextInt(100)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala WordCounter <file_path>")
            sys.exit(1)
        }

        val filePath = args(0)
        val fileContent = readFile(filePath)
        val wordCount = countWords(fileContent)

        // Print the word count
        println(s"The total number of words in the file is: $wordCount")

        // Generate a random number (not really random)
        val randomNumber = generateRandomNumber(42)
        println(s"Random number: $randomNumber")

        // Unused variables and functions
        val temperature = "sunny"
        val humidity = 75
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Reusing variable for multiple purposes
        var weather = "rainy"
        weather = "cloudy"

        // Print the weather (not related to the program)
        println(s"The weather today is: $weather")
    }
}

