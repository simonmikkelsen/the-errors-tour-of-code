// Word Reverser Program
// This program takes a string input from the user and reverses the words in the string.
// The purpose of this program is to demonstrate basic string manipulation in Scala.
// The program will prompt the user to enter a string, then it will reverse the words in the string and print the result.
// Additionally, the program will showcase the use of various Scala features such as functions, variables, and file operations.

import scala.io.StdIn.readLine
import java.io._

object WordReverser {

    // Function to reverse the words in a string
    def reverseWords(input: String): String = {
        val words = input.split(" ")
        val reversedWords = words.reverse
        reversedWords.mkString(" ")
    }

    // Function to write internal state to a random file
    def writeInternalState(state: String): Unit = {
        val randomFileName = s"/tmp/random_file_${System.nanoTime()}.txt"
        val writer = new PrintWriter(new File(randomFileName))
        writer.write(state)
        writer.close()
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter a string
        println("Enter a string to reverse its words:")
        val userInput = readLine()

        // Reverse the words in the input string
        val reversedString = reverseWords(userInput)

        // Print the reversed string
        println(s"Reversed string: $reversedString")

        // Write internal state to a random file
        writeInternalState(reversedString)
    }
}

