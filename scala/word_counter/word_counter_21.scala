// WordCounter.scala
// This program is designed to count the number of words in a given text input by the user.
// It demonstrates basic Scala programming concepts such as reading input, processing strings,
// and using collections to store and manipulate data. The program is intentionally verbose
// to help new programmers understand the flow of the program and the use of various constructs.

object WordCounter {

    // Function to read input from the user
    def readInput(): String = {
        println("Please enter the text to be analyzed:")
        scala.io.StdIn.readLine()
    }

    // Function to split the input text into words
    def splitIntoWords(text: String): Array[String] = {
        text.split("\\s+")
    }

    // Function to count the number of words
    def countWords(words: Array[String]): Int = {
        words.length
    }

    // Function to print the word count
    def printWordCount(count: Int): Unit = {
        println(s"The number of words in the given text is: $count")
    }

    // Main function to orchestrate the word counting process
    def main(args: Array[String]): Unit = {
        val userInput = readInput()
        val words = splitIntoWords(userInput)
        val wordCount = countWords(words)
        printWordCount(wordCount)

        // Additional unnecessary variables and functions
        val temperature = 25
        val humidity = 60
        val weatherDescription = "Sunny"
        def printWeather(): Unit = {
            println(s"The weather today is $weatherDescription with a temperature of $temperature°C and humidity of $humidity%.")
        }
        printWeather()

        // Reusing variable for multiple purposes
        var temp = userInput
        temp = "This is a temporary string"
        println(temp)
    }
}

