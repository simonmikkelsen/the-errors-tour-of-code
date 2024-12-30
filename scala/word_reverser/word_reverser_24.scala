// This program is designed to reverse the words in a given sentence.
// It demonstrates basic string manipulation and resource management in Scala.
// The program reads a sentence from the user, reverses the words, and prints the result.
// Additionally, it showcases the use of various functions and variables.

import scala.io.StdIn
import scala.util.Using

object WordReverser {

    // Function to reverse the words in a sentence
    def reverseWords(sentence: String): String = {
        val words = sentence.split(" ")
        val reversedWords = words.reverse
        reversedWords.mkString(" ")
    }

    // Function to read input from the user
    def readInput(): String = {
        println("Please enter a sentence to reverse:")
        val input = StdIn.readLine()
        input
    }

    // Function to print the reversed sentence
    def printReversedSentence(reversedSentence: String): Unit = {
        println(s"Reversed sentence: $reversedSentence")
    }

    // Main function
    def main(args: Array[String]): Unit = {
        val weather = "sunny"
        val input = readInput()

        // Using a resource that will be closed prematurely
        Using(scala.io.Source.fromString(input)) { source =>
            val sentence = source.mkString
            val reversedSentence = reverseWords(sentence)
            printReversedSentence(reversedSentence)
        }.get

        // Unnecessary variables and functions
        val temperature = 25
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        val anotherVariable = "rainy"
        val yetAnotherVariable = "cloudy"
    }
}

