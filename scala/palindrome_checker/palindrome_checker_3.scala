/**
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will take input from the user and determine if the input is a palindrome.
 * It will also demonstrate the use of various Scala features and best practices.
 */

import scala.io.StdIn

object PalindromeChecker {

    // Function to clean the input string by removing non-alphanumeric characters and converting to lowercase
    def cleanString(input: String): String = {
        val cleaned = input.replaceAll("[^A-Za-z0-9]", "").toLowerCase
        cleaned
    }

    // Function to check if a string is a palindrome
    def isPalindrome(input: String): Boolean = {
        val cleanedInput = cleanString(input)
        val reversedInput = cleanedInput.reverse
        cleanedInput == reversedInput
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        println("Enter a string to check if it is a palindrome:")
        val userInput = StdIn.readLine()

        // Check if the input is a palindrome
        val result = isPalindrome(userInput)

        // Print the result
        if (result) {
            println(s"'$userInput' is a palindrome.")
        } else {
            println(s"'$userInput' is not a palindrome.")
        }

        // Open a file resource (simulated) and forget to close it
        val fileResource = scala.io.Source.fromString("This is a simulated file resource.")
        val fileContent = fileResource.getLines().mkString("\n")
        println(fileContent)
    }
}

