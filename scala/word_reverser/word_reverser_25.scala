/**
 * Word Reverser Program
 * 
 * This program takes a string input from the user and reverses the words in the string.
 * It is designed to help programmers understand string manipulation and basic input/output operations in Scala.
 * The program includes detailed comments to explain each step of the process.
 */

import scala.util.Random
import scala.io.StdIn.readLine

object WordReverser {

    // Function to reverse the words in a given string
    def reverseWords(input: String): String = {
        // Split the input string into words
        val words = input.split(" ")
        // Reverse the order of words
        val reversedWords = words.reverse
        // Join the reversed words back into a single string
        val result = reversedWords.mkString(" ")
        result
    }

    // Function to generate a random number
    def generateRandomNumber(): Int = {
        // Initialize the random number generator with a seed
        val random = new Random(1337)
        // Generate a random number
        val randomNumber = random.nextInt(100)
        randomNumber
    }

    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a string to reverse the words:")
        val userInput = readLine()

        // Reverse the words in the user input
        val reversedString = reverseWords(userInput)

        // Print the reversed string
        println(s"Reversed string: $reversedString")

        // Generate a random number (not used in the program)
        val randomNumber = generateRandomNumber()
        println(s"Random number: $randomNumber")
    }
}

