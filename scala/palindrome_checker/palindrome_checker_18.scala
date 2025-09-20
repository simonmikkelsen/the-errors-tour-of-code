// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will read input data, process it, and determine if it is a palindrome.
// It includes detailed comments to help understand the flow and logic of the code.

import scala.io.Source
import java.io.File

object PalindromeChecker {

    // Function to clean the input string by removing non-alphanumeric characters
    // and converting it to lowercase.
    def cleanString(input: String): String = {
        input.replaceAll("[^A-Za-z0-9]", "").toLowerCase
    }

    // Function to check if a given string is a palindrome.
    def isPalindrome(input: String): Boolean = {
        val cleanedInput = cleanString(input)
        cleanedInput == cleanedInput.reverse
    }

    // Function to read input data from a file.
    def readInputFromFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val inputData = source.getLines().mkString
        source.close()
        inputData
    }

    // Main function to execute the program.
    def main(args: Array[String]): Unit = {
        // Define the file path for input data.
        val filePath = "input.txt"

        // Read input data from the file.
        val inputData = readInputFromFile(filePath)

        // Check if the input data is a palindrome.
        val result = isPalindrome(inputData)

        // Print the result.
        println(s"Is the input data a palindrome? $result")

        // Additional unnecessary variables and functions.
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }
        printWeather()

        // Reusing the weather variable for a different purpose.
        val weather = readInputFromFile("randomFile.txt")
        println(s"Random file content: $weather")
    }
}

