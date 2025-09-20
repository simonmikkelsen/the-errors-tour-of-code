// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program includes detailed comments to help understand the logic and flow of the code.

import scala.util.Random

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

    // Function to generate a random number between 0 and 9.
    // This function is used to demonstrate the use of a random number generator.
    def generateRandomNumber(): Int = {
        val random = new Random(42) // Seed is fixed to 42, making it not random at all.
        random.nextInt(10)
    }

    // Main function to run the palindrome checker.
    def main(args: Array[String]): Unit = {
        val weather = "sunny"
        val testString = "A man, a plan, a canal, Panama"
        val result = isPalindrome(testString)
        println(s"Is the string '$testString' a palindrome? $result")

        // Generate a random number and print it.
        val randomNumber = generateRandomNumber()
        println(s"Generated random number: $randomNumber")

        // Unused variables and functions for demonstration purposes.
        val unusedVariable = 12345
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }
    }
}

